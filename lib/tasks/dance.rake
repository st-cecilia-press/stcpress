require 'yaml'
require 'find'

namespace :dance do
  task :sources => :environment do
    sources = YAML.load_file('public/sca_dance/sources.yaml')
    sources.each do |source|
      DanceSource.create do |s|
        s.slug = source['slug']
        s.title = source['title']
        if source['dates']
          s.start_date = source['dates'][0]
          if source['dates'].count == 1
            s.end_date = source['dates'][0]
          else
            s.end_date = source['dates'][1]
          end
        end 
      end
    end
  end
  task :ensembles => :environment do
    ensembles = YAML.load_file('public/sca_dance/ensembles.yaml')
    ensembles.each do |ens|
      Ensemble.create do |e|
        e.slug = ens['slug']
        e.name = ens['name']
        e.description = ens['description']
      end      
      puts ens['name']
    end
  end
  task :dances => :environment do
    Dir.chdir('public/sca_dance/'){ |d|
      directories = Dir.glob('*').select{|f| File.directory? f }      
      directories.each do |slug|
        puts slug
        metadata = YAML.load_file("#{slug}/metadata.yaml")
        media = nil
        if File.file?("#{slug}/media.yaml")
          media = YAML.load_file("#{slug}/media.yaml")
        end
        DanceMetadata.new(metadata, slug, media)
      end
    }    
  end

  task :db_reset => :environment do
    Rake::Task['db:reset'].invoke 
    Rake::Task['db:migrate'].invoke 
  end

  task :all => [:db_reset, :sources, :ensembles, :dances]
end
class DanceMetadata
  def initialize(metadata, slug, media)
    @metadata = metadata
    @media = media
    @slug = slug
    sheet_music unless media.nil?
    audio unless media.nil?
    @dance = dance
    sources
    instructions
    #instructions_sheet_music unless media.nil?
  end
  def audio
    @media['audio'].each do |audio|
      myAudio = AudioRecording.create do |a|
        a.file = "/sca_dance/#{@slug}/#{audio['file']}"
        a.ensemble_id = Ensemble.find_by(slug: audio['ensemble']).id
        a.purchase_url = audio['purchase_url']
        a.youtube = audio['youtube']
        a.slug = audio['slug'] 
      end
    end
  end
  def sheet_music
    @media['sheet_music'].each do |sm|
      mySM = SheetMusic.create do |s|
        s.slug = sm['slug']
        s.name = sm['name']
      end
      sm['music_files'].each do |mf|
        mus_file = MusicFile.create do |m|
          m.filename = "/sca_dance/#{@slug}/#{mf['filename']}"
          m.source = mf['source']
          m.name = mf['name']
          m.sheet_music_id = mySM.id
        end
      end
    end    
  end

  def dance
    Dance.create do |d|
      d.title = @metadata['title']
      d.slug = @slug
      d.person = Person.find_or_create_by(name: @metadata['person'])
      d.dance_category = DanceCategory.find_or_create_by(name: @metadata['category'])
    end 
  end
  def sources
    if @metadata['sources']
      @metadata['sources'].each do |source|
        s = DanceSource.find_by(slug: source['slug'])
        sc = DanceSourceContent.create(dance: @dance, dance_source: s)
        if source['images']
          images(source['images'], sc.id)
        end
        if source['translations']
          translations(source['translations'], sc.id)
        end
      end
    end
  end

  def images(img_array, content_id)
    img_array.each do |image|
      DanceFacsimileImage.create do |dfi|
        dfi.dance_source_content_id = content_id
        dfi.url = image['url'] if image['url']
        dfi.filename = image['filename'] if image['filename']
        dfi.name = image['name'] if image['name']
        dfi.description = image['description'] if image['description']
      end
    end
  end

  def translations (trans_array, content_id)
    trans_array.each do |tr|
      DanceTranslation.create do |dt|
        dt.dance_source_content_id = content_id
        dt.url = tr['url']
        dt.name = tr['name']    
      end
    end
  end

  def instructions
    if @metadata['instructions']
      @metadata['instructions'].each do |inst|
        file = File.open("#{@slug}/#{inst['filename']}")
        text = file.read
        myInst = Instruction.create do |i|
          i.text = text
          #i.instruction_type = inst['instruction_type']
          i.dance = @dance
          i.person = Person.find_or_create_by(name: inst['person'])
        end
        if inst['sheet_music']
          inst['sheet_music'].each do |sm_slug|
            InstructionSheetmusic.create(instruction: myInst, sheet_music: SheetMusic.find_by(slug: sm_slug))        
          end
        end
        if inst['audio']
          inst['audio'].each do |audio_slug|
            InstructionAudio.create(instruction: myInst, audio_recording: AudioRecording.find_by(slug: audio_slug))
          end
        end
        if inst['video']
          inst['video'].each do |video|
            VideoRecording.create(instruction: myInst, name: video['name'], youtube: video['youtube'])
          end
        end
        file.close
      end
    end
  end
end

require 'yaml'
require 'find'
namespace :init_db do
  task :gervaise_quart => :environment do
    Dir.chdir('public/gervaise_quart_livre_de_danceries'){ |p|
      metadata = YAML.load_file('metadata.yaml')
      composer = Composer.find_or_create_by(name: metadata['composer'])
      directories = Dir.glob('*').select {|f| File.directory? f and f != "include"}
      #book = Book.create do |b|
      #  b.slug = 'gervaise_quart_livre_de_danceries'
      #  b.title = metadata['title']
      #  b.date = Date.new(metadata['date'])
      #end
      directories.each do |slug|
        title = slug.gsub(/_\d_/,'_').gsub('_',' ').split.map { |i| i.capitalize }.join(' ')
        puts title
        #piece = Piece.create do |p|
        #  p.title = title
        #  p.composer = composer
        #  p.slug = slug
        #  p.repo = 'gervaise_quart_livre_de_danceries'
        #end
        #bc = BookContent.create(piece: piece, book: book)
        image_paths = []
        Find.find("./#{slug}") do |path|
          image_paths << path if path =~ /.*\.png$/
        end
        image_paths.each do |image|
          num = image.match(/(\d)+.png$/)[1] 
          name = "Facsimile of #{title}"
          name = "#{name} pg #{num}" unless num.nil?
          puts name
        #  img = Image.create do |i|
        #    i.book_content_id =  bc.id 
        #    i.filename = image
        #    i.name = name
        #  end
        end
      end
    }
  end
  task :miscellaneous => :environment do
    Dir.chdir('public/miscellaneous'){|p|
      directories = Dir.glob('*').select {|f| File.directory? f and f != "include" and f !=  "test" and f != "metadata"}
      directories.each do |slug|
        metadata = YAML.load_file("#{slug}/metadata.yaml")
        c = Composer.find_or_create_by(name: metadata['composer'])
        piece = Piece.create do |p|
          p.title = metadata['title']
          p.composer = c
          p.slug = slug
          p.repo = 'miscellaneous'
        end
        metadata['voicings'].each do |voicing|
          v = Voicing.find_or_create_by(name: voicing) 
          sv = SongVoicing.create(piece: piece, voicing: v) 
        end
        if metadata["manuscripts"]
          metadata["manuscripts"].each do |manuscript|
            m = Manuscript.find_by(name: manuscript["name"]) 
            mc = ManuscriptContent.create(piece: piece, manuscript: m, position: manuscript["position"], diamm: manuscript["diamm"])
            if manuscript["images"]
              manuscript["images"].each do |image|
                img = Image.create do |i|
                  i.manuscript_content_id =  mc.id 
                  i.url =  image["url"]  if image["url"]
                  i.filename =  image["filename"] if image["filename"]
                  i.name =  image["name"] if image["name"]
                  i.description =  image["description"] if image["description"]
                end
              end
            end
          end
        end
        if metadata["books"]
          metadata["books"].each do |book|
            b = Book.find_by(slug: book["slug"])
            puts piece.title if b.nil? 
            bc = BookContent.create(piece: piece, book: b)
            if book["images"]
              book["images"].each do |image|
                img = Image.create do |i|
                  i.book_content_id =  bc.id 
                  i.url =  image["url"]  if image["url"]
                  i.filename =  image["filename"] if image["filename"]
                  i.name =  image["name"] if image["name"]
                  i.description =  image["description"] if image["description"]
                end
              end
            end
          end
        end
      end

    }
  end

  task :db_reset => :environment do
    Rake::Task['db:reset'].invoke 
    Rake::Task['db:migrate'].invoke 
    Rake::Task['db:seed'].invoke 
  end
  
  task :all => [:db_reset, :miscellaneous]
end

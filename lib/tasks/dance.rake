require 'yaml'
require 'find'

namespace :dance do
  task :dances => :environment do
    Dir.chdir('public/sca_dance/'){ |d|
      directories = Dir.glob('*').select{|f| File.directory? f }      
      directories.each do |slug|
        puts slug
        metadata = YAML.load_file("#{slug}/metadata.yaml")
        DanceMetadata.new(metadata, slug)
      end
    }    
  end

  task :db_reset => :environment do
    Rake::Task['db:reset'].invoke 
    Rake::Task['db:migrate'].invoke 
  end

  task :all => [:db_reset, :dances]
end
class DanceMetadata
  def initialize(metadata, slug)
    @metadata = metadata
    @slug = slug
    @dance = dance
    instructions
  end

  def dance
    Dance.create do |d|
      d.title = @metadata['title']
      d.slug = @slug
      d.person = Person.find_or_create_by(name: @metadata['person'])
      d.dance_category = DanceCategory.find_or_create_by(name: @metadata['category'])
    end 
  end

  def instructions
    if @metadata['instructions']
      @metadata['instructions'].each do |inst|
        file = File.open("#{@slug}/#{inst['filename']}")
        text = file.read
        Instruction.create do |i|
          i.text = text
          #i.instruction_type = inst['instruction_type']
          i.dance = @dance
          i.person = inst['person']
        end
        file.close
      end
    end
  end
end

require 'yaml'
namespace :init_db do
  task :miscellaneous => :environment do
    Dir.chdir('public/miscellaneous'){|p|
      directories = Dir.glob('*').select {|f| File.directory? f and f != "include" and f !=  "test"}
      directories.each do |slug|
        metadata = YAML.load_file("#{slug}/metadata.yaml")
        c = Composer.find_or_create_by(name: metadata['composer'])
        piece = Piece.create do |p|
          p.title = metadata['title']
          p.composer = c
          p.slug = slug
          p.repo = 'miscellaneous'
        end
        if metadata["manuscripts"]
          metadata["manuscripts"].each do |manuscript|
            m = Manuscript.find_by(name: manuscript["name"]) 
            mc = ManuscriptContent.create(piece: piece, manuscript: m)
            mc.position = manuscript["position"] 
            mc.diamm = manuscript["diamm"] 
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

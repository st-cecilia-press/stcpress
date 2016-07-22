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

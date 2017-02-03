require 'yaml'
require 'find'

namespace :init_db do
  task :manuscripts => :environment do
    Dir.chdir('public/miscellaneous/include'){ |pub|
      metadata = YAML.load_file('manuscripts.yaml')
      metadata.each do |man|
        manuscript = Manuscript.create do |m|
          m.slug = man['slug']
          m.name = man['name']
          m.archive = man['archive']
          m.shelfmark = man['shelfmark']
          m.diamm = man['diamm']
          m.description = man['description']
        end
      end
    }    
  end
  task :books => :environment do
    Dir.chdir('public/miscellaneous/include'){ |pub|
      metadata = YAML.load_file('books.yaml')
      metadata.each do |book|
        Book.create do |b|
          b.slug = book['slug']
          b.title = book['title']
          b.date = Date.new(book['date'])
        end
      end
    }    
  end
  task :gervaise_quart => :environment do
    r = InstrumentalBook.create do |r|
      r.slug = 'gervaise_quart_livre_de_danceries'
      r.name = 'Gervaise Quart Livre De Danceries'
    end
    Dir.chdir('public/gervaise_quart_livre_de_danceries'){ |p|
      metadata = YAML.load_file('metadata.yaml')
      composer = Composer.find_or_create_by(name: metadata['composer'])
      book = Book.find_or_create_by(slug: 'gervaise_quart_livre_de_danceries') do |b|
        b.title = metadata['title']
        b.date = Date.new(metadata['date'])
      end
      
      metadata["pieces"].each do |piece|
        puts piece["slug"]
        title = piece["slug"].gsub(/_\d_/,'_').gsub('_',' ').split.map { |i| i.capitalize }.join(' ')
        title = "#{title}: #{piece["title"]}" if piece["title"]
        my_piece = Piece.create do |p|
          p.title = title
          p.composer = composer
          p.slug = piece["slug"]
          p.start_date = metadata['date']
          p.end_date = metadata['date']
        end
        piece['voicings'].each do |voicing|
          v = Voicing.find_or_create_by(name: voicing) 
          sv = SongVoicing.create(piece: my_piece, voicing: v) 
        end

        t = Tag.find_or_create_by(name: 'instrumental')
        tagging = Tagging.create(piece: my_piece, tag: t)

        publicationship = Publicationship.create(piece: my_piece, repository: r)
        bc = BookContent.create(piece: my_piece, book: book)
        image_paths = []
        Find.find("./#{piece["slug"]}") do |path|
          image_paths << File.basename(path) if path =~ /.*\.png$/
        end
        image_paths.each do |image|
          num = image.match(/(\d)+.png$/)[1] if image.match(/(\d)+.png$/)
          name = "Facsimile of #{title}"
          name = "#{name} pg #{num}" unless num.nil?
          img = Image.create do |i|
            i.book_content_id =  bc.id 
            i.filename = image
            i.name = name
            i.url = '/gervaise_quart_livre_de_danceries/IMSLP168106-PMLP299254-Quart-Livre-de-Danceries-Claude-Gervaise.pdf'
          end
        end
      end
    }
  end
  task :miscellaneous => :environment do
    r = VocalCollection.create do |r|
      r.slug = 'miscellaneous'
      r.name = "Monique's Miscellaneous Editions"
    end
    Dir.chdir('public/miscellaneous'){|p|
      directories = Dir.glob('*').select {|f| File.directory? f and f != "include" and f !=  "test" and f != "metadata"}
      directories.each do |slug|
        puts slug
        metadata = YAML.load_file("#{slug}/metadata.yaml")
        c = Composer.find_or_create_by(name: metadata['composer'])
        start_date = 0 
        end_date = 0
        if metadata['dates']
          if metadata['dates'].count == 1
            start_date = metadata['dates'][0]
            end_date = metadata['dates'][0]
          else
            start_date = metadata['dates'][0]
            end_date = metadata['dates'][1]
          end
        end
        piece = Piece.create do |p|
          p.title = metadata['title']
          p.composer = c
          p.slug = slug
          p.start_date = start_date
          p.end_date = end_date
        end
        metadata['voicings'].each do |voicing|
          v = Voicing.find_or_create_by(name: voicing) 
          sv = SongVoicing.create(piece: piece, voicing: v) 
        end
        if metadata["tags"]
          metadata['tags'].each do |tag|
            t = Tag.find_or_create_by(name: tag)
            tagging = Tagging.create(piece: piece, tag: t)
          end
        end
        t = Tag.find_or_create_by(name: 'original language')
        tagging = Tagging.create(piece: piece, tag: t)
        if metadata["language"]
          metadata['language'].each do |lang|
            l = Language.find_or_create_by(name: lang)
            pl = PieceLanguage.create(piece: piece, language: l)
          end
        end
        publicationship = Publicationship.create(piece: piece, repository: r)
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

  task :kasha => :environment do
    repo = TranslationsCollection.create do |r|
      r.slug = 'bel-accueil'
      r.name = 'Bel Accueil: Carol\'s Translations'
    end
    Dir.chdir('public/bel-accueil'){ |folder|
      directories = Dir.glob('*').select {|f| File.directory? f and f != "include" and f !=  "test" and f != "metadata"}
      directories.each do |slug|
        puts slug
        metadata = YAML.load_file("./#{slug}/metadata.yaml")
        p = Piece.find_or_create_by(slug: slug)
        if p.title.nil?
          start_date = 0
          end_date = 0
          if metadata['dates'].count == 1
            start_date = metadata['dates'][0]
            end_date = metadata['dates'][0]
          else
            start_date = metadata['dates'][0]
            end_date = metadata['dates'][1]
          end
          p.title = metadata['title']
          c = Composer.find_or_create_by(name: metadata['composer'])
          p.composer = c
          p.start_date = start_date
          p.end_date = end_date
          metadata['voicings'].each do |voicing|
              v = Voicing.find_or_create_by(name: voicing)
              sv = SongVoicing.create(piece: p, voicing: v)
          end
          
          if metadata["tags"]
            metadata['tags'].each do |tag|
              t = Tag.find_or_create_by(name: tag)
              tagging = Tagging.create(piece: p, tag: t)
            end
          end
          if metadata["language"]
            metadata['language'].each do |lang|
              l = Language.find_or_create_by(name: lang)
              pl = PieceLanguage.create(piece: p, language: l)
            end
          end

        end
        pub = Publicationship.create(piece: p, repository: repo)
        t = Tag.find_or_create_by(name: 'translation')
        tagging = Tagging.create(piece: p, tag: t)
      end
    }
  end

  task :db_reset => :environment do
    Rake::Task['db:reset'].invoke 
    Rake::Task['db:migrate'].invoke 
    #Rake::Task['db:seed'].invoke 
  end
  
  task :json => :environment do
    Rake::Task["json:search"].invoke
  end

  task :reset_gervaise => [:db_reset, :manuscripts, :books, :gervaise_quart, :json]
  task :reset_misc => [:db_reset, :manuscripts, :books, :miscellaneous, :json]
  task :reset_kasha => [:db_reset, :manuscripts, :books, :kasha, :json]
  task :all => [:db_reset, :manuscripts, :books, :miscellaneous, :gervaise_quart, :kasha, :json]
end

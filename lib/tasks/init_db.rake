require 'yaml'
require 'find'

def process_metadata(slug, repository)
  puts slug
  metadata = YAML.load_file("#{slug}/metadata.yaml")
  c = Composer.find_or_create_by(name: metadata['composer'])
  piece = Piece.create do |p|
    p.title = metadata['title']
    p.composer = c
    p.slug = slug
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
  if metadata["language"]
    metadata['language'].each do |lang|
      l = Language.find_or_create_by(name: lang)
      pl = PieceLanguage.create(piece: piece, language: l)
    end
  end
  publicationship = Publicationship.create(piece: piece, repository: repository)
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
  return piece
end
namespace :init_db do
  task :gervaise_quart => :environment do
    r = InstrumentalBook.create do |r|
      r.slug = 'gervaise_quart_livre_de_danceries'
      r.name = 'Gervaise Quart Livre De Danceries'
    end
    Dir.chdir('public/gervaise_quart_livre_de_danceries'){ |p|
      metadata = YAML.load_file('metadata.yaml')
      composer = Composer.find_or_create_by(name: metadata['composer'])
      book = Book.create do |b|
        b.slug = 'gervaise_quart_livre_de_danceries'
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
        piece = process_metadata(slug, r)
        t = Tag.find_or_create_by(name: 'original language')
        tagging = Tagging.create(piece: piece, tag: t)
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
        piece = process_metadata(slug, repo)
        t = Tag.find_or_create_by(name: 'translation')
        tagging = Tagging.create(piece: p, tag: t)
      end
    }
  end

  task :db_reset => :environment do
    Rake::Task['db:reset'].invoke 
    Rake::Task['db:migrate'].invoke 
    Rake::Task['db:seed'].invoke 
  end
  
  task :all => [:db_reset, :miscellaneous, :gervaise_quart, :kasha]
end

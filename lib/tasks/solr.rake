require 'csv'
task :solr => :environment do
  docs = Array.new
  Piece.first(100).each do |piece|
    hash = {
      'id' => "piece_#{piece.id}",
      'title' => piece.title,
      'composer' => piece.composer.name,
      'slug' => piece.slug,
      'url' => "/pieces/#{piece.slug}",
      'model' => "piece"
    }
    hash['tag'] = piece.tags.map{|x| x.name} if piece.tags.count > 0
    hash['book'] = piece.books.map{|x| x.title} if piece.books.count > 0
    hash['manuscript'] = piece.manuscripts.map{|x| x.name} if piece.manuscripts.count > 0
    hash['voicing'] = piece.voicings.map{|x| x.name} if piece.voicings.count > 0
    hash['language'] = piece.languages.map{|x| x.name} if piece.languages.count > 0
    if piece.start_date == piece.end_date
      hash['dates'] = piece.start_date
    else 
      hash['dates'] = "[#{piece.start_date} TO #{piece.end_date}]"
    end
    if piece.lyrics?
      lyrics = CSV.read("public/bel-accueil/#{piece.slug}/lyrics.csv").drop(1).transpose.map{ |x| x.join(" ") }
      lyrics.delete_at(1) if lyrics[1] =~ /LINK/
      hash['lyrics'] = lyrics 
    end
    docs.push(hash)
  end 
  Composer.all.each do |c|
    hash = {
      'id' => "composer_#{c.id}",
      'title' => c.name,
      'pieces' => c.pieces.map{|p| p.title },
      'url' => "/composers/#{c.slug}",
      'model' => 'composer',
    }
    docs.push(hash)
  end
  Book.all.each do |b|
    hash = {
      'id' => "book_#{b.id}",
      'title' => b.title,
      'composer' => b.pieces.map{|p| p.composer.name}.uniq,
      'pieces' => b.pieces.map{|p| p.title },
      'dates' => b.date,
      'url' => "/books/#{b.slug}",
      'model' => 'book',
    }
    docs.push(hash)
  end
  Manuscript.all.each do |m|
    hash = {
      'id' => "manuscript_#{m.id}",
      'title' => m.name,
      'composer' => m.pieces.map{|p| p.composer.name}.uniq,
      'pieces' => m.pieces.map{|p| p.title },
      'archive' => "#{m.archive} #{m.shelfmark}",
      'url' => "/manuscripts/#{m.slug}",
      'model' => 'manuscript',
    }
    docs.push(hash)
  end
  File.open('./solr/docs.json', 'w'){ |file| file.write(docs.to_json) }
end

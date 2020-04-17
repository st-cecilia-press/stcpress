task :solr => :environment do
  pieces = Array.new
  Piece.all.each do |piece|
    pieces.push({
      'id' => piece.id,
      'title' => piece.title,
      'composer' => piece.composer.name,
    });  
  end 
  File.open('./solr/docs.json', 'w'){ |file| file.write(pieces.to_json) }
end

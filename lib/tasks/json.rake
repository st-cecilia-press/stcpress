namespace :json do
    task :search => :environment do 
        @pieces = Piece.all
        array = Array.new
        @pieces.each do |piece|
            array.push({'title' => piece.title, 'composer' => piece.composer.name, 'slug' => piece.slug})
        end
        File.open('./public/json/search.json', 'w'){ |file| file.write(array.to_json) }
    end
end

namespace :json do
    task :search => :environment do 
        @pieces = Piece.all
        array = Array.new
        @pieces.each do |piece|
            array.push({'title' => piece.title, 'composer' => piece.composer.name, 'slug' => piece.slug})
        end
        File.open('./public/json/search.json', 'w'){ |file| file.write(array.to_json) }
        dances = Array.new 
        Dance.all.each do |dance|
          dances.push({'title' => dance.title, 'slug' => dance.slug});
        end
        File.open('./public/json/dance_search.json', 'w'){ |file| file.write(dances.to_json) }
    end
end

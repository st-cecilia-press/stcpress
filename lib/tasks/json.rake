namespace :json do
    task :search => :environment do 
        dances = Array.new 
        Dance.all.each do |dance|
          dances.push({'title' => dance.title, 'slug' => dance.slug});
        end
        File.open('./public/json/dance_search.json', 'w'){ |file| file.write(dances.to_json) }
    end
end

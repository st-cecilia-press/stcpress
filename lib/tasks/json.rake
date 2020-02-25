namespace :json do
    task :search => :environment do 
        Dir.mkdir('./public/json') unless File.exists?('./public/json')
        dances = Array.new 
        Dance.all.each do |dance|
          dances.push({'value' => dance.title, 'slug' => dance.slug});
        end
        File.open('./public/json/dance_search.json', 'w'){ |file| file.write(dances.to_json) }
    end
end

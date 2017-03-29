task :info => :environment do
  cat = DanceCategory.find_by(name: 'Italian Balli - 15th Century')
  cat.dances.order(:title).each do |d|
    puts d.slug
  end
end

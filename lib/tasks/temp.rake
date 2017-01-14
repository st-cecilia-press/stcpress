require 'yaml'
namespace :temp do
  task :books => :environment do
    book_yaml = []
    books = Book.all
    books.each do | book|
      book_yaml.push({
        'slug' => book.slug,
        'title' => book.title,
        'date' => book.date.strftime("%Y").to_i
      })
    end
    puts book_yaml.to_yaml
  end
  task :manuscripts => :environment do
    man_yaml = []
    manuscripts = Manuscript.all
    manuscripts.each do | man|
      man_yaml.push({
        'slug' => man.slug,
        'name' => man.name,
        'archive' => man.archive,
        'shelfmark' => man.shelfmark,
        'diamm' => man.diamm,
        'description' => man.diamm,
      })
    end
    puts man_yaml.to_yaml
  end
end

require 'yaml'
namespace :temp do
  task :blah => :environment do
    pieces = Piece.where(repo: 'gervaise_quart_livre_de_danceries')
    puts pieces
  end
end

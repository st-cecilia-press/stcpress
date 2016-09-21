require 'yaml'
class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @book = Book.find_by(slug: params[:slug])
    @composers = @book.pieces.map { |p| p.composer}.uniq 
    @pieces = @book.pieces
    if @book.slug == 'gervaise_quart_livre_de_danceries'
      metadata = YAML.load_file('public/gervaise_quart_livre_de_danceries/metadata.yaml') 
      @compilations = metadata['compilations']
      render 'gervaise' 
    end
  end
end

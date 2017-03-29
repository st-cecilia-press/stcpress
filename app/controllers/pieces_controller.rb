require 'csv'
class PiecesController < ApplicationController
  def index
    @pieces = Piece.all
  end

  def show
    @piece = Piece.find_by(slug: params[:slug])
    @lyrics = nil
    if @piece.lyrics?
      @lyrics = CSV.read("public/bel-accueil/#{params[:slug]}/lyrics.csv")       
    end
  end
end

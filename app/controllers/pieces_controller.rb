class PiecesController < ApplicationController
  def index
    @pieces = Piece.all
  end

  def show
    @piece = Piece.find_by(slug: params[:slug])
  end
end

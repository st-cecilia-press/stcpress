class PiecesController < ApplicationController
  def index
    @pieces = Piece.all
  end

  def show
    @piece = Piece.find_by(repo: params[:repo], slug: params[:slug])
  end
end

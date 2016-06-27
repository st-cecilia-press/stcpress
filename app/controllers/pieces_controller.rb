class PiecesController < ApplicationController
  def index
    @pieces = Piece.all
  end

  def show
    @piece = Piece.where(repo: params[:repo]).where(slug: params[:slug]).first
  end
end

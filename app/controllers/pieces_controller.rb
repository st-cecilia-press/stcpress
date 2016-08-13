class PiecesController < ApplicationController
  def index
    @pieces = Piece.all
  end

  def show
    if params[:repo].present?
      @piece = Piece.find_by(repo: params[:repo], slug: params[:slug])
    else
      pieces = Piece.where(slug: params[:slug])
      if pieces.count == 1
        @piece = pieces.first
      elsif pieces.count > 1
        @pieces = pieces
        render template: "pieces/disambiguate"
      end
      
    end
  end
end

class PiecesController < ApplicationController
  def index
    @pieces = Piece.all
  end

  def show
    if params[:repo].present?
      @piece = Piece.find_by(repo: params[:repo], slug: params[:slug])
      render template: "pieces/gervaise" if @piece.repo == 'gervaise_quart_livre_de_danceries'
    else
      pieces = Piece.where(slug: params[:slug])
      if pieces.count == 1
        @piece = pieces.first
        render template: "pieces/gervaise" if @piece.repo == 'gervaise_quart_livre_de_danceries'
      elsif pieces.count > 1
        @pieces = pieces
        render template: "pieces/disambiguate"
      end
    end
  end
end

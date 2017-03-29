module Api
  class PiecesController < ApplicationController
    def search
      query = "%#{params['q']}%"
      @pieces = (Piece.joins(:composer).where("composers.name like ? or title like ?", query, query))
    end
  end
end

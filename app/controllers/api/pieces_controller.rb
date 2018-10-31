module Api
  class PiecesController < ApplicationController
    def search
      query = "%#{params['term']}%"
      @pieces = (Piece.joins(:composer).where("composers.name like ? or title like ?", query, query))
    end
  end
end

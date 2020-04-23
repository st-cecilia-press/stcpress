require 'open-uri'
class SearchController < ApplicationController
  def index
    @results = Search.new(search_params).search
  end
  def create
    slug = params[:slug]
    search = params[:search]
    title = search.split(' (')[0]
    count = Piece.where(title: title).count
    if slug.blank? or count < 1
        search = URI::encode(search)
        redirect_to search_index_path(q: search)  
    else
        redirect_to piece_url(:slug => slug)
    end
  end
  private
  def search_params
      params.permit(:q, :start)
  end
end

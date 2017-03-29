require 'open-uri'
class SearchController < ApplicationController
  def create
    slug = params[:slug]
    search = params[:search]
    title = search.split(' (')[0]
    count = Piece.where(title: title).count
    if slug.blank? or count < 1
        search = URI::encode(search)
        url = "https://cse.google.com/cse?as_q=#{search}&client=google-csbe&cx=005631129422479805654:q04zkci2lz4"
        redirect_to(url)
    else
        redirect_to piece_url(:slug => slug)
    end
  end
end

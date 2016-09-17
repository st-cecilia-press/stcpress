require 'open-uri'
class HomeController < ApplicationController
  def show
  end
  def create
    slug = params[:slug]
    search = params[:search]
    if slug.blank?
        search = URI::encode(search)
        url = "https://cse.google.com/cse?as_q=#{search}&client=google-csbe&cx=005631129422479805654:q04zkci2lz4"
        redirect_to(url)
    else
        redirect_to piece_url(:slug => slug)
    end
  end
end

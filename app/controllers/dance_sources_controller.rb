class DanceSourcesController < ApplicationController
  layout 'dance'
  def index
    @sources = DanceSource.all.order(:start_date)
  end

  def show
    @source = DanceSource.find_by(slug: params[:slug]) 
    @dances = @source.dances
  end
end

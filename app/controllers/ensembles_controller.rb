class EnsemblesController < ApplicationController
  layout 'dance'
  def index
    @ensembles = Ensemble.all.order(:name)
  end

  def show
    @ensemble = Ensemble.find_by(slug: params[:slug]) 
    @dances = @ensemble.dances
  end
end

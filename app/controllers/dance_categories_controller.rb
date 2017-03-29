class DanceCategoriesController < ApplicationController
  layout 'dance'
  def index
    @categories = DanceCategory.all.order(:name)
  end

  def show
    name = params[:name].tr('_',' ')
    @category = DanceCategory.find_by(name: name)
    @dances = @category.dances
  end

end

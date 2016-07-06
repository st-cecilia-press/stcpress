class ManuscriptsController < ApplicationController
  def index
    @manuscripts = Manuscript.all
  end

  def show
    @manuscript = Manuscript.find_by(slug: params[:slug])
  end
end

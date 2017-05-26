class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :create, :update, :new]
  def show
    @page = Page.find_by(slug: params[:slug])
  end
  def edit
    authorize! :manage, :all
    @page = Page.find(params[:id])
  end
  def new
    authorize! :manage, :all
    @page = Page.new
  end
  def update
    @page = Page.find(params[:id])
    if @page.update(page_params)
      redirect_to "/pages/#{@page.slug}"
    else
      render :edit
    end 
  end
  def create
    @page = Page.new(page_params)
    if @page.save
      redirect_to "/pages/#{@page.slug}"
    else
      render :new
    end 
  end
  private
  def page_params
      params.require(:page).permit(:title, :slug, :body)
  end
end

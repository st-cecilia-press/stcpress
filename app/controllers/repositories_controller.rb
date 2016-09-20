class RepositoriesController < ApplicationController
  def index
    @repositories = Repository.all
  end

  def show
    @repo = Repository.find_by(slug: params[:slug])
    @pieces = @repo.pieces
  end
end

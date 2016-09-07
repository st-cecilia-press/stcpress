class RepositoriesController < ApplicationController
  def index
    @repositories = Repository.all
  end

  def show
    @repo = Repository.find_by(name: params[:name])
    @pieces = @repo.pieces
  end
end

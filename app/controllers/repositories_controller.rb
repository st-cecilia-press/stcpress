class RepositoriesController < ApplicationController
  def index
    @repositories = Repository.where.not(type: 'DanceRepository')
  end

  def show
    repo = Repository.find_by(slug: params[:slug])
    if repo.type == 'DanceRepository'
      raise ActionController::RoutingError.new('Not Found')
    else
      @repo = repo
      @pieces = @repo.pieces
    end
  end
end

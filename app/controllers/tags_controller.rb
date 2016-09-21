class TagsController < ApplicationController
  def index
      @tags = Tag.order('tags.name ASC').all
  end
  def show
      @tag = Tag.find_by(name: CGI.unescape(params[:name]))
      @pieces = @tag.pieces
  end
end

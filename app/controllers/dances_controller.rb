require 'redcarpet'
class DancesController < ApplicationController
  def index
    @dances = Dance.all
  end

  def show
    options = { tables: true, }
    renderer = Redcarpet::Render::HTML.new(options)
    @markdown = Redcarpet::Markdown.new(renderer, extensions = {})
    @dance = Dance.find_by(slug: params[:slug])
  end
end

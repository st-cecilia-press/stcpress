module Tools
  class CpdlController < ApplicationController
    def new
      @pieces = Repository.find_by(slug: 'miscellaneous').pieces.order(:title)
    end
    def create
    end
  end
end

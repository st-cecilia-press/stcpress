module Api
  class DancesController < ApplicationController
    def search
      query = "%#{params['term']}%"
      @dances = (Dance.where("title like ?", query))
    end
  end
end

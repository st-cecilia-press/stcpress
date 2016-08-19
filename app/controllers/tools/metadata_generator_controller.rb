module Tools
  class MetadataGeneratorController < ApplicationController
    def new
      @composers = Composer.all.order(:name)
      @manuscripts = Manuscript.all.order(:name)
      @books = Book.all.order(:slug)
    end
    def create
    end
  end
end

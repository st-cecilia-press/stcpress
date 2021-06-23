require 'rsolr'
class Search
  def initialize(query)
    @solr = RSolr.connect :url => 'http://solr:8983/solr/earlymusic'
    @query = query
  end
  def search
    response = @solr.get 'select', :params => @query
    SearchResults.new(response)
  end
end

class SearchResults
  attr_reader :numFound, :docs, :q, :start
  def initialize(response)
    @q = response["responseHeader"]["params"]["q"]
    @start = response["response"]["start"].to_i
    @numFound = response["response"]["numFound"]    
    @docs = response["response"]["docs"].map{|doc| SearchResultPresenter.for(doc) }

    @pagination = Pagination.new(current_start: @start, total_results: numFound)
  end 

  def next_page
    @pagination.next_page
  end

  def prev_page
    @pagination.prev_page
  end

  def pages
    @pagination.pages
  end

  def process_docs(docs)
    results = Array.new
    docs.each do |doc|
      case doc["model"]
      when "piece"
        results.push(Piece.find_by(slug: doc["slug"]))
      when "composer"
        results.push(Composer.find_by(name: doc["title"]))
      when "manuscript"
        results.push(Manuscript.find_by(slug: doc["slug"]))
      when "book"
        results.push(Book.find_by(slug: doc["slug"]))
      else
        #error
      end 
    end
    results
  end
end


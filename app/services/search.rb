require 'rsolr'
require 'json'
class Search
  def initialize(query)
    @solr = RSolr.connect :url => 'http://solr:8983/solr/earlymusic'
    @query = query
  end
  def search
    response = @solr.get 'select', :params => {:q => "text:#{@query}"}
    response["response"]["docs"]
  end
end

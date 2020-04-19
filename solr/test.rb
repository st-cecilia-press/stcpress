require 'rsolr'
solr = RSolr.connect :url => 'http://solr:8983/solr/earlymusic'
response = solr.get 'select', :params => {:q => '*:*'}
puts response

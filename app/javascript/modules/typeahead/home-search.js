import $ from 'jquery'
import Bloodhound from 'typeahead.js'
import typeahead from 'typeahead.js'
export default (() => {
  if($('#home-search').length > 0){
    var pieces = new Bloodhound({
      datumTokenizer: Bloodhound.tokenizers.obj.whitespace(['title', 'composer']),
      queryTokenizer: Bloodhound.tokenizers.whitespace,
      remote: 
        { url: '/api/pieces?q=%QUERY',
          wildcard: '%QUERY',
        } 
    });

    pieces.initialize();
    
    $('#home-search').typeahead(null, {
      display: function(data){ return data.title + ' (' + data.composer + ')' },
      source: pieces.ttAdapter(),

    }).on('typeahead:select', function(ev, suggestion){
        $('#hidden-home-slug').val(suggestion.slug);
    });
      
  } 

})();

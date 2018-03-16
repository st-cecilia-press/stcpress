import $ from 'jquery'
import Bloodhound from 'typeahead.js'
import typeahead from 'typeahead.js'
export default (() => {
  if($('#dance-search').length > 0){

    var dances = new Bloodhound({
      datumTokenizer: Bloodhound.tokenizers.obj.whitespace(['title']),
      queryTokenizer: Bloodhound.tokenizers.whitespace,
      prefetch: '/json/dance_search.json', 
    });

    dances.initialize();
    
    $('#dance-search').typeahead(null, {
      name: 'dances',
      display: function(data){ return data.title},
      source: dances.ttAdapter(),
    }).on('typeahead:select', function(ev, suggestion){
        $('#hidden-slug').val(suggestion.slug);
    })
  };
})();

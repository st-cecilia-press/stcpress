import $ from 'jquery'
import Bloodhound from 'typeahead.js'
import typeahead from 'typeahead.js'
export default (() => {
  
  var tadiv = $("div[data-behavior='typeahead']");
  if(tadiv.length > 0){
    tadiv.each(function(index, element){ 
      var data = $(element).find('.data').first().text().trim().split(';');
      var bhdata = new Bloodhound({
        datumTokenizer: Bloodhound.tokenizers.whitespace,
        queryTokenizer: Bloodhound.tokenizers.whitespace,
        local: data
      });
      bhdata.initialize();
      $(element).find('input').typeahead(null, {
        source: bhdata.ttAdapter()
      });
    });
  }
})();

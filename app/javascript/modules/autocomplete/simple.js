import "jquery-ui/ui/widgets/autocomplete";
export default(() => {
  var tadiv = $("div[data-behavior='typeahead']");
  if(tadiv.length > 0){
    tadiv.each(function(index, element){ 
      var data = $(element).find('.data').first().text().trim().split(';');
      $(element).find('input').autocomplete( {
        source: data
      });
    });
  }
})()

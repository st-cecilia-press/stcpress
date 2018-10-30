import "jquery-ui/ui/widgets/autocomplete";
export default(() => {

  if($('#dance-search').length > 0){
    var thing = $('#dance-search').autocomplete({
      source: '/json/dance_search.json',
      minLength: 2,
      focus: function(event, ui){
        $('#dance-search').val(ui.item.title)
        return false;
      },
      select: function(event, ui){
        $('#dance-search').val(ui.item.title)
        $('#hidden-slug').val(ui.item.slug)
        return false;
      }
    })
    .autocomplete("instance")._renderItem = function(ul, item){
      return $("<li>").append('<div>' + item.title + '</div>')
      .appendTo(ul);
    }
    $('#dance-search').autocomplete("instance")._resizeMenu = function(){
      this.menu.element.outerWidth( 300 );
    };
  }
})();

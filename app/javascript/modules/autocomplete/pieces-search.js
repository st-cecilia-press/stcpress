import "jquery-ui/ui/widgets/autocomplete";
export default(() => {

  if($('#pieces-search').length > 0){
    var thing = $('#pieces-search').autocomplete({
      source: '/api/pieces',
      minLength: 2,
      focus: function(event, ui){
      //  $('#pieces-search').val(ui.item.title + ' (' + ui.item.composer + ')')
        return false;
      },
      select: function(event, ui){
        $('#pieces-search').val(ui.item.title + ' (' + ui.item.composer + ')')
        $('#hidden-slug').val(ui.item.slug)
        return false;
      }
    })
    .autocomplete("instance")._renderItem = function(ul, item){
      return $("<li>").append('<div>' + item.title + ' (' + item.composer + ')' + '</div>')
      .appendTo(ul);
    }
    $('#pieces-search').autocomplete("instance")._resizeMenu = function(){
      this.menu.element.outerWidth( 300 );
    };
  }
})();

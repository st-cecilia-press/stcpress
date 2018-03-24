export default (() => {
  $('.play-video').on('click', function(ev) {
    var src = '//www.youtube.com/embed/###YOUTUBE###?rel=0'
    var my_src = src.replace(/###YOUTUBE###/, this.dataset.youtube)
    $('#myModalLabel').text(this.dataset.title) 
    $("#video")[0].src = my_src + "&autoplay=1";
    ev.preventDefault();
 
  });
  $('#video-modal').on('hidden.bs.modal', function () {
    $('#video').removeAttr('src');
  })
})();

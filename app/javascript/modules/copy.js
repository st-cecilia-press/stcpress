import copy from 'copy-to-clipboard';
export default (() => {
  var copydiv = $("div[data-behavior='copy']");
  copydiv.find('button').click(function(){
   var text = $(this).parent().parent().find('pre').text()
   copy(text)
  });
})()

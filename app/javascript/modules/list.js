import List from 'list.js';
export default (() => {
  var list = $("div[data-behavior='list']").first();
  if(list.length > 0){
    var options = { valueNames: [list.data('valuename')] };
    new List(list[0], options) 
  }
})()

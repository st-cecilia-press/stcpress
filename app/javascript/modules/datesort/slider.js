import dtable from './datatable'
import Slider from 'bootstrap-slider'
export default( () => {
  if($('#dateRange').length >0){ 
    var mySlider = $("#dateRange").slider({}).on('change',function(){
      var val = this.value.split(',')
      $('#min').text(val[0])
      $('#max').text(val[1])
      dtable.draw();
    });
  

    $("#reset-dates").click(function(){
      mySlider.slider('setValue', [900,1700],true,true)
    });
    $("#tenth").click(function(){
      mySlider.slider('setValue', [900,999],true,true)
    });
    $("#eleventh").click(function(){
      mySlider.slider('setValue', [1000,1099],true,true)
    });
    $("#twelfth").click(function(){
      mySlider.slider('setValue', [1100,1199],true,true)
    });
    $("#thirteenth").click(function(){
      mySlider.slider('setValue', [1200,1299],true,true)
    });
    $("#fourteenth").click(function(){
      mySlider.slider('setValue', [1300,1399],true,true)
    });
    $("#fifteenth").click(function(){
      mySlider.slider('setValue', [1400,1499],true,true)
    });
    $("#sixteenth").click(function(){
      mySlider.slider('setValue', [1500,1599],true,true)
    });
    $("#seventeenth").click(function(){
      mySlider.slider('setValue', [1600,1699],true,true)
    });
  }

})();

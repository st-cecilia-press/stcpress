export default (() => {
   
  
  $('#cpdl-select').click(function(){
    var slug = $('#cpdl-piece').val()
    var pdf_url = 'http://stcpress.org/miscellaneous/' + slug + '/' + slug + '.pdf';
    var date = new Date().toJSON().substring(0,10)
    var url = '/miscellaneous/' + slug + '/' + slug + '.pdf';
    var text = '[http://stcpress.org/miscellaneous/__SLUG__/__SLUG__.pdf {{extpdf}}] [http://stcpress.org/miscellaneous/__SLUG__/__SLUG__.mid {{extmid}}] [http://stcpress.org/miscellaneous/__SLUG__/__SLUG__.mp3 {{extmp3}}] [https://github.com/st-cecilia-press/miscellaneous/blob/master/__SLUG__/__SLUG__.ly {{extly}}] [http://stcpress.org/pieces/__SLUG__ {{net}}] Part Midis and Mp3s Available' + "\n" + 
      '{{Editor|Monique Rio|__DATE__}}{{ScoreInfo|Letter|__PAGES__|__SIZE__}}{{CopyCC|Attribution 4.0}}' + "\n" + 
":'''Edition notes:''' "
    
    $.get(url ).done(function(data,status,jqXHR){
       var pages = data.match(/\/Type[\s]*\/Page[^s]/g).length;
       var size = parseInt(jqXHR.getResponseHeader('content-length')/1024)
       var newText = text;
       newText = newText.replace(/__SLUG__/g,slug).replace(/__PAGES__/g,pages)
                        .replace(/__SIZE__/g,size).replace(/__DATE__/g,date)   
       $('#cpdl-pdf').text(pdf_url)
       $('#cpdl-data').text('Num Pages: ' + pages + '; Size: ' + size + ' kb')
       $('#cpdl-display').text(newText)

    });
  });
})();

import 'datatables.net-bs4'
export default (() => {
  $.fn.dataTable.ext.search.push(
      function( settings, data, dataIndex ) {
          var min = parseInt( $('#min').text(), 10 );
          var max = parseInt( $('#max').text(), 10 );
          var start_date = parseFloat( data[3] ) || 900; // use data for the start_date column
          var end_date = parseFloat( data[4] ) || 1700; // use data for the end_date column
   
          if ( ( isNaN( min ) && isNaN( max ) ) ||
               ( isNaN( min ) && start_date <= max ) ||
               ( min <= end_date  && isNaN( max ) ) ||
               ( min <= end_date   && max >= start_date ) )
          {
              return true;
          }
          return false;
      }
  );
})()

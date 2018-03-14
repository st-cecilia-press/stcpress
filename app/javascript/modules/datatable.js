import 'datatables.net-bs'
export default (() => {
  $("table[data-behavior='dtable']").DataTable(
      {
        "pageLength": 25, 
        "saveState": true,
      });

})()

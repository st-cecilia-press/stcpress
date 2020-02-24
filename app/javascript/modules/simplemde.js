import EasyMDE  from 'easymde';
export default (() => {
  if( $("textarea[data-behavior='markdown']").length > 0){
    new EasyMDE();
  }
})()

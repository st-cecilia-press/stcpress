import SimpleMDE  from 'simplemde';
export default (() => {
  if( $("textarea[data-behavior='markdown']").length > 0){
    new SimpleMDE();
  }
})()

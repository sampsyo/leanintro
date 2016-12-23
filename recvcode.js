/* Silly hack. We insert a handler that lets us load
 * new code into the editor and execute it. */

function _gotMessage(event) {
  console.log("got event!");
  var code = event.data.code;
  if (code) {
    console.log("executing code!");
    myModule.editor_main.setValue(code, 1)
    myModule.process_main_buffer();
  }
}

console.log("registring!");
window.addEventListener("message", _gotMessage, false);

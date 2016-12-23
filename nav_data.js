var lean_nav_data = [];

/* This is definitely a hack, but here we insert a handler that lets us load
 * new code into the editor and execute it. */

function _gotMessage(event)
{
  console.log("got event!");
  if (event.data.code) {
    console.log("executing code!");
    invoke_leanjs(event.data.code);
  }
}

window.addEventListener("message", _gotMessage, false);

const LEAN_URL = 'lean/?live';

document.addEventListener("DOMContentLoaded", function () {
  let the_window;
  function register_example(example) {
    example.addEventListener('click', function () {
      let code = example.textContent.trim();

      if (the_window && the_window.opener && !the_window.closed) {
        the_window.postMessage({"code": code}, window.location.origin);
      } else {
        the_window = window.open(LEAN_URL, '_dingus');
        console.log(the_window);
      }
    });
  }

  let examples = document.querySelectorAll('.example');
  for (let i = 0; i < examples.length; ++i) {
    register_example(examples[i]);
  }
});

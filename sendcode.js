var LEAN_URL = 'lean/?live';

document.addEventListener("DOMContentLoaded", function () {
  var the_window;
  function register_example(example) {
    example.addEventListener('click', function () {
      var code = example.textContent.trim();

      if (the_window && the_window.opener && !the_window.closed) {
        the_window.postMessage({"code": code}, window.location.origin);
      } else {
        var url = LEAN_URL + '&code=' +
          btoa(unescape(encodeURIComponent(code)));
        the_window = window.open(LEAN_URL, '_dingus');
        console.log(the_window);
      }
    });
  }

  var examples = document.querySelectorAll('.example');
  for (var i = 0; i < examples.length; ++i) {
    register_example(examples[i]);
  }
});

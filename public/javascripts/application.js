var $j = jQuery.noConflict();

/**
 * Try to load FireBug console 
 */
if (window.loadFirebugConsole != undefined) {
  window.loadFirebugConsole();
} else {
  window.console = { log: function() {} };
}

/**
 * Prevent InvalidAuthenticityToken exceptions.
 * @see http://henrik.nyh.se/2008/05/rails-authenticity-token-with-jquery
 */
$j(document).ajaxSend(function(event, request, settings) {
  if (typeof(AUTH_TOKEN) == "undefined") return;
  // settings.data is a serialized string like "foo=bar&baz=boink" (or null)
  settings.data = settings.data || "";
  settings.data += (settings.data ? "&" : "") + "authenticity_token=" + encodeURIComponent(AUTH_TOKEN);
});

/**
 * Dynamically remove some Blueprint styles which mess up ActiveScaffold
 */
$j(function() {
  if ($j('.active-scaffold-header').length) {
    $j('body').removeClass('bp').css('overflow', 'visible');
    $j('.container').css('overflow', 'visible');
  }
});

/**
 * Bind click handlers to the navigation list items.
 */
$j(function() {
  $j('.navigation li').click(function(e) {
    var li = $j(this);
    document.location = li.find('a').attr('href');
  });
});

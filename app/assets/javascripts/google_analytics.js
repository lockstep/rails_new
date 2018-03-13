$(document).on('turbolinks:load', function () {
  if (typeof gtag === 'function' && typeof SETTINGS.google_analytics_id != "undefined") {
    gtag('config', SETTINGS.google_analytics_id, { page_path: window.location.pathname });
  }
});

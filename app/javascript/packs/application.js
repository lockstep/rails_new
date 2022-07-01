import * as Sentry from "@sentry/browser";
import "@hotwired/turbo-rails";

// Support component names relative to this directory:
const componentRequireContext = require.context("views", true);
const ReactRailsUJS = require("react_ujs");

ReactRailsUJS.useContext(componentRequireContext);

Sentry.init({
  dsn: SETTINGS.SENTRY_DSN_FRONTEND,
});

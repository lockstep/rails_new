// Support component names relative to this directory:
const componentRequireContext = require.context("views", true);
const ReactRailsUJS = require("react_ujs");

ReactRailsUJS.useContext(componentRequireContext);

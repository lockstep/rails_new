process.env.NODE_ENV = process.env.NODE_ENV || "development"

const environment = require("./environment");

// This is necessary to fix runtime errors when hot-loading mjs modules
const nodeModulesLoader = environment.loaders.get("nodeModules");
nodeModulesLoader.type = "javascript/auto";

module.exports = environment.toWebpackConfig();

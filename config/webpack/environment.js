const { environment } = require("@rails/webpacker");
const typescript = require("./loaders/typescript");
const webpack = require('webpack')

environment.plugins.prepend('Provide', new webpack.ProvidePlugin({
    $: 'jquery',
    JQuery: 'jquery',
    Popper: ['popper.js', 'default'], // for Bootstrap 4
  })
)

environment.loaders.prepend("typescript", typescript);
module.exports = environment;


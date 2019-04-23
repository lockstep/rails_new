const { environment } = require("@rails/webpacker");

environment.splitChunks(config =>
  Object.assign({}, config, {
    optimization: {
      splitChunks: {
        cacheGroups: {
          vendor: {
            test: /node_modules/,
            chunks: "all",
            name: "vendor",
            enforce: true
          }
        }
      }
    }
  })
);

module.exports = environment;

const environment = require("./environment");

// Do not bundle-split in development to make HMR possible
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

module.exports = environment.toWebpackConfig();

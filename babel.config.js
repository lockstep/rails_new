module.exports = function(api) {
  var validEnv = ["development", "test", "production"];
  var currentEnv = api.env();
  var isProductionEnv = api.env("production");
  var isTestEnv = api.env("test");

  if (!validEnv.includes(currentEnv)) {
    throw new Error(
      "Please specify a valid `NODE_ENV` or " +
        '`BABEL_ENV` environment variables. Valid values are "development", ' +
        '"test", and "production". Instead, received: ' +
        JSON.stringify(currentEnv) +
        "."
    );
  }

  return {
    presets: [
      [
        "@babel/preset-env",
        {
          useBuiltIns: "usage",
          corejs: 3,
          // See https://browsersl.ist/?q=defaults for a full list of browsers
          // included as defaults.
          targets: "defaults",
          exclude: ["transform-typeof-symbol"],
          forceAllTransforms: true,
          modules: false,
        },
      ],
      "@babel/preset-react",
      "@babel/preset-typescript",
    ],
    plugins: [
      require("babel-plugin-macros"),
      require("@babel/plugin-syntax-dynamic-import").default,
      isTestEnv && require("babel-plugin-dynamic-import-node"),
      require("@babel/plugin-transform-destructuring").default,
      [
        require("@babel/plugin-proposal-class-properties").default,
        {
          loose: true,
        },
      ],
      [
        require("@babel/plugin-proposal-object-rest-spread").default,
        {
          useBuiltIns: true,
        },
      ],
      [
        require("@babel/plugin-transform-runtime").default,
        {
          // NOTE: Unable to specify this since react-google-maps
          // depends on the old @babel/runtime
          // corejs: 3,
          helpers: false,
          regenerator: true,
        },
      ],
      [
        require("@babel/plugin-transform-regenerator").default,
        {
          async: false,
        },
      ],
      isProductionEnv && [
        require("babel-plugin-transform-react-remove-prop-types").default,
        {
          removeImport: true,
        },
      ],
      "@babel/plugin-proposal-nullish-coalescing-operator",
      "react-hot-loader/babel",
    ].filter(Boolean),
  };
};

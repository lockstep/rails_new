module.exports = function (api) {
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
      "babel-plugin-macros",
      "@babel/plugin-syntax-dynamic-import",
      "@babel/plugin-transform-destructuring",
      [
        "@babel/plugin-proposal-class-properties",
        {
          loose: true,
        },
      ],
      [
        "@babel/plugin-proposal-object-rest-spread",
        {
          useBuiltIns: true,
        },
      ],
      [
        "@babel/plugin-transform-runtime",
        {
          // NOTE: Unable to specify this since react-google-maps
          // depends on the old @babel/runtime
          // corejs: 3,
          helpers: false,
          regenerator: true,
        },
      ],
      [
        "@babel/plugin-transform-regenerator",
        {
          async: false,
        },
      ],
      isProductionEnv && [
        "babel-plugin-transform-react-remove-prop-types",
        {
          removeImport: true,
        },
      ],
      isTestEnv && "babel-plugin-dynamic-import-node",
      isTestEnv && "@babel/plugin-transform-modules-commonjs",
      "@babel/plugin-proposal-nullish-coalescing-operator",
      "react-hot-loader/babel",
    ].filter(Boolean),
  };
};

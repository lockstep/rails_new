module.exports = {
  env: {
    browser: true,
    jquery: true,
  },
  extends: [
    "plugin:import/warnings",
    "plugin:import/errors",
    "plugin:react/recommended",
    // Airbnb must come before prettier, so that it doesn't apply
    // rules conflicting with prettier's formatting style.
    "airbnb",
    "prettier",
    "prettier/react",
    "plugin:@typescript-eslint/recommended",
  ],
  globals: {
    ActionCable: "writable",
    App: "writable",
    google: "writable",
    gtag: "writable",
    SETTINGS: "writable",
    Turbolinks: "writable",
  },
  parser: "@typescript-eslint/parser",
  parserOptions: {
    ecmaVersion: 6,
    sourceType: "module",
    ecmaFeatures: {
      jsx: true,
      modules: true,
    },
  },
  plugins: [
    "jsx-a11y",
    "import",
    "react",
    "prettier",
    "react-hooks",
    "@typescript-eslint",
  ],
  rules: {
    "prettier/prettier": "error",

    // TODO: configure these rules as necessary
    // TS
    "@typescript-eslint/no-unused-vars": ["error"],
    "@typescript-eslint/no-use-before-define": ["off"],
    "@typescript-eslint/camelcase": ["off"],
    "@typescript-eslint/no-this-alias": ["warn"],
    "@typescript-eslint/explicit-function-return-type": "off",
    "@typescript-eslint/no-non-null-assertion": "off",

    // JS
    "array-callback-return": ["warn"],
    "arrow-body-style": ["warn"],
    "class-methods-use-this": ["warn"],
    "consistent-return": ["warn"],
    "dot-notation": ["warn"],
    "func-names": ["error"],
    "import/no-unresolved": ["off"],
    "import/order": ["warn"],
    "import/prefer-default-export": ["off"],
    "import/extensions": [
      "error",
      "ignorePackages",
      {
        js: "never",
        jsx: "never",
        ts: "never",
        tsx: "never",
      },
    ],
    "import/no-extraneous-dependencies": [
      "error",
      {
        devDependencies: [
          "**/*.test.{js,ts}",
          "app/javascript/test/**/*.{js,ts}",
        ],
      },
    ],
    "jsx-a11y/anchor-is-valid": ["off"],
    "lines-between-class-members": [
      "error",
      "always",
      { exceptAfterSingleLine: true },
    ],
    "new-cap": ["warn"],
    "no-new": ["off"],
    "no-param-reassign": ["warn"],
    "no-plusplus": ["off"],
    "no-undef": ["warn"],
    "no-underscore-dangle": ["off"],
    "no-useless-constructor": ["off"],
    "prefer-destructuring": ["warn"],
    "react/default-props-match-prop-types": ["warn"],
    "react/destructuring-assignment": ["off"],
    "react/forbid-prop-types": ["warn"],
    "react/jsx-filename-extension": ["error", { extensions: [".jsx", ".tsx"] }],
    "react/no-access-state-in-setstate": ["warn"],
    "react/no-array-index-key": ["off"],
    "react/no-danger": ["off"],
    "react/no-unused-prop-types": ["warn"],
    "react/no-unused-state": ["warn"],
    "react/prefer-stateless-function": ["warn"],
    "react/require-default-props": ["off"],
    "react/sort-comp": ["off"],
    "no-unused-expressions": ["warn"],
    "react-hooks/rules-of-hooks": "error",
    "react-hooks/exhaustive-deps": "off",
  },
  settings: {
    "import/resolver": {
      node: {
        extensions: [".js", ".jsx", ".ts", ".tsx", "es6", ""],
        paths: ["app/javascript"],
      },
    },
    react: {
      version: "detect",
    },
  },
  overrides: [
    {
      files: ["**/*.ts", "**/*.tsx"],
      rules: {
        "react/prop-types": "off",
      },
    },
    {
      files: ["**/*.js", "**/*.jsx"],
      rules: {
        "@typescript-eslint/no-var-requires": ["off"],
        "no-use-before-define": ["error", "nofunc"],
      },
    },
  ],
};

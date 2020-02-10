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
    google: true,
    gtag: true,
    Turbolinks: true,
    ActionCable: true,
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
    // "@typescript-eslint/no-use-before-define": ["warn"],
    "@typescript-eslint/no-var-requires": ["warn"],
    "@typescript-eslint/camelcase": ["warn"],
    // "@typescript-eslint/no-this-alias": ["warn"],

    // JS
    // "array-callback-return": ["warn"],
    // "arrow-body-style": ["warn"],
    // "class-methods-use-this": ["warn"],
    // "consistent-return": ["warn"],
    // "dot-notation": ["warn"],
    // "import/no-unresolved": ["warn"],
    // "import/order": ["warn"],
    // "import/prefer-default-export": ["warn"],
    // "import/extensions": ["error", "ignorePackages", {
    //   js: 'never',
    //   jsx: 'never',
    //   ts: 'never',
    //   tsx: 'never',
    // }],
    // "jsx-a11y/anchor-is-valid": ["warn"],
    "lines-between-class-members": [
      "error",
      "always",
      { exceptAfterSingleLine: true },
    ],
    // "new-cap": ["warn"],
    // "no-new": ["warn"],
    // "no-param-reassign": ["warn"],
    // "no-plusplus": ["warn"],
    "no-undef": ["warn"],
    // "no-underscore-dangle": ["warn"],
    "no-unused-expressions": ["warn"],
    // "no-use-before-define": ["warn"],
    // "no-useless-constructor": ["warn"],
    // "prefer-destructuring": ["warn"],
    // "react/default-props-match-prop-types": ["warn"],
    // "react/destructuring-assignment": ["warn"],
    // "react/forbid-prop-types": ["warn"],
    // "react/jsx-filename-extension": ["warn"],
    // "react/no-access-state-in-setstate": ["warn"],
    // "react/no-array-index-key": ["warn"],
    // "react/no-unused-prop-types": ["warn"],
    // "react/no-unused-state": ["warn"],
    // "react/prefer-stateless-function": ["warn"],
    // "react/require-default-props": ["warn"],
    // "react/sort-comp": ["warn"],
    "react-hooks/rules-of-hooks": "error",
    "react-hooks/exhaustive-deps": "warn",
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
        "@typescript-eslint/explicit-function-return-type": "off",
      },
    },
  ],
};

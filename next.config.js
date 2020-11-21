const withTM = require("next-transpile-modules")([
  "bs-platform",
  "reason-promise",
]);



module.exports = withTM({
  pageExtensions: ["jsx", "js", "bs.js"],
  webpack: function (config) {
    config.module.rules.push({
      test: /\.md$/,
      use: "raw-loader",
    });
    return config;
  },
});

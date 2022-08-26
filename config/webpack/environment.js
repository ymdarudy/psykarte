const { environment } = require("@rails/webpacker");

const webpack = require("webpack");
environment.plugins.prepend(
  "Provide",
  new webpack.ProvidePlugin({
    $: "jquery/src/jquery",
    jQuery: "jquery/src/jquery",
    // Popper: ["popper.js", "default"], ここの有無で挙動が変わる可能性あり
  })
);

module.exports = environment;

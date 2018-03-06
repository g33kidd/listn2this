const path = require('path');
const webpack = require('webpack');

module.exports = {
  entry: "./client/main.js",
  devtool: 'inline-source-map',
  devServer: {
    contentBase: './priv/static/js',
    hot: true
  },
  plugins: [
    new webpack.NamedModulesPlugin(),
    new webpack.HotModuleReplacementPlugin(),
  ],
  output: {
    path: path.resolve(__dirname, "./priv/static/js"),
    filename: "[name].js"
  },
  module: {
    rules: [
      { test: /\.js$/, exclude: /node_modules/, use: 'babel-loader' }
    ]
  }
}

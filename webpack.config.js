const path = require('path');
const webpack = require('webpack');

const publicPath = 'http://127.0.0.1:3000'

module.exports = {

  devtool: 'inline-source-map',
  mode: 'development',

  entry: [
    'react-hot-loader/patch',
    `webpack-dev-server/client?${publicPath}`,
    'webpack/hot/only-dev-server',
    "./client/main.js"
  ],

  output: {
    path: path.resolve(__dirname, "./priv/static/js"),
    filename: "[name].js"
  },

  devServer: {
    contentBase: path.resolve(__dirname, 'priv/static/js'),
    hot: true,
    port: 3000,
    quiet: false,
    inline: true,
    historyApiFallback: true,
    stats: { colors: true }
  },
  plugins: [
    new webpack.NamedModulesPlugin(),
    new webpack.HotModuleReplacementPlugin(),
  ],
  resolve: {
    modules: [
      path.resolve('./client'),
      'node_modules'
    ]
  },

  module: {
    rules: [
      { test: /\.js$/, exclude: /node_modules/, use: 'babel-loader' }
    ]
  }
}

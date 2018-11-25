const path = require('path');
const webpack = require('webpack');

const publicPath = `http://localhost:4001/`

module.exports = {

  devtool: 'inline-source-map',
  mode: 'development',

  entry: [
    'react-hot-loader/patch',
    `webpack-dev-server/client?${publicPath}__webpack_hmr`,
    'webpack/hot/only-dev-server',
    "./client/main.js"
  ],

  output: {
    path: path.resolve(__dirname, "./priv/static/js"),
    filename: "[name].js"
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

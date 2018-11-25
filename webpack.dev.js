#!/usr/bin/env node
const express = require('express')
const webpack = require('webpack')
const config = require('./webpack.config')

const cors = require('cors')
const webpackDevMiddleware = require('webpack-dev-middleware')
const webpackHotMiddleware = require('webpack-hot-middleware')

const compiler = webpack(config)
const app = express()

app.use(cors())

app.use(webpackDevMiddleware(compiler, {
  noInfo: true,
  publicPath: config.output.publicPath
}))

app.use(webpackHotMiddleware(compiler, {
  log: console.log
}))

app.listen(4001, 'localhost', (err) => {
  if(err) return console.error(err)
  console.log('dev server running on localhost:40001')
})

process.stdin.resume()
process.stdin.on('end', function() {
  process.exit(0)
})
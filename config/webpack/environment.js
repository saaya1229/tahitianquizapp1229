const { environment } = require('@rails/webpacker')

// 他の設定

environment.loaders.append('module', {
  test: /\.mjs$/,
  type: 'javascript/auto',
})

environment.config.merge({
  optimization: {
    splitChunks: {
      chunks: 'all',
    },
  },
})

// ...
module.exports = environment
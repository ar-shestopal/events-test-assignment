const ExtractTextPlugin = require('extract-text-webpack-plugin')
// const { env } = require('../configuration.js')

module.exports = {
  test: /\css$/i,
  include: /node_modules/,
  use: ExtractTextPlugin.extract({
    fallback: 'style-loader',
    use: [{
      loader: 'css-loader',
      options: {
        localIdentName: '[local]',
        // minimize: env.NODE_ENV === 'production',
        modules: false,
      }
    }, {
      loader: 'postcss-loader',
      options: {
        plugins: () => [require('autoprefixer')],
      }
    }
    ]
  })
}

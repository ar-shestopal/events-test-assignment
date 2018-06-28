const ExtractTextPlugin = require('extract-text-webpack-plugin')
// const { env } = require('../configuration.js')

module.exports = {
  test: /\.(scss|sass|css)$/i,
  exclude: /node_modules/,
  include: [/node_modules\/fullcalendar\/dist/, /css/],
  use: ExtractTextPlugin.extract({
    fallback: 'style-loader',
    use: [{
      loader: 'css-loader',
      options: {
        localIdentName: '[name]__[local]--[hash:base64:5]',
        // minimize: env.NODE_ENV === 'production',
        modules: true,
      }
    }, {
      loader: 'postcss-loader',
      options: {
        plugins: () => [require('autoprefixer')],
      }
    },
      'sass-loader'
    ]
  })
}
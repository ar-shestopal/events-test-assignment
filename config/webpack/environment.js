const { environment } = require('@rails/webpacker')
const vue =  require('./loaders/vue')
const sass =  require('./loaders/sass')
const css =  require('./loaders/css')

// resolve-url-loader must be used before sass-loader
environment.loaders.get('sass').use.splice(-1, 0, {
  loader: 'resolve-url-loader'
});
environment.loaders.append('vue', vue)
environment.loaders.append('sass', sass)
environment.loaders.append('css', css)

module.exports = environment

const { environment } = require('@rails/webpacker')

const webpack = require('webpack')

// Add an ProvidePlugin
environment.plugins.prepend('Provide',  new webpack.ProvidePlugin({
    $: 'jquery',
    jQuery: 'jquery',
    jquery: 'jquery',
//    'window.Tether': "tether",
//    Popper: ['popper.js', 'default'],
  })
)

const config = environment.toWebpackConfig()

module.exports = environment

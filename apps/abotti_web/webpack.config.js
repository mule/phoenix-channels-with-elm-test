var webpack = require("webpack");
var ExtractTextPlugin = require("extract-text-webpack-plugin");
var CopyWebpackPlugin = require("copy-webpack-plugin");

var elmSource = __dirname + '/web/static/elm';
module.exports = {
  entry: {
    main: "./web/static/js/app.js",
    elmApp: "./web/static/js/elmApp.js",
    reactApp: "./web/static/js/reactApp.jsx",
    common: "./web/static/js/common.js"
  },
  output: {
    path: "./priv/static/js",
    filename: "[name].bundle.js"
  },
  resolve: {
    modulesDirectories: ["node_modules", __dirname + "/web/static/js"],
    extensions: ['', '.js', '.elm','.jsx'],
  },
  devtool: 'source-map',
  module: {
    loaders: [{
      test: /\.(js|jsx)$/,
      exclude: /node_modules/,
      loader: "babel",
      query: {
          presets: ["es2015",'react'],
      }
    }, {
      test: /\.css$/,
      loader: ExtractTextPlugin.extract("style", "css")
    }, {
      test: /\.png$/,
      loader: 'url-loader?limit=100000'
    }, {
      test: /\.woff(2)?(\?v=[0-9]\.[0-9]\.[0-9])?$/,
      loader: 'url-loader?limit=10000&mimetype=application/font-woff'
    }, {
      test: /\.(ttf|otf|eot|svg)(\?v=[0-9]\.[0-9]\.[0-9])?|(jpg|gif)$/,
      loader: 'file-loader'
    }, {
      test: /\.elm$/,
      exclude: [/elm-stuff/, /node_modules/],
      loader: 'elm-webpack?pathToMake=../../../node_modules/.bin/elm-make&cwd=' +
        elmSource
    }]
  },
  plugins: [
    new ExtractTextPlugin("css/[name].css"),
    new CopyWebpackPlugin([{
      from: "./web/static/assets",
    }]),
    new webpack.ProvidePlugin({
      $: "jquery",
      jQuery: "jquery",
      "window.jQuery": "jquery",
      'window.Tether': 'tether',
    }),
  ],
};

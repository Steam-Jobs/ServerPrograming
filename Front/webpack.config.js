var webpack = require("webpack");
var extractTextPlugin = require('extract-text-webpack-plugin');

module.exports = [{
    entry: {
        index: './src/scripts/index.js'
    },
    output: {
        path: __dirname + '/app/scripts',
        filename: '[name].js',
        publicPath: '/app/',
    },
    module: {
        rules: [
            {
                test: /\.tag$/,
                exclude: /node_modules/,
                loader: 'riot-tag-loader',
                enforce: 'pre'
            },
            {
                test: /\.js$|\.tag$/,
                exclude: /node_modules/,
                loader: 'babel-loader',
                options: {
                    presets: ['es2015-riot']
                }
            }
        ]
    },
    resolve: {
        extensions: ['.js', '.tag']
    },
    plugins: [
        new webpack.optimize.UglifyJsPlugin({
            // jsを圧縮するぅ🙌
            compress: {
                warnings: false
            }
        }),
        new webpack.ProvidePlugin({
            // 指定した変数を他のモジュール内で使用できるようにする
            riot: 'riot',
            $: 'jquery',
            jQuery: 'jquery'
        })
    ]
}, {
    entry: {
        app: './src/styles/app.sass',
        list: './src/styles/list.sass',
        normalise: './node_modules/normalize.css/normalize.css'
    },
    output: {
        path: __dirname + '/app/styles',
        filename: '[name].css'
    },
    module: {
        rules: [
            {
                test: /\.sass$/,
                use: extractTextPlugin.extract({
                    fallback: "style-loader",
                    use: [
                        "css-loader?minimize",
                        "sass-loader"
                    ]
                })
            },
            {
                test: /\.css$/,
                use: extractTextPlugin.extract({
                    fallback: "style-loader",
                    use: [
                        "css-loader?minimize"
                    ]
                })
            }
        ]
    },
    plugins: [
        new extractTextPlugin({
            filename: "[name].css"
        })
    ]
}];
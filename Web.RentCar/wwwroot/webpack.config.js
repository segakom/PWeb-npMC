const path = require('path');
const HtmlWebpackPlugin = require('html-webpack-plugin');

module.exports = {
  entry: path.resolve(__dirname, 'src', 'index.tsx'),
  output: {
    filename: 'bundle.js',
    path: path.resolve(__dirname, 'dist')
  },
  mode: "development",
  resolve: {
    extensions: ['.js', '.ts', '.tsx'],
    alias: {
      '@master': path.resolve(__dirname, 'src/master/index.ts'),
      '@middleware': path.resolve(__dirname, 'src/middleware/index.ts'),
      '@shared-modules': path.resolve(__dirname, 'src/modules/shared'),
      '@modules': path.resolve(__dirname, 'src/modules/'),
      '@pages': path.resolve(__dirname, 'src/pages/'),
      '@utils': path.resolve(__dirname, 'src/utils/'),
      '@app': path.resolve(__dirname, 'src/'),
    }
  },
  module: {
    rules: [
      {
        test: /\.tsx?$/,
        use: ['ts-loader']
      },
      {
        test: /\.html/,
        use: ['html-loader']
      },
      {
        test: /\.s(a|c)ss$/,
        use: [
          'style-loader',
          {
            loader: 'css-loader',
            options: {
              modules: false
            }
          },
          'sass-loader'
        ]
      }
    ]
  },
  plugins: [
    new HtmlWebpackPlugin({
      template: path.resolve(__dirname, 'public', 'index.html')
    })
  ],
  devServer: {
    contentBase: path.resolve(__dirname, 'dist'),
    port: 8888
  }
};
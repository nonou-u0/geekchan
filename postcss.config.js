module.exports = {
/*  plugins: [
    require('postcss-import'),
    require('postcss-flexbugs-fixes'),
    require('postcss-preset-env')({
      autoprefixer: {
        flexbox: 'no-2009'
      },
      stage: 3
    })
  ]
*/
  plugins: (loader) => {
    const isScss = loader.resourcePath.endsWith('.scss');

    return [
      require('postcss-import'),
      require('postcss-flexbugs-fixes'),
      // .scss 以外のときだけ postcss-preset-env を適用
      !isScss &&
        require('postcss-preset-env')({
          autoprefixer: {
            flexbox: 'no-2009'
          },
          stage: 3
        })
    ].filter(Boolean); // falsyなもの（falseなど）を除外
  }
}

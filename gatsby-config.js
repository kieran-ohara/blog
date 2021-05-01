module.exports = {
  siteMetadata: {
    title: 'kieranbamforth.me',
  },
  plugins: [
    {
      resolve: 'gatsby-source-filesystem',
      options: {
        path: `${__dirname}/jekyll/src/_posts`,
      },
    },
    'gatsby-transformer-remark',
  ],
  polyfill: false,
};

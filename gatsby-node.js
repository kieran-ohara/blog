const path = require('path');

exports.createPages = async ({ actions, graphql, reporter }) => {
  const { createPage } = actions;

  const result = await graphql(`
    {
      allMarkdownRemark {
        edges {
          node {
            fileAbsolutePath
            id
          }
        }
      }
    }
  `);

  if (result.errors) {
    reporter.panicOnBuild('Error while running GraphQL query.');
    return;
  }

  result.data.allMarkdownRemark.edges.forEach(({ node }) => {
    const fileName = node.fileAbsolutePath;
    const extension = path.extname(fileName);
    const file = path.basename(fileName, extension);

    createPage({
      path: `/post/${file}`,
      component: path.resolve('src/templates/post.jsx'),
      context: { id: node.id },
    });
  });
};

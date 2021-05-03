const path = require('path');
const fileNameComponents = require('./src/lib/fileNameComponents');

exports.createPages = async ({ actions, graphql, reporter }) => {
  const { createPage } = actions;

  const result = await graphql(`
    {
      allMarkdownRemark {
        edges {
          node {
            fileAbsolutePath
            id
            path
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
    createPage({
      path: node.path,
      component: path.resolve('src/templates/post.jsx'),
      context: { id: node.id },
    });
  });
};

exports.createResolvers = ({ createResolvers }) => {
  const resolvers = {
    MarkdownRemark: {
      path: {
        resolve(source) {
          const { postName } = fileNameComponents.fileNameComponents(source.fileAbsolutePath);
          return `post/${postName}`;
        },
      },
    },
  };
  createResolvers(resolvers);
};

exports.createSchemaCustomization = ({ actions }) => {
  const { createTypes, createFieldExtension } = actions;

  createFieldExtension({
    name: 'shout',
    extend: () => ({
      resolve(source, args, context, info) {
        return String(source[info.fieldName]).toUpperCase();
      },
    }),
  });

  const typeDefs = `
    type MarkdownRemark implements Node @infer {
      path: String
    }
  `;
  createTypes(typeDefs);
};

import React from 'react';
import { graphql } from 'gatsby';

export default function Index({ data }) {
  const prop = (
    <main>
      <ul>
        {data.allMarkdownRemark.edges.map((value) => {
          const { title, tags } = value.node.frontmatter;
          const {
            excerpt,
            timeToRead,
            id,
            path,
          } = value.node;

          return (
            <li key={id}>
              <a href={path}>{title}</a>
              <p dangerouslySetInnerHTML={{ __html: excerpt }} />
              <p>{`${timeToRead} minutes ${tags}`}</p>
            </li>
          );
        })}
      </ul>
    </main>
  );
  return prop;
}

export const query = graphql`
  {
    allMarkdownRemark {
      edges {
        node {
          id
          frontmatter {
            title
            layout
            tags
          }
          timeToRead
          excerpt(format: HTML, pruneLength: 260, truncate: false)
          path
        }
      }
    }
  }
`;

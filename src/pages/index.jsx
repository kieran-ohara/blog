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
            <li key={id} className="postcontainer">
              <a href={path} className="posttitle"><h2>{title}</h2></a>
              <p dangerouslySetInnerHTML={{ __html: excerpt }} />
              <p className="postinfo">{`${timeToRead} minute read - ${tags}`}</p>
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
    allMarkdownRemark(sort: {fields: frontmatter___date, order: DESC}) {
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

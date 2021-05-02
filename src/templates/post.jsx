import React from 'react';
import { graphql } from 'gatsby';

export default function Post({ data }) {
  const { markdownRemark } = data;
  const { html } = markdownRemark;
  return (
    <div className="blog-post-container">
      <div className="blog-post">
        <div
          className="blog-post-content"
          dangerouslySetInnerHTML={{ __html: html }}
        />
      </div>
    </div>
  );
}

export const query = graphql`
  query($id: String!) {
    markdownRemark(id: { eq: $id }) {
      id
      html
      frontmatter {
        date(formatString: "MMMM DD, YYYY")
        tags
        title
      }
      timeToRead
    }
  }
`;

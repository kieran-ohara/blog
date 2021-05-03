import React from 'react';
import { StaticQuery, graphql } from 'gatsby';

export default function Layout({ children }) {
  return (
    <StaticQuery
      query={graphql`
        query HeadingQuery {
          site {
            siteMetadata {
              title
            }
          }
        }
        `}
      render={data => (
        <div style={{ margin: `3rem auto`, maxWidth: 650, padding: `0 1rem` }}>
          <header>
            <h1>{data.site.siteMetadata.title}</h1>
            <>{children}</>
          </header>
        </div>
      )}
    />
  );
};

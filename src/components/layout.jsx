import React from 'react';
import { StaticQuery, graphql } from 'gatsby';
import './reset.css';
import './styles.scss';

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
        <div>
          <header>
            <h1>{data.site.siteMetadata.title}</h1>
            <>{children}</>
          </header>
        </div>
      )}
    />
  );
};

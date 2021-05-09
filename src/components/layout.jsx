import React from 'react';
import { Helmet } from 'react-helmet';
import { StaticQuery, graphql } from 'gatsby';
import './reset.css';
import './styles.scss';

export default function Layout({ children }) {
  const render = (data) => (
    <div>
      <Helmet>
        <meta charSet="utf-8" />
        <title>{data.site.siteMetadata.title}</title>
        <link rel="canonical" href="https://www.kieranbamforth.me/" />
      </Helmet>
      <header>
        <h1>{data.site.siteMetadata.title}</h1>
        <>{children}</>
      </header>
    </div>
  );
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
      render={render}
    />
  );
}

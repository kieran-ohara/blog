import React from 'react';
import { StaticQuery, graphql } from 'gatsby';
import './reset.css';
import './styles.scss';
import { Helmet } from 'react-helmet';
import VolkornMd from '@fontsource/vollkorn/files/vollkorn-latin-500-normal.woff2';
import LatoRg from '@fontsource/lato/files/lato-latin-400-normal.woff2';

export default function Layout({ children }) {
  const render = (data) => (
    <div>
      <Helmet>
        <meta charSet="utf-8" />
        <title>{data.site.siteMetadata.title}</title>
        <link rel="canonical" href="https://www.kieranbamforth.me/" />
        <link
          rel="preload"
          as="font"
          href={VolkornMd}
          type="font/woff2"
          crossOrigin
        />
        <link
          rel="preload"
          as="font"
          href={LatoRg}
          type="font/woff2"
          crossOrigin
        />
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

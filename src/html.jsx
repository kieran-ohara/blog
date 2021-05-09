import React from 'react';
import VolkornMd from '@fontsource/vollkorn/files/vollkorn-latin-500-normal.woff2';
import LatoRg from '@fontsource/lato/files/lato-latin-400-normal.woff2';

let inlinedStyles = '';
if (process.env.NODE_ENV === 'production') {
  try {
    // eslint-disable-next-line
    inlinedStyles = require('!raw-loader!../public/styles.css');
  } catch (e) {
    console.log(e);
  }
}
function HTML(props) {
  let css;
  if (process.env.NODE_ENV === 'production') {
    css = (
      <style
        id="gatsby-inlined-css"
        dangerouslySetInnerHTML={{ __html: inlinedStyles }}
      />
    );
  }
  const { headComponents, body, postBodyComponents } = props;
  return (
    <html lang="en">
      <head>
        <meta charSet="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link
          rel="preload"
          as="font"
          href={VolkornMd}
          type="font/woff2"
          crossOrigin="anonymous"
        />
        <link
          rel="preload"
          as="font"
          href={LatoRg}
          type="font/woff2"
          crossOrigin="anonymous"
        />
        {headComponents}
        {css}
      </head>
      <body>
        <div id="___gatsby" dangerouslySetInnerHTML={{ __html: body }} />
        {postBodyComponents}
      </body>
    </html>
  );
}

export default HTML;

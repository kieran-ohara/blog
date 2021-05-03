const path = require('path');

exports.fileNameComponents = (fileName) => {
  const extension = path.extname(fileName);
  const file = path.basename(fileName, extension);
  const components = file.match(/(\d{4}-\d{2}-\d{2})-(.*)/);

  return {
    dateString: components[1],
    postName: components[2],
  };
};

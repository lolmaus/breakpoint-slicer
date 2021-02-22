var path = require('path');
var sassTrue = require('sass-true');

sassTrue.runSass({ file: path.join(__dirname, 'test.scss') }, { describe, it });
sassTrue.runSass({ file: path.join(__dirname, 'test-custom-slices.scss') }, { describe, it });
sassTrue.runSass({ file: path.join(__dirname, 'test-custom-media.scss') }, { describe, it });

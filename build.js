const fs = require('fs');

// Create a dummy build artifact
fs.writeFileSync('build.log', 'Build successful!\n');
console.log('Build completed!');


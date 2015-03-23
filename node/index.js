var fs = require('fs');
var path = require('path');
var program = require("commander");
var mkdirp = require("mkdirp")
var js2coffee = require("js2coffee");

var result = js2coffee.build(input);

// Get the input as the second argument
var input = process.argv[2];

// Setup options with commander
program
  .version("0.0.1")
  .option("-o, --output [path]", "Output path")
  .parse(process.argv);

// Check we have an input before continuing
if (typeof input === "undefined" || input === null) {
  console.log("You must provide an input as the first argument");
  process.exit()
}

// Read the JavaScript
fs.readFile(input, "utf-8", function(error, data) {

  // Build the CoffeeScript from JavaScript
  coffee = js2coffee.build(data).code;

  // Handle output to STDOUT or file
  if (program.output != null) {

    // If the output is defined then use it as the path
    // otherwise construct the path from the given argument
    if(program.output === true) {
      outputPath = path.basename(input, ".js") + ".coffee"
    } else {
      outputPath = program.output
    }

    // Create the output directory (if required)
    mkdirp(path.dirname(outputPath), function (err) {

      // Write the file to the output path
      fs.writeFile(outputPath, coffee, function(err) {
        console.log("👀");
        console.log("👅");
      });
    });

  } else {
    console.log(coffee);
  }
});


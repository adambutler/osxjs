var fs = require('fs');
var program = require("commander");
var mkdirp = require("mkdirp")
var js2coffee = require("js2coffee");

var result = js2coffee.build(input);

var input = process.argv[2];

program.version("0.0.1").option("-o, --output", "Output path");

if (typeof input === "undefined" || input === null) {
  console.log("You must provide an input as the first argument");
}

fs.readFile(input, "utf-8", function(error, data) {
  coffee = js2coffee.build(data).code;
  if (program.output != null) {
    // output
  } else {
    console.log(coffee);
  }
});


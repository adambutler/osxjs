var js2coffee = require("js2coffee");

var input = "function foo() { console.log('bar'); }";

var result = js2coffee.build(input);

var program = require("commander");

program.version("0.0.1").option("-o, --output", "Output path");

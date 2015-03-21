var js2coffee = require("js2coffee");

var input = "function foo() { console.log('bar'); }";

var result = js2coffee.build(input);

console.log(result.code);

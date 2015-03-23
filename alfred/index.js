var js2coffee = require("js2coffee");
var copyPaste = require("copy-paste");

var result = js2coffee.build(copyPaste.paste()).code;
copyPaste.copy(result);

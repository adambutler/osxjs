JsOsaDAS1.001.00bplist00�Vscript_/ObjC.import("Cocoa");

app = Application.currentApplication();
app.includeStandardAdditions = true;

// If no superclass is provided, NSObject is subclassed.
ObjC.registerSubclass({
	name: "AppDelegate",
	methods: {
		"btnClickHandler:": {
			types: ["void", ["id"]],
			implementation: function (sender) {
				output.stringValue = app.doShellScript('. ~/.zshrc && echo "'+ObjC.unwrap(textField.stringValue)+'" | js2coffee');
			}
		}
	}
});

var appDelegate = $.AppDelegate.alloc.init;

var styleMask = $.NSTitledWindowMask | $.NSClosableWindowMask | $.NSMiniaturizableWindowMask;

var height = 400;
var width = 600;
var padding = 20;
var paddingDouble = padding*2;

var window = $.NSWindow.alloc.initWithContentRectStyleMaskBackingDefer(
	$.NSMakeRect(0, 0, width, height),
	styleMask,
	$.NSBackingStoreBuffered,
	false
);

var btn = $.NSButton.alloc.initWithFrame($.NSMakeRect(padding, padding, width - paddingDouble, 25));
btn.title = "js2coffee";
btn.bezelStyle = $.NSRoundedBezelStyle;
btn.target = appDelegate;
btn.action = "btnClickHandler:";
btn.keyEquivalent = "\r"; // Enter key

window.contentView.addSubview(btn);

var textFieldLabel = $.NSTextField.alloc.initWithFrame($.NSMakeRect(padding, padding + 120, width - paddingDouble, 24));
textFieldLabel.stringValue = "JavaScript code:";
textFieldLabel.drawsBackground = false;
textFieldLabel.editable = false;
textFieldLabel.bezeled = false;
textFieldLabel.selectable = true;

var output = $.NSTextField.alloc.initWithFrame($.NSMakeRect(padding, height- 120, width - paddingDouble, 100));
output.stringValue = "test";
output.drawsBackground = false;
output.editable = false;
output.bezeled = false;
output.selectable = true;

var textField = $.NSTextField.alloc.initWithFrame($.NSMakeRect(padding, padding + 40, width - paddingDouble, 80));
textField.stringValue = "function foo(){ console.log('bar') }";

window.contentView.addSubview(textField);
window.contentView.addSubview(textFieldLabel);
window.contentView.addSubview(output);

window.center;
window.title = "Handling Button Click Example";
window.makeKeyAndOrderFront(window);                              E jscr  ��ޭ
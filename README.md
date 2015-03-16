# Building OS X applications with JavaScript

An overview of how to build OSX applications with JavaScript, as inspired heavaly by [this blog post](http://tylergaw.com/articles/building-osx-apps-with-js)

## Hello World

In this application we will build a single empty window with the following properties -

- It has a title of "My Awesome Application"
- It should be 600x300
- It can be closed & minimised with standard UI controls

It will looks something like this -

![Hello world screenshot](http://cl.ly/image/03212I433v1P/Screen%20Shot%202015-03-16%20at%2019.21.00.png)

```javascript
ObjC.import("Cocoa");

var styleMask = $.NSTitledWindowMask | $.NSClosableWindowMask | $.NSMiniaturizableWindowMask;
var windowWidth = 600;
var windowHeight = 300;

var window = $.NSWindow.alloc.initWithContentRectStyleMaskBackingDefer(
  $.NSMakeRect(0, 0, windowWidth, windowHeight),
  styleMask,
  $.NSBackingStoreBuffered,
  false
);

window.title = "My Awesome Application";
window.makeKeyAndOrderFront(window);
window.center;
```

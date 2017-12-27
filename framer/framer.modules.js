require=(function e(t,n,r){function s(o,u){if(!n[o]){if(!t[o]){var a=typeof require=="function"&&require;if(!u&&a)return a(o,!0);if(i)return i(o,!0);var f=new Error("Cannot find module '"+o+"'");throw f.code="MODULE_NOT_FOUND",f}var l=n[o]={exports:{}};t[o][0].call(l.exports,function(e){var n=t[o][1][e];return s(n?n:e)},l,l.exports,e,t,n,r)}return n[o].exports}var i=typeof require=="function"&&require;for(var o=0;o<r.length;o++)s(r[o]);return s})({"DynamicLoader":[function(require,module,exports){

/*
DynamicLoader Module for FramerJS
https://github.com/LucienLee/framer-DynamicLoader/
Created by Lucien Lee (@luciendeer), Jan. 12th, 2016
DynamicLoader braeks the barriars between 3rd party web development libraries and Framer, which
help you load local, external stylesheets and scripts dynamically.
Add the following line to your project in Framer Studio.
	{DynamicLoader} = require 'DynamicLoader'
[Load one file]
DynamicLoader.add('script.js’).then(->
 * when script.js loaded successfully
...
).catch(->
 * when script.js loaded failed
...
)
[Load file in series]
DynamicLoader.series(['one.js’, 'two.css', ...]).then( successCallback, failCallback )
[Load file in parallel]
DynamicLoader.series(['one.js’, 'two.css', ...]).then( successCallback, failCallback )
 */
exports.DynamicLoader = (function() {
  function DynamicLoader() {}

  DynamicLoader.add = function(url) {
    var promise;
    promise = new Promise(function(resolve, reject) {
      var file, loaded;
      if (url.substr(url.lastIndexOf('.')) === ".js") {
        loaded = Array.prototype.find.call(document.getElementsByTagName('script'), function(element) {
          if (element.getAttribute('src') === url) {
            return element;
          }
        });
        if (loaded !== void 0) {
          return resolve('have loaded');
        }
        file = document.createElement('script');
        file.src = url;
      } else if (url.substr(url.lastIndexOf('.')) === ".css") {
        loaded = Array.prototype.find.call(document.getElementsByTagName('link'), function(element) {
          if (element.getAttribute('rel') === url) {
            return element;
          }
        });
        if (loaded !== void 0) {
          return resolve('have loaded');
        }
        file = document.createElement('link');
        file.rel = "stylesheet";
        file.href = url;
      }
      file.addEventListener('load', function() {
        return resolve(file);
      });
      file.addEventListener('error', function() {
        return reject(file);
      });
      return document.body.appendChild(file);
    });
    return promise;
  };

  DynamicLoader.series = function(urls) {
    if (!Array.isArray(urls) || urls.length === 0) {
      throw "ERROR: NO URL IN ARRAY!";
    }
    return urls.reduce((function(_this) {
      return function(promise, url) {
        return promise.then(function() {
          return _this.add(url);
        });
      };
    })(this), Promise.resolve());
  };

  DynamicLoader.parallel = function(urls) {
    if (!Array.isArray(urls) || urls.length === 0) {
      throw "ERROR: NO URL IN ARRAY!";
    }
    return Promise.all(urls.map((function(_this) {
      return function(url) {
        return _this.add(url);
      };
    })(this)));
  };

  return DynamicLoader;

})();


},{}],"myModule":[function(require,module,exports){
exports.myVar = "myVariable";

exports.myFunction = function() {
  return print("myFunction is running");
};

exports.myArray = [1, 2, 3];


},{}]},{},[])
//# sourceMappingURL=data:application/json;charset=utf-8;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoiZnJhbWVyLm1vZHVsZXMuanMiLCJzb3VyY2VzIjpbIi4uLy4uLy4uLy4uLy4uL1VzZXJzL2FkL0Rlc2t0b3Av55So5oi36KGM5Li65ZCO5Y+w55WM6Z2iL+eUqOaIt+ihjOS4uuWQjuWPsOeVjOmdoi5mcmFtZXIvbW9kdWxlcy9teU1vZHVsZS5jb2ZmZWUiLCIuLi8uLi8uLi8uLi8uLi9Vc2Vycy9hZC9EZXNrdG9wL+eUqOaIt+ihjOS4uuWQjuWPsOeVjOmdoi/nlKjmiLfooYzkuLrlkI7lj7DnlYzpnaIuZnJhbWVyL21vZHVsZXMvRHluYW1pY0xvYWRlci5jb2ZmZWUiLCJub2RlX21vZHVsZXMvYnJvd3Nlci1wYWNrL19wcmVsdWRlLmpzIl0sInNvdXJjZXNDb250ZW50IjpbIiMgQWRkIHRoZSBmb2xsb3dpbmcgbGluZSB0byB5b3VyIHByb2plY3QgaW4gRnJhbWVyIFN0dWRpby4gXG4jIG15TW9kdWxlID0gcmVxdWlyZSBcIm15TW9kdWxlXCJcbiMgUmVmZXJlbmNlIHRoZSBjb250ZW50cyBieSBuYW1lLCBsaWtlIG15TW9kdWxlLm15RnVuY3Rpb24oKSBvciBteU1vZHVsZS5teVZhclxuXG5leHBvcnRzLm15VmFyID0gXCJteVZhcmlhYmxlXCJcblxuZXhwb3J0cy5teUZ1bmN0aW9uID0gLT5cblx0cHJpbnQgXCJteUZ1bmN0aW9uIGlzIHJ1bm5pbmdcIlxuXG5leHBvcnRzLm15QXJyYXkgPSBbMSwgMiwgM10iLCIjIyNcbkR5bmFtaWNMb2FkZXIgTW9kdWxlIGZvciBGcmFtZXJKU1xuaHR0cHM6Ly9naXRodWIuY29tL0x1Y2llbkxlZS9mcmFtZXItRHluYW1pY0xvYWRlci9cbkNyZWF0ZWQgYnkgTHVjaWVuIExlZSAoQGx1Y2llbmRlZXIpLCBKYW4uIDEydGgsIDIwMTZcbkR5bmFtaWNMb2FkZXIgYnJhZWtzIHRoZSBiYXJyaWFycyBiZXR3ZWVuIDNyZCBwYXJ0eSB3ZWIgZGV2ZWxvcG1lbnQgbGlicmFyaWVzIGFuZCBGcmFtZXIsIHdoaWNoXG5oZWxwIHlvdSBsb2FkIGxvY2FsLCBleHRlcm5hbCBzdHlsZXNoZWV0cyBhbmQgc2NyaXB0cyBkeW5hbWljYWxseS5cbkFkZCB0aGUgZm9sbG93aW5nIGxpbmUgdG8geW91ciBwcm9qZWN0IGluIEZyYW1lciBTdHVkaW8uXG5cdHtEeW5hbWljTG9hZGVyfSA9IHJlcXVpcmUgJ0R5bmFtaWNMb2FkZXInXG5bTG9hZCBvbmUgZmlsZV1cbkR5bmFtaWNMb2FkZXIuYWRkKCdzY3JpcHQuanPigJkpLnRoZW4oLT5cbiMgd2hlbiBzY3JpcHQuanMgbG9hZGVkIHN1Y2Nlc3NmdWxseVxuLi4uXG4pLmNhdGNoKC0+XG4jIHdoZW4gc2NyaXB0LmpzIGxvYWRlZCBmYWlsZWRcbi4uLlxuKVxuW0xvYWQgZmlsZSBpbiBzZXJpZXNdXG5EeW5hbWljTG9hZGVyLnNlcmllcyhbJ29uZS5qc+KAmSwgJ3R3by5jc3MnLCAuLi5dKS50aGVuKCBzdWNjZXNzQ2FsbGJhY2ssIGZhaWxDYWxsYmFjayApXG5bTG9hZCBmaWxlIGluIHBhcmFsbGVsXVxuRHluYW1pY0xvYWRlci5zZXJpZXMoWydvbmUuanPigJksICd0d28uY3NzJywgLi4uXSkudGhlbiggc3VjY2Vzc0NhbGxiYWNrLCBmYWlsQ2FsbGJhY2sgKVxuIyMjXG5cblxuXG5cbmNsYXNzIGV4cG9ydHMuRHluYW1pY0xvYWRlclxuXG5cdCMgUHJvbWlzaWZ5IHNpbmdsZSBkeW5hbWljIHNjcmlwdCBsb2FkaW5nXG5cdEBhZGQgPSAodXJsKSAtPlxuXHRcdHByb21pc2UgPSBuZXcgUHJvbWlzZSgocmVzb2x2ZSwgcmVqZWN0KSAtPlxuXHRcdFx0aWYgdXJsLnN1YnN0ciggdXJsLmxhc3RJbmRleE9mKCcuJykgKSBpcyBcIi5qc1wiXG5cdFx0XHRcdCMgbG9hZCBzY3JpcHQgb25jZVxuXHRcdFx0XHRsb2FkZWQgPSBBcnJheS5wcm90b3R5cGUuZmluZC5jYWxsIGRvY3VtZW50LmdldEVsZW1lbnRzQnlUYWdOYW1lKCdzY3JpcHQnKSwgKGVsZW1lbnQpIC0+XG5cdFx0XHRcdFx0aWYgZWxlbWVudC5nZXRBdHRyaWJ1dGUoJ3NyYycpIGlzIHVybCB0aGVuIHJldHVybiBlbGVtZW50XG5cdFx0XHRcdGlmIGxvYWRlZCBpc250IHVuZGVmaW5lZCB0aGVuIHJldHVybiByZXNvbHZlICdoYXZlIGxvYWRlZCdcblxuXHRcdFx0XHRmaWxlID0gZG9jdW1lbnQuY3JlYXRlRWxlbWVudCAnc2NyaXB0J1xuXHRcdFx0XHRmaWxlLnNyYyA9IHVybFxuXHRcdFx0ZWxzZSBpZiB1cmwuc3Vic3RyKCB1cmwubGFzdEluZGV4T2YoJy4nKSApIGlzIFwiLmNzc1wiXG5cdFx0XHRcdCMgbG9hZCBzdHlsZSBvbmNlXG5cdFx0XHRcdGxvYWRlZCA9IEFycmF5LnByb3RvdHlwZS5maW5kLmNhbGwgZG9jdW1lbnQuZ2V0RWxlbWVudHNCeVRhZ05hbWUoJ2xpbmsnKSwgKGVsZW1lbnQpIC0+XG5cdFx0XHRcdFx0aWYgZWxlbWVudC5nZXRBdHRyaWJ1dGUoJ3JlbCcpIGlzIHVybCB0aGVuIHJldHVybiBlbGVtZW50XG5cdFx0XHRcdGlmIGxvYWRlZCBpc250IHVuZGVmaW5lZCB0aGVuIHJldHVybiByZXNvbHZlICdoYXZlIGxvYWRlZCdcblxuXHRcdFx0XHRmaWxlID0gZG9jdW1lbnQuY3JlYXRlRWxlbWVudCAnbGluaydcblx0XHRcdFx0ZmlsZS5yZWwgPSBcInN0eWxlc2hlZXRcIlxuXHRcdFx0XHRmaWxlLmhyZWYgPSB1cmxcblxuXHRcdFx0ZmlsZS5hZGRFdmVudExpc3RlbmVyICdsb2FkJywgLT5cblx0XHRcdFx0cmVzb2x2ZSBmaWxlXG5cdFx0XHRmaWxlLmFkZEV2ZW50TGlzdGVuZXIgJ2Vycm9yJywgLT5cblx0XHRcdFx0cmVqZWN0IGZpbGVcblx0XHRcdGRvY3VtZW50LmJvZHkuYXBwZW5kQ2hpbGQgZmlsZVxuXHRcdClcblxuXHRcdHJldHVybiBwcm9taXNlXG5cblx0IyBEeW5hbWljIGZpbGUgbG9hZGluZyBpbiBzZXJpZXNcblx0QHNlcmllcyA9ICh1cmxzKSAtPlxuXHRcdGlmICFBcnJheS5pc0FycmF5KHVybHMpIG9yIHVybHMubGVuZ3RoIGlzIDAgdGhlbiB0aHJvdyBcIkVSUk9SOiBOTyBVUkwgSU4gQVJSQVkhXCJcblxuXHRcdHJldHVybiB1cmxzLnJlZHVjZShcblx0XHRcdChwcm9taXNlLCB1cmwpID0+XG5cdFx0XHRcdHJldHVybiBwcm9taXNlLnRoZW4oID0+IEBhZGQodXJsKSApXG5cdFx0XHQsXG5cdFx0XHRQcm9taXNlLnJlc29sdmUoKSlcblxuXHQjIER5bmFtaWMgZmlsZSBsb2FkaW5nIGluIHBhcmFsbGVsXG5cdEBwYXJhbGxlbCA9ICh1cmxzKSAtPlxuXHRcdGlmICFBcnJheS5pc0FycmF5KHVybHMpIG9yIHVybHMubGVuZ3RoIGlzIDAgdGhlbiB0aHJvdyBcIkVSUk9SOiBOTyBVUkwgSU4gQVJSQVkhXCJcblxuXHRcdFByb21pc2UuYWxsKFxuXHRcdFx0dXJscy5tYXAoICh1cmwpID0+XG5cdFx0XHRcdHJldHVybiBAYWRkKHVybClcblx0XHQpKSIsIihmdW5jdGlvbiBlKHQsbixyKXtmdW5jdGlvbiBzKG8sdSl7aWYoIW5bb10pe2lmKCF0W29dKXt2YXIgYT10eXBlb2YgcmVxdWlyZT09XCJmdW5jdGlvblwiJiZyZXF1aXJlO2lmKCF1JiZhKXJldHVybiBhKG8sITApO2lmKGkpcmV0dXJuIGkobywhMCk7dmFyIGY9bmV3IEVycm9yKFwiQ2Fubm90IGZpbmQgbW9kdWxlICdcIitvK1wiJ1wiKTt0aHJvdyBmLmNvZGU9XCJNT0RVTEVfTk9UX0ZPVU5EXCIsZn12YXIgbD1uW29dPXtleHBvcnRzOnt9fTt0W29dWzBdLmNhbGwobC5leHBvcnRzLGZ1bmN0aW9uKGUpe3ZhciBuPXRbb11bMV1bZV07cmV0dXJuIHMobj9uOmUpfSxsLGwuZXhwb3J0cyxlLHQsbixyKX1yZXR1cm4gbltvXS5leHBvcnRzfXZhciBpPXR5cGVvZiByZXF1aXJlPT1cImZ1bmN0aW9uXCImJnJlcXVpcmU7Zm9yKHZhciBvPTA7bzxyLmxlbmd0aDtvKyspcyhyW29dKTtyZXR1cm4gc30pIl0sIm5hbWVzIjpbXSwi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

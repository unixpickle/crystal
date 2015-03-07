# Crystal

Keep your `<canvas>` elements crystal clear by automatically resizing them. But why wouldn't your canvas be clear in the first place? Well, in this ever changing world of mobile devices and high DPI displays, it can be nearly impossible to keep your canvas looking nice.

## Dart version

This used to be a Dart project. You can view that on [a separate branch](https://github.com/unixpickle/crystal/tree/dart-version).

## Catching DPI changes

When someone drags a browser between displays with different DPIs, or when they zoom in or out on a mobile device, the effective DPI of your web page changes. The `DpiMonitor` makes it easy to track DPI changes in a cross-platform way. Here is the usage:

```javascript
var monitor = new window.crystal.DpiMonitor();
console.log('initial device pixel ration ' + monitor.getPixelRatio());
monitor.addListener(function() {
    console.log('new pixel ration ' + monitor.getPixelRatio());
});
```

From there on out, you should only use the monitor's `getPixelRatio()` method to determine the device's pixel ratio. You should not use `window.devicePixelRatio` since it may not report changes due to zooming or rotations, and may be out of sync with the value in the `DpiMonitor`.

# License

**Crystal** is licensed under the BSD 2-clause license. See [LICENSE](LICENSE).

```
Copyright (c) 2015, Alex Nichol.
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this
   list of conditions and the following disclaimer. 
2. Redistributions in binary form must reproduce the above copyright notice,
   this list of conditions and the following disclaimer in the documentation
   and/or other materials provided with the distribution.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR
ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
```

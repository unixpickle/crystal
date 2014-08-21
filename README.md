# Crystal

Keep your `<canvas>` elements crystal clear by automatically resizing them. But why wouldn't your canvas be clear in the first place? Well, in this ever changing world of mobile devices and high DPI displays, it can be nearly impossible to keep your canvas looking nice.

## Catching DPI changes

When someone drags a browser between displays with different DPIs, or when they zoom in or out on a mobile device, the effective DPI of your web page changes. The `DpiMonitor` makes it easy to track DPI changes in a cross-platform way. Here is the usage:

    DpiMonitor monitor = new DpiMonitor();
    print('initial device pixel ratio ${monitor.pixelRatio}');
    monitor.onChange.listen((double x) {
      print('new device pixel ratio $x');
    });

From there on out, you should only use the monitor's `pixelRatio` property or the value passed to your listener functions to determine the device pixel ratio. The `window.devicePixelRatio` may not report changes due to zooming or rotations, and may be out of sync with the value in the `DpiMonitor`.

## Simple Scalable `<canvas>`

The `DpiMonitor` is great for general-purpose use, but it still leaves canvas resizing up to you. The `ScalableCanvas` abstract class gives you an easier way to keep fixed-size canvases looking clear.

Subclass `ScalableCanvas` and implement your own `draw` method. This method will be called when the DPI changes so that your canvas resizes instantly.

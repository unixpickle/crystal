part of crystal;

/**
 * Subclass this class to manage a canvas that automatically resizes to the
 * device's pixel ratio.
 */
abstract class ScalableCanvas {
  /**
   * The [DpiMonitor] that governs this scalable canvas.
   */
  final DpiMonitor dpiMonitor;
  
  /**
   * The width and height attributes of this canvas will be updated to fit the
   * device pixel ratio.
   */
  final CanvasElement canvas;
  
  /**
   * The visible width that this canvas should have. This is the size of the
   * element according to CSS. This will not change based on the DPI.
   */
  final int width;
  
  /**
   * See [width].
   */
  final int height;
  
  /**
   * The current width of the canvas based on the current DPI.
   */
  int get canvasWidth => (dpiMonitor.pixelRatio * width).round();
  
  /**
   * See [canvasWidth].
   */
  int get canvasHeight => (dpiMonitor.pixelRatio * height).round();
  
  /**
   * The current pixel ratio of [dpiMonitor]. This is a convenience method.
   */
  double get pixelRatio => dpiMonitor.pixelRatio;
  
  StreamSubscription _sub;
  
  /**
   * Create an instance that governs [canvas] at the size [width] x [height].
   * 
   * If [width] and [height] are not specified, the value will be derived by
   * reading the current size of the canvas.
   * 
   * You may optionally specify your own [monitor]. If you do not, the default
   * [DpiMonitor] will be used.
   */
  ScalableCanvas(CanvasElement canvas, {int width: -1, int height: -1,
                 DpiMonitor monitor: null})
      : canvas = canvas,
        width = (width < 0 ? canvas.width : width),
        height = (height < 0 ? canvas.height : height),
        dpiMonitor = (monitor == null ? new DpiMonitor() : monitor) {
    canvas.style.width = '${width}px';
    canvas.style.height = '${height}px';
    canvas.width = canvasWidth;
    canvas.height = canvasHeight;
    _sub = dpiMonitor.onChange.listen((_) => scale());
  }
  
  /**
   * Implement this in your subclass to redraw the view at the new pixel ratio.
   */
  void draw();
  
  /**
   * Stop listening for DPI change events.
   */
  void destroy() {
    _sub.cancel();
  }
  
  /**
   * Called to re-scale and re-draw this canvas. Usually you will not need to
   * call this yourself, since it will be triggered by DPI change events.
   */
  void scale() {
    canvas.width = canvasWidth;
    canvas.height = canvasHeight;
    draw();
  }
}
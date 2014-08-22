part of crystal;

DpiMonitor _gMonitor = null;

/**
 * An interface for monitoring DPI changes.
 */
abstract class DpiMonitor {
  /**
   * Create or return an existing [DpiMonitor] subclass that is appropriate for
   * the current browser.
   */
  factory DpiMonitor() {
    if (_gMonitor == null) {
      _gMonitor = new DprMonitor();
    }
    return _gMonitor;
  }
  
  /**
   * A broadcast stream of DPI change events. Whenever the device's DPI changes,
   * this stream will send the new [pixelRatio] over a stream.
   */
  Stream<double> get onChange;
  
  /**
   * Indicates if calling [requestUpdate] may serve to increase the speed of DPI
   * change updates.
   * 
   * Some [DpiMonitor] subclasses work by periodically checking the DPI. If your
   * application has a frequent timer or something of the sort, you may want to
   * check for DPI updates on *that* timer.
   */
  bool get usesUpdateRequests => false;
  
  /**
   * Returns the current device pixel ratio. This will only update after events
   * are fired on [onChange], so this value may lag behind
   * `window.devicePixelRatio` or some other value.
   */
  double get pixelRatio;
  
  /**
   * If [usesUpdateRequests] is `true`, calling this will instruct the monitor
   * to check if the DPI has changed. The [onChange] stream's listeners will be
   * called before this method returns if the DPI has changed.
   */
  void requestUpdate() {
    
  }
}

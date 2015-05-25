(function() {

  var UPDATE_INTERVAL = 250;
  
  var currentRatio = calculateRatio();
  var listeners = [];
  
  var supportsMatchMedia = ('function' === typeof window.matchMedia);
  var minMediaMatch = null;
  var maxMediaMatch = null;

  function addListener(f) {
    listeners.push(f);
  }

  function calculateRatio() {
    // TODO: here, do something to detect browser zoom.
    return window.devicePixelRatio;
  }

  function getRatio() {
    return currentRatio;
  }

  function handleChange() {
    // Call each listener.
    // NOTE: we copy the listeners because any given listener could remove/add
    // listeners as it pleases.
    var theListeners = listeners.slice();
    for (var i = 0, len = theListeners.length; i < len; ++i) {
      theListeners[i]();
    }
    
    if (supportsMatchMedia) {
      minMediaMatch.removeListener(update);
      maxMediaMatch.removeListener(update);
      registerMediaListeners();
    }
  }

  function initialize() {
    if (!supportsMatchMedia) {
      setInterval(update, UPDATE_INTERVAL);
    } else {
      registerMediaListeners();
    }
  }

  function registerMediaListeners() {
    minMediaMatch = window.matchMedia('screen and (min-resolution: ' +
      window.devicePixelRatio + 'dppx)');
    maxMediaMatch = window.matchMedia('screen and (max-resolution: ' +
      window.devicePixelRatio + 'dppx)');
    minMediaMatch.addListener(update);
    maxMediaMatch.addListener(update);
  }

  function removeListener(f) {
    var idx = listeners.indexOf(f);
    if (idx >= 0) {
      listeners.splice(idx, 1);
    }
  }

  function update() {
    var rat = calculateRatio();
    if (rat !== currentRatio) {
      currentRatio = rat;
      handleChange();
    }
  }

  window.crystal = {
    addListener: addListener,
    getRatio: getRatio,
    removeListener: removeListener
  };

  initialize();

})();
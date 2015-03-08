(function() {
  window.crystal.addListener(update);
  window.addEventListener('load', update);

  function update() {
    var canvas = document.getElementById('canvas');
    
    // Resize the canvas to be crystal clear.
    var size = Math.round(window.crystal.getRatio() * 200);
    canvas.width = size;
    canvas.height = size;
    
    // Draw into the canvas.
    var context = canvas.getContext('2d');
    context.fillStyle = '#000000';
    context.beginPath();
    context.arc(size/2, size/2, size/2, 0, 2*Math.PI);
    context.fill();
  }
})();
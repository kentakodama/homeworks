document.addEventListener("DOMContentLoaded", function(){
  const canvas = document.getElementById('mycanvas');
  canvas.height = 500;
  canvas.width = 500;
  const ctx = canvas.getContext('2d');

  ctx.fillStyle = 'red';
  ctx.fillRect(200, 200, 500, 500);

  ctx.beginPath();
  ctx.arc(75, 75, 50, 0, 2 * Math.PI);
  ctx.strokeStyle = 'black';
  ctx.lineWidth = 3;
  ctx.stroke();

});

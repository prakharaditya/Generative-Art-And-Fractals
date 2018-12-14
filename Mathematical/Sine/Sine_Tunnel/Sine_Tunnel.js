let theta = 0;
let x = 0;
let amp = 50; // Height
let freq = 1;
let x_inc = 0.1;

function setup()
{
  createCanvas(400, 300);
  background(0);
  stroke(255);
  x = 0;
  amp = 50;
  freq = 1;
  theta = 0;
}

function draw()
{
  translate(0, height / 2);
  let y = sin(theta * freq) * amp;
  ellipse(x, y, 1, 1);
  theta +=0.5;
  x += x_inc;
  
  if (x > width)
  {
    x = 0;
    amp *= 0.5;
    freq *= 0.5;
  }
}
let r = 0;
let s = 600;
function setup()
{
  createCanvas(600, 600);
  background(0);
  noFill();
  stroke(255);
}

function draw()
{
  if ( s > 0)
  {
    translate(width / 2, height / 2);
    rotate(r);
    stroke(r, s, 255);
    ellipse(0, 0, 300 - r, s);
    r += 5;
    s -= 5;
  }
}
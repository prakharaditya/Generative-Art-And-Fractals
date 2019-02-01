float r = 0;
float s = 600;
void setup()
{
  size(600, 600);
  background(0);
  noFill();
  stroke(255);
}

void draw()
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

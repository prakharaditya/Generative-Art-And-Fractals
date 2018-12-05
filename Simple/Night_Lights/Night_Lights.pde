void setup()
{
  size(500, 400);
  background(0);
  noStroke();
  frameRate(15);
}

void draw()
{
  fill(0, 10);
  rect(0, 0, width, height);
  fill(255);
  ellipse(random(width), random(height), 20, 20);
}

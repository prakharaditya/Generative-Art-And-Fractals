float x = 0;
float y = 0;
float space = 20;
float prob = 0.75;

void setup() {
  size(600, 600);
  background(0);
}

void draw() {
  stroke(255);
  strokeWeight(5);
  strokeCap(ROUND);
  for (int i = 0; i < 60; ++i)
  {

    if (random(1) < prob) {
      line(x, y, x + space, y + space);
    } else {
      line(x, y + space, x+ space, y);
    }

    x += space;

    if (x > width)
    {
      x = 0;
      y += space;
    }
  }
}

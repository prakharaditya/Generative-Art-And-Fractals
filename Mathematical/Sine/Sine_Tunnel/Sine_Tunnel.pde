float theta = 0;
float x = 0;
int amp = 50; // Height
float freq = 1;
float x_inc = 0.1;

void setup()
{
  size(400, 300);
  background(0);
  stroke(255);
}

void draw()
{
  translate(0, height / 2);
  float y = sin(theta * freq) * amp;
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

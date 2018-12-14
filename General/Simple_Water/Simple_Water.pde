
float time = 0.0;

void setup()
{
  size(800, 300);
}

void draw()
{ 
  background(255);
  float x = 0.0;
  while (x < width)
  {
    float a = height / 2 + 20 * noise(x / 100, time);
    stroke(0, 50, 150);
    line(x, a, x, height);
    x += 1;
  }
  time += 0.02;
}

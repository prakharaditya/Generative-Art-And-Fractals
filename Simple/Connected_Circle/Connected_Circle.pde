float radius, x, y, px, py;
int step, rotateTo;

void setup()
{
  size(400, 400); 
  background(255);
  
  radius = 150;
  step = 9;
  rotateTo = 360 * 3;  
}

void draw()
{
  translate(width / 2, height / 2); 
  rotate(radians(90));
  rectMode(CENTER);
  
  int pointsDrawFrom = (rotateTo / step) - 14;
  
  for (int i = 0; i < rotateTo; i += step)
  { 
    color c;
    
    if      (i >= rotateTo / 2) c = color(255, 0, 0, 255);
    else if (i >= rotateTo / 3) c = color(0, 255, 0, 255);
    else                        c = color(0, 0, 255, 255);
    
    fill(c);

    x = (float)(Math.cos(radians(i)) * radius);
    y = (float)(Math.sin(radians(i)) * radius);

    if ((i / step) < pointsDrawFrom) // So will not try to draw past last point
    {
      px = (float)(Math.cos(radians(i + (14 * step))) * radius);
      py = (float)(Math.sin(radians(i + (14 * step))) * radius);
      line(x, y, px, py);
    }  
    
    rect(x, y, 5, 5);
    radius += 0.3f;
  }
  noLoop();
}

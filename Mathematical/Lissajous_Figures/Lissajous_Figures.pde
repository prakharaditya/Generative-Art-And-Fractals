final int SIZE = 50;
final int SPACER = 15;
float angle = 0;
final int CIRCLES = 10;

int[] pointsX;
int[] pointsY;

void setup()
{
  size(710, 710);
  smooth();
  background(0);
  pointsX = new int[CIRCLES];
  pointsY = new int[CIRCLES];
  
  for (int i = 0; i < CIRCLES; ++i)
  {
    pointsX[i] = 0;
    pointsY[i] = 0;
  }
}

void draw()
{
  fill(0);
  noStroke();
  rect(0, 0, width, SIZE + SPACER / 2 + 2);
  rect(0, 0, SIZE + SPACER / 2 + 2, height);
  strokeWeight(1);
  stroke(255);
  noFill();  
  
  // Top
  
  for (int i = 0; i < CIRCLES; ++i)
  {
    int offsetAxis = SIZE + ((i) * SIZE) + (SPACER + (SIZE / 2)) + ((i) * SPACER);
    int offsetOther = SPACER / 2 + (SIZE / 2);

    int _tx = (int)((SIZE / 2) * cos(angle * (i + 1) - HALF_PI));
    int _ty = (int)((SIZE / 2) * sin(angle * (i + 1) - HALF_PI));
    
    ellipse(offsetAxis, offsetOther, SIZE, SIZE);
    ellipse(_tx + offsetAxis, _ty + offsetOther, 5, 5);
    pointsX[i] = _tx + offsetAxis;
  }

  // Side
  for (int i = 0; i < CIRCLES; ++i)
  {
    int offsetAxis = SIZE + ((i) * SIZE) + (SPACER + (SIZE / 2)) + ((i) * SPACER);
    int offsetOther = SPACER / 2 + (SIZE / 2);    
    int _sx = (int)((SIZE / 2) * cos(angle * (i + 1) - HALF_PI));
    int _sy = (int)((SIZE / 2) * sin(angle * (i + 1) - HALF_PI));
    ellipse(offsetOther, offsetAxis, SIZE, SIZE);
    ellipse(_sx + offsetOther, _sy + offsetAxis, 5, 5);
    pointsY[i] = _sy + offsetAxis;
  }
  
  noStroke();
  fill(0, 5);
  rect(SIZE + SPACER / 2 + 2, SIZE + SPACER / 2 + 2, width, height);
  
  for(int i = 0; i < CIRCLES; ++i)
  {
    for(int j = 0; j < CIRCLES; ++j)
    {
      fill(255, 255, 255);
      ellipse(pointsX[i], pointsY[j], 2, 2);
    }
  }

  angle += 0.01;
  angle = angle % TWO_PI;
  
  for (int i = 0; i < CIRCLES; ++i)
  {
    pointsX[i] = 0;
    pointsY[i] = 0;
  }
}

final int NUMBER_OF_POINTS   = 360 / 30;
      int timesTable         = 1;
final int RADIUS             = 200;
      float[][] points;

void setup()
{
  size(600, 600);
  points = new float[360 / NUMBER_OF_POINTS][2];
  // END COUNTER CODE
  frameRate(1);
  // END COUNTER CODE
}

void draw()
{
  background(255);
  fill(0);
  
  // START COUNTER CODE
  textSize(24);
  text(timesTable, 50, 50);
  // END COUNTER CODE
  
  translate(width / 2, height / 2);

  int p = 0; // Controls index of points array.
  
  /*
   * Rebuilds points array for each times table.
   * If not incrementing each from you could make this
   * static and save some time each frame.
  */
  for (int i = 0; i < 360; i+= NUMBER_OF_POINTS)
  {
    points[p][0] = RADIUS * (float)Math.cos(radians(i)); // X
    points[p][1] = RADIUS * (float)Math.sin(radians(i)); // Y
    p++;
  }

  for(int i = 0; i < points.length; i++)
  {
    strokeWeight(5);
    
    // Draw a point.
    point(points[i][0], points[i][1]); 
    
    strokeWeight(2);
    
    // Calculate the point to draw to.
    int n = (timesTable * i) % NUMBER_OF_POINTS;
    
    // Draw from current point to next point
    line(points[i][0], points[i][1], points[n][0], points[n][1]);    
  }
  
  // START COUNTER CODE
  timesTable++;
  // END COUNTER CODE
}

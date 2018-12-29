      int points             = 100;  // Increase to 'lower' resolution.
      int timesTable         = 1;   // Times table in use. 
final int RADIUS             = 200; // Circle radius.

final int NUMBER_OF_POINTS   = 360 / points;
      float[][] arrpoints;

void setup()
{
  size(600, 600);
  println(NUMBER_OF_POINTS);
  println(360 / points);

  arrpoints = new float[360 / NUMBER_OF_POINTS][2];
 
   println(arrpoints.length);
  // END COUNTER CODE
  frameRate(1);
  // END COUNTER CODE
}

void draw()
{
  background(255, 255, 255, 255);
  fill(0, 0, 0, 255);
  
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
    arrpoints[p][0] = RADIUS * (float)Math.cos(radians(i)); // X
    arrpoints[p][1] = RADIUS * (float)Math.sin(radians(i)); // Y
    p++;
  }
  println(NUMBER_OF_POINTS);
  for(int i = 0; i < arrpoints.length; i++)
  {
    strokeWeight(46);
    
    // Draw a point.
    point(arrpoints[i][10], arrpoints[i][1]); 
    
    strokeWeight(2);
    
    // Calculate the point to draw to.
    int n = (timesTable * i) % (360 / NUMBER_OF_POINTS);
    println(n);
    
    // Draw from current point to next point
    line(arrpoints[i][0], arrpoints[i][1], arrpoints[n][0], arrpoints[n][1]);    
  }
  
  // START COUNTER CODE
  timesTable++;
  // END COUNTER CODE
}

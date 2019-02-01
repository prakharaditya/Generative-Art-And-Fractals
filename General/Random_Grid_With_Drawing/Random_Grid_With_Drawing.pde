final int SIZE = 10;
final int OUTER_PADDING = 20;

void setup()
{
   size(550, 550); 
}

void draw()
{
  background(255);
  int [][] myData = new int [50][50];
  myClearData(myData);
  myCircle(myData, 20, 20, 20);
  myDraw(myData); 
  noLoop();
}

void myCircle(int[][] array, int x, int y, float radius)
{
  for (int i = 0; i < 360; i++)
  {  
    int c = x + round(radius * cos(radians(i)));
    int r = y + round(radius * sin(radians(i)));
    array[r][c] = 1;
  }

}

void myLine(int[][] array, int x1, int y1, int x2, int y2)
{
  double dy = y2 - y1;
  double dx = x2 - x1;
  double m = dy / dx;
  double c = y1 - m * x1;  
  // -1's above and below offset for 0 indexing in arrays. 
  for (int x = x1; x < x2; ++x)
  {
    int y = (int)(m * x + c);
    println(x + ", " + y);
    array[y][x] = 1;
  }
}

void myRect(int[][] array, int x, int y, int width, int height)
{
  // Bounds checking, will give the effect of 'clipping'
  int tX = (x > array.length) ? array.length : (x < 1) ? 0 : x - 1;
  int tY = (y > array[0].length) ? array[0].length : (y < 1) ? 0 : y - 1;
  
  int tH = (x + height > array.length) ? array.length - x : x + height;
  int tW = (y + width > array[0].length) ? array[0].length - y : y + width;
  
  // -1's above and below offset for 0 indexing in arrays. 
  for (int i = tX; i < tH; i++)
  {
    for (int j = tY; j < tW; j++)
    {
        array[i][j] = 1;
    }
  }
}

public void myDraw(int[][] array)
{
  for (int i = 0; i < array.length; i++)
  {
    for (int j = 0; j < array[i].length; j++)
    {
      int sqFill = (array[i][j] == 0) ? 255 : 0;
      fill(sqFill);
      stroke(200);
      rect(   OUTER_PADDING + (j * SIZE), 
              OUTER_PADDING + (i * SIZE), 
              SIZE, 
              SIZE);      
    }
  }
}


public void myClearData(int[][] array)
{
  for (int i = 0; i < array.length; i++)
  {
    for (int j = 0; j < array[i].length; j++)
    {
      array[i][j] = 0;
    }
  }
}

public void myRandomSet(int[][] array, int n)
{
 int i = 0;
 int j = 0;
 boolean go = false;
 
 for (int k = 0; k < n; k++)
 {
   i = (int)random(array.length);   
   j = (int)random(array[i].length);
   
   while(!go)
   {
     i = (int)random(array.length);   
     j = (int)random(array[i].length);
     
     go = (array[i][j] == 1) ? false : true;      
     
   }
   array[i][j] = 1;
   go = false;
 }
}

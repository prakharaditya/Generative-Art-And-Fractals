final int SIZE = 10;
final int OUTER_PADDING = 50;

//int [][] myData = new int [10][10];

void setup()
{
   size(600, 600); 
}

void draw()
{
  background(255);
  int [][] myData = new int [50][50];
  myClearData( myData);
  myRandomSet( myData, 1000);
  myDraw( myData); 
  noLoop();
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

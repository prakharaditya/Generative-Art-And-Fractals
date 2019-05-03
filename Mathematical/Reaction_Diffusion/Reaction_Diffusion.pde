Cell[][] grid;
Cell[][] prev;

float dA = 1;
float dB = 0.5;
float feed = 0.055;
float kill = 0.062;

void setup() {
  size(400, 400);
  pixelDensity(1);
  grid = new Cell[width][height];
  prev = new Cell[width][height];
  
  for (int x = 0; x < width; ++x) {
    for (int y = 0; y < height; ++y) {
      grid[x][y] = new Cell(1, 0);
      prev[x][y] = new Cell(1, 0);
    }
  }

  for (int x = 100; x < 140; x++)
  {
    for (int y = 100; y < 140; y++)
    {
      grid[x][y] = new Cell(1, 1);
      prev[x][y] = new Cell(1, 1);
    }
  }
}

void draw() {
  background(51);

  for (int x = 1; x < width - 1; ++x) {   
    for (int y = 1; y < height - 1; ++y) {
      
      Cell g = grid[x][y];
      Cell n = prev[x][y];

      float a = n.a;
      float b = n.b;

      float lA = 0;
      lA += a * -1;
      lA += prev[x+1][y].a * 0.2;
      lA += prev[x-1][y].a * 0.2;
      lA += prev[x][y+1].a * 0.2;
      lA += prev[x][y-1].a * 0.2;
      lA += prev[x-1][y-1].a * 0.05;
      lA += prev[x+1][y-1].a * 0.05;
      lA += prev[x-1][y+1].a * 0.05;
      lA += prev[x+1][y+1].a * 0.05;

      float lB = 0;
      lB += b * -1;
      lB += prev[x+1][y].b * 0.2;
      lB += prev[x-1][y].b * 0.2;
      lB += prev[x][y+1].b * 0.2;
      lB += prev[x][y-1].b * 0.2;
      lB += prev[x-1][y-1].b * 0.05;
      lB += prev[x+1][y-1].b * 0.05;
      lB += prev[x-1][y+1].b * 0.05;
      lB += prev[x+1][y+1].b * 0.05;

      grid[x][y].a = a + (dA * lA - a * b * b +feed * (1 - a)) * 1;
      grid[x][y].a = constrain(grid[x][y].a, 0, 1);
      grid[x][y].b = b + (dB * lB + a * b * b - (kill + feed) * b) * 1;
      grid[x][y].b = constrain(grid[x][y].b, 0, 1);
    }
  }

  loadPixels();  
  for (int x = 1; x < width - 1; ++x) {   
    for (int y = 1; y < height - 1; ++y) {
      Cell c = grid[x][y];
      pixels[x + y * width] = color((c.a - c.b) * 255);
    }
  }
  updatePixels(); 

  swap();
}

public void swap() {
  Cell[][] tmp = prev;
  prev = grid;
  grid = tmp;
}

class Cell {
  float a;
  float b;

  public Cell(float _a, float _b) {
    a = _a;
    b = _b;
  }
}

void mouseDragged() {
  addMatter();
}

void mousePressed() {
  addMatter();

}

void addMatter() {
  for (int x = mouseX; x < mouseX + 10; x++)
  {
    for (int y = mouseY; y < mouseY + 10; y++)
    {
      
      grid[x][y] = new Cell(1, 1);
      prev[x][y] = new Cell(1, 1);
    }
  }
}

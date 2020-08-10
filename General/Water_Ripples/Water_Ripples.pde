int cols;
int rows;

float[][] curr;
float[][] prev;
float damping = 0.999f;

void setup() {
  size(600, 400);
  cols = width;
  rows = height;
  curr = new float[cols][rows];
  prev = new float[cols][cols];
}

void mouseDragged() {
 if (
    mouseX < width && 
    mouseX >= 0 && 
    mouseY >= 0 &&
    mouseY < height
  ) {
    prev[mouseX][mouseY] = 500;  
  }
}

void draw() {
  background(0);
  loadPixels();
  for (int i = 1; i < cols - 1; ++i) {
    for (int j = 1; j < rows - 1; ++j) {
      curr[i][j] = (
        prev[i - 1][j] + 
        prev[i + 1][j] +
        prev[i][j + 1] + 
        prev[i][j - 1]) / 2 - curr[i][j];
        
      curr[i][j] = curr[i][j] * damping;

      int index = i + j * cols;
      pixels[index] = color(curr[i][j]);
    }
  }
  updatePixels();
  
  float[][] tmp = prev;
  prev = curr;
  curr = tmp;
}

import java.util.Arrays;

float r = 5;
float k = 30;
PVector[] grid;
ArrayList<PVector> active;
float w = r / sqrt(2);
int cols, rows;

void setup() {
  size(600, 600);

  cols = floor(width / w);
  rows = floor(height / w);
  grid = new PVector[cols * rows];
  active = new ArrayList<PVector>();
  
  for (int i = 0; i < cols * rows; ++i) {
    grid[i] = null;
  }

  PVector pos = new PVector(random(width), random(height));
  int i = floor(pos.x / w);
  int j = floor(pos.y / w);
  grid[i + j * cols] = pos;
  active.add(pos);
}

void draw() {
  background(51);
  strokeWeight(2);
  stroke(255);

  for (int t = 0; t < 500; ++t) {
    if (!active.isEmpty()) {
      int rIndex = floor(random(active.size()));
      boolean found = false;
      PVector pos = active.get(rIndex);
      
      for (int n = 0; n < k; ++n) {
        PVector sample = PVector.random2D();
        float m = random(2, 2 * r);
        sample.setMag(m);
        sample.add(pos);

        int col = floor(sample.x / w);
        int row = floor(sample.y / w);

        if (col >= 0 && 
            row >= 0 && 
            col < cols && 
            row < rows && 
            grid[col + row * cols] == null) {
              
          boolean okay = true;
          
          for (int i = -1; i <= 1; ++i) {
            for (int j = -1; j <= 1; ++j) {
              
              int index = (col + i) + (row + j) * cols;

              if (index < 0 || index > grid.length - 1) {
                continue;
              }

              PVector neighbor = grid[index];
              if (neighbor != null) {
                float d = PVector.dist(sample, neighbor);
                if (d < r) {
                  okay = false;
                }
              }
              
            }
          }
          
          if (okay) {
            found = true;
            grid[col + row * cols] = sample;
            active.add(sample);
            break;
          }
        }
      }

    if (!found) {
      active.remove(rIndex);
    }
  }
  }
  for (int i = 0; i < grid.length; ++i) {
    if (grid[i] != null) {
      point(grid[i].x, grid[i].y);
    }
  }

  for (PVector p : active) {
    stroke(255, 0, 255);
    point(p.x, p.y);
  }
}

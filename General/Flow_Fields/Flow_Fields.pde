float t;
float CELL_SIZE = 20;

void setup() {
  size(600, 600);
}

void draw() {
  t += 0.01;
  background(51);
  stroke(255, 100);

  for(float x = 0; x < width; x += CELL_SIZE) {
    for(float y = 0; y < height; y += CELL_SIZE) {
        PVector f = getFlow(x, y);
        line(x, y, x + f.x, y + f.y);
    }
  }
  
  stroke(255);
  for (float y = CELL_SIZE / 2; y < height; y += CELL_SIZE) {
      PVector p = new PVector(width, y);
      PVector v = new PVector(0, 0);
      
      for (int i = 0; i < 40; ++i) {
        float oldX = p.x;
        float oldY = p.y;
        PVector a = getFlow(p.x, p.y);
        v.x += a.x;
        v.y += a.y;    
        p.x += v.x;
        p.y += v.y;        
        line(oldX, oldY, p.x, p.y);
      }
  }
}

PVector getFlow(float x, float y) {
  float angle = noise(x / 100.0f + t, y / 100.0f) * TWO_PI;
  return PVector.fromAngle(angle).setMag(10);
}

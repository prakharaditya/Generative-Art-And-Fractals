import peasy.*;
PeasyCam cam;

float x = 0.01;
float y = 0;
float z = 0;

float a = 10;
float b = 28;
float c = 8.0 / 3.0;
float angle = 0.0;

ArrayList<PVector> vertices = new ArrayList<PVector>();

void setup() {
  size(800, 600, P3D);
  colorMode(HSB);
  cam = new PeasyCam(this, 200);
}

void draw() {
  background(151);
  float dt = 0.01;
  
  float dx = (a * (y - x)) * dt;
  float dy = (x * (b - z) - y) * dt;
  float dz = (x * y - c * z) * dt;
  
  x += dx;
  y += dy;
  z += dz;

  vertices.add(new PVector(x, y, z));
  
  rotateY(angle);

  noFill();
  strokeWeight(5);
  
  float hue = 0;
  beginShape();
  for (PVector v : vertices) {
    stroke(hue, 255, 255);
    vertex(v.x, v.y, v.z);
    hue = ++hue % 255;    
  }
  endShape();
    angle += dt;
}

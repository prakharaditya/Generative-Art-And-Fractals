import peasy.*;

PeasyCam cam;
float beta = 0;
ArrayList<PVector> p = new ArrayList<PVector>();

void setup() {
  size(600, 400, P3D);
  cam = new PeasyCam(this, 600);
}

void draw() {
  background(0);
  static_draw();
  //dynamic_draw();
}

void static_draw() {
  noFill();
  stroke(255);
  beginShape();
  strokeWeight(5);
  float beta = 0;
  while (beta < PI) {
    float r = 100 * (0.8 + 1.6 * sin(6 * beta));
    float theta = 2 * beta;
    float phi = 0.6 * PI * sin(12 * beta);

    float x = r * cos(phi) * cos(theta);
    float y = r * cos(phi) * sin(theta);
    float z = r * sin(phi);
    beta += 0.01;
    vertex(x, y, z);
  }
  endShape();
}

void dynamic_draw() {
  float r = 100 * (0.8 + 1.6 * sin(6 * beta));
  float theta = 2 * beta;
  float phi = 0.6 * PI * sin(12 * beta);

  float x = r * cos(phi) * cos(theta);
  float y = r * cos(phi) * sin(theta);
  float z = r * sin(phi);
  beta += 0.01;

  p.add(new PVector(x, y, z));

  noFill();
  stroke(255);
  strokeWeight(5);
  beginShape();
  
  for (PVector v : p) {
    vertex(v.x, v.y, v.z);
  }
  endShape();
}

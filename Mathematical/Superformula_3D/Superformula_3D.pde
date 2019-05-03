import peasy.*;
PeasyCam cam;

float a = 1;
float b = 1;

int total = 150;
float r = 200;
PVector[][] sphere;

void setup() {
  size(600, 600, P3D);
  cam = new PeasyCam(this, 500);
  sphere = new PVector[total + 1][total + 1];
  colorMode(HSB);
}

void draw() {
  background(0);
  noStroke();
  lights();
  float r = 200;
  for (int i = 0; i < total+1; i++) {
    float lat = map(i, 0, total, -HALF_PI, HALF_PI);
    float r2 = supershape(lat, 7, 0.2, 1.7, 1.7);
    for (int j = 0; j < total+1; j++) {
      float lon = map(j, 0, total, -PI, PI);
      float r1 = supershape(lon, 7.0, 0.2, 1.7, 1.7);      
      float x = r * r1 * cos(lon) * r2 * cos(lat);
      float y = r * r1 * sin(lon) * r2 * cos(lat);
      float z = r * r2 * sin(lat);
      sphere[i][j] = new PVector(x, y, z);
    }
  }

  for (int i = 0; i < total; i++) {
    float hue = map(i, 0, total, 0, 255 * 3);
    fill(hue % 255, 255, 255);
    beginShape(TRIANGLE_STRIP);
    for (int j = 0; j < total+1; j++) {
      PVector v1 = sphere[i][j];
      vertex(v1.x, v1.y, v1.z);
      PVector v2 = sphere[i+1][j];
      vertex(v2.x, v2.y, v2.z);
    }
    endShape();
  }
}


float supershape(float theta, float m, float n1, float n2, float n3) {
  return pow(pow(abs(cos(m * theta / 4.0) / a), n2) + 
                    pow(abs(sin(m * theta / 4.0) / b), n3), -1.0 / n1);
}

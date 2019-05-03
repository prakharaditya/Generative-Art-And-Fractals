import peasy.*;
PeasyCam cam;

int total = 100;
float r = 200;
PVector[][] sphere;
float angle = 0;

void setup() {
  size(600, 600, P3D);
  cam = new PeasyCam(this, 500);
  sphere = new PVector[total][total];
}

void draw() {
  background(51);
    rotateZ(angle);
  rotateY(angle);
  for(int i = 0; i < total; ++i) {
    
    float lat = map(i, 0, total, -HALF_PI, HALF_PI);
    for(int j = 0; j < total; ++j) {
         float lon = map(j, 0, total, -PI, PI);
         float x = r * sin(lon) * cos(lat);
         float y = r * sin(lon) * sin(lat);
         float z = r * cos(lon);
         sphere[i][j] = new PVector(x, y, z);
    }
  }
  
  
    for(int i = 0; i < total; ++i) {
    for(int j = 0; j < total; ++j) {
      PVector v = sphere[i][j];
      stroke(255);
      strokeWeight(4);
      point(v.x, v.y, v.z);
    }
  }
  

  
  angle += 0.01;
}

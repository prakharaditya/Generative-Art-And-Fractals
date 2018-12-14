float a = 0;
float b = 0;
float c = 0;

void setup() {
  background(255);
  colorMode(HSB, 100);
  size(500, 400);
  smooth();
  strokeWeight(3);
}

void draw() {
  stroke(c, 80, 80, 20);
  float x0 = map(sin(a), -1, 1, 20, width - 20);
  float y0 = map(cos(a), -1, 1, 20, height - 20);
  
  float x1 = map(sin(b), -1, 1, 20, width - 20);
  float y1 = map(cos(b), -1, 1, 20, height - 20);
  
  line(x0, y0, x1, y1);
  
  // Twirly
  a += 0.03;
  b += 0.05;
  
  // Heart
  //a += 0.3;
  //b += 0.4;
  
  // Triangle
  //a += 0.01;
  //b += 0.04;
  
  // Clover
  //a += 0.1;
  //b += 0.04;
  
  c++;
  if (c > 100) {
    c = 0;
  }
}

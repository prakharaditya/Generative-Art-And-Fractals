float d = 1;
float n = 1;
float k = n / d;

void setup() {
 size(600, 600);
 frameRate(1);
}

void draw() {
  background(51);
  noFill();
  stroke(255);
  strokeWeight(1);
  translate(width / 2, height / 2);
  beginShape();
  for (float a = 0;  a < TWO_PI * n; a += 0.02) {
    float r = 200 * cos(k * a);
    float x = r * cos(a);
    float y = r * sin(a);
    vertex(x, y);
  }
  endShape();
  d++;
  if (d > 7) 
  {
    d = 1;
    n++;
  }
  k = d/n;
}

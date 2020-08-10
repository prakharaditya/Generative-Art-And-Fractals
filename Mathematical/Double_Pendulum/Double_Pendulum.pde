float r1 = 200;
float r2 = 200;
float m1 = 10;
float m2 = 40;
float a1 = PI / 2;
float a2 = PI / 2;
float a1v = 0;
float a2v = 0;
float G = 1.25;

ArrayList<PVector> s = new ArrayList<PVector>();

void setup() {
  size(850, 500);
}

void draw() {
  float num1 = -G * (2 * m1 + m2) * sin(a1);
  float num2 = -m2 * G * sin(a1 - 2 * a2);
  float num3 = -2 * sin(a1 - a2) * m2;
  float num4 = a2v * a2v * r2 + a1v * a1v * r1 * cos(a1 - a2);
  float den = r1 * (2 * m1 + m2 - m2 * cos(2 * a1 - 2 * a2));
  float a1a = (num1 + num2 + num3 * num4) / den;
  
  num1 = 2 * sin(a1 - a2);
  num2 = (a1v * a1v * r1 * (m1 + m2));
  num3 = G * (m1 + m2) * cos(a1);
  num4 = a2v * a2v * r2 * m2 * cos(a1 - a2);
  den = r2 * (2 * m1 + m2 - m2 * cos(2 * a1 - 2 * a2));
  float a2a = (num1 * (num2 + num3 + num4)) / den;
  
  background(255);

  translate(width / 2, 50);
  
  float x1 = r1 * sin(a1);
  float y1 = r1 * cos(a1);
  float x2 = x1 + r2 * sin(a2);
  float y2 = y1 + r2 * cos(a2);  
  
  s.add(new PVector(x2, y2));
  noFill();
  stroke(0, 20);
  strokeWeight(1);
  beginShape();
  for (PVector v : s)
  {
    vertex(v.x, v.y);
  }
  endShape();
  
  stroke(0);
  strokeWeight(2);
  line(0, 0, x1, y1);
  fill(0);
  line(x1, y1, x2, y2);
  circle(x1, y1, m1 / 2);
  circle(x2, y2, m2 / 2);
  point(x2, y2);

  a1v += a1a;
  a2v += a2a;
  a1 += a1v;
  a2 += a2v;
 }  

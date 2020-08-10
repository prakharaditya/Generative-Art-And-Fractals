class Blob {
  PVector p;
  PVector v;
  float r;
  
  Blob(float x, float y) {
    p = new PVector(x, y);
    v = PVector.random2D();
    v.mult(random(1, 3));
    r = 70;
  }
  
  void update() {
    p.add(v);
    if (p.x > width || p.x < 0) v.x *= -1;
    if (p.y > height || p.y < 0) v.y *= -1;
  }
  
  void draw() {
    noFill();
    stroke(0);
    strokeWeight(5);
    ellipse(p.x, p.y, r, r);
  }
}

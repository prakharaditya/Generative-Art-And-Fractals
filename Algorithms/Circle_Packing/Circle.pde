class Circle {
  PVector s;
  boolean growing = true;

  Circle(float x, float y) {
    this.s = new PVector(x, y, 1.0);
  }

  void grow() {
    if (growing) {
      s.z += 0.5f;
    }
  }
  
  boolean edges() {
    return (s.x + s.z > width || 
            s.x - s.z < 0 ||
            s.y + s.z > height ||
            s.y - s.z < 0);
  }

  void show() {
    stroke(255);
    strokeWeight(2);
    noFill();
    ellipse(s.x, s.y, s.z * 2, s.z * 2);
  }
}

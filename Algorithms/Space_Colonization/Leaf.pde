class Leaf {
  PVector p;
  boolean reached;

  public Leaf() {
    p = PVector.random3D();
    p.mult(random(width / 2));
    p.y -= height / 4;
    reached = false;
  }

  void draw() {
    fill(#ffffff);
    noStroke();
    pushMatrix();
    translate(p.x, p.y, p.z);
    circle(0, 0, 4);
    popMatrix();
  }
}

class Particle {
  PVector p;
  PVector pp;
  PVector v;
  PVector a;

  Particle(float x, float y) {
    p = new PVector(x, y);
    pp = new PVector(x, y);
    v = new PVector();
    a = new PVector();
  }

  void update() {
    v.add(a);
    v.limit(5);
    p.add(v);
    a.mult(0);
  }

  void draw() {
    stroke(255);
    strokeWeight(4);
    line(this.p.x, this.p.y, this.pp.x, this.pp.y);
    pp.x = p.x;
    pp.y = p.y;
  }

  void attracted(PVector target) {
    PVector force = PVector.sub(target, p);
    float d = force.mag();
    d = constrain(d, 1, 25);
    float G = 50;
    float strength = G / (d * d);
    force.setMag(strength);
    if (d < 20) {
      force.mult(-10);
    }
    a.add(force);
  }
};

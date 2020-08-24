class Branch {
  PVector p;
  PVector dir;
  PVector originalDir;

  Branch parent;
  int count = 0;
  int len = 20;

  Branch(Branch _parent, PVector _p, PVector _dir) {
    this.p = _p;
    this.dir = _dir;
    originalDir = this.dir.copy();
    this.parent = _parent;
  }

  void reset() {
    dir = originalDir.copy();
  }

  Branch next() {
    dir.normalize();
    PVector nextDir = PVector.mult(dir, len);
    PVector nextPos = PVector.add(this.p, nextDir);
    Branch nextBranch = new Branch(this, nextPos, this.dir.copy());
    return nextBranch;
  }

  void draw() {
    if (parent != null) {
      stroke(255);
      line(p.x, p.y, p.z, parent.p.x, parent.p.y, parent.p.z);
    }
  }
}

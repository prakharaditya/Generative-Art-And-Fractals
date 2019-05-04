ArrayList<Particle> ps;

void setup() {
  size(600, 400);
  blendMode(ADD);
  ps = new ArrayList<Particle>();

  for (int i = 0; i < 100; ++i)
  {
    //ps.add(new Particle());
  }
}

void draw() {
  background(0);
  
  for (int i = 0; i < 10; ++i)
  {
    ps.add(new Particle());
  }

  for (int i = ps.size() - 1; i >= 0; --i) {
    if (ps.get(i).isAlive())
    {
      ps.get(i).update();
      ps.get(i).draw();
    } else {
       ps.remove(i); 
    }
  }
}

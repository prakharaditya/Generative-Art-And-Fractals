FlowField flowfield;
ArrayList<Particle> particles;
int maxParticles = 10000;

boolean debug = false;

void setup() {
  size(600, 400);
  
  flowfield = new FlowField(10);
  flowfield.Update();

  particles = new ArrayList<Particle>();
  for (int i = 0; i < maxParticles; i++) {
    PVector start = new PVector(random(width), random(height));
    particles.add(new Particle(start, random(2, 8)));
  }
  background(255);
}

void draw() {
  fill(255, 10);
  rect(0, 0, width, height);
  flowfield.Update();
  
  if (debug) flowfield.Draw();
  
  for (Particle p : particles) {
    p.Flow(flowfield);
    p.Run();
  }
}

import java.util.*;

List<PVector> attractors = new ArrayList<PVector>();
List<Particle> particles = new ArrayList<Particle>();

void setup() {
  size(800, 800);
   for (int i = 0; i < 100; i++) {
     attractors.add(new PVector(random(width), random(height)));
   }
}

void draw() {
  background(0);
  particles.add(new Particle(random(width), random(height)));

  if (particles.size() > 100) {
    particles.remove(0);
  }
  
  for (PVector p : attractors) {
    stroke(255, 0, 255);
    strokeWeight(3);
    point(p.x, p.y);
  }
  
  stroke(255);
  strokeWeight(1);
  for (int i = 0; i < particles.size(); i++) {
    Particle particle = particles.get(i);
    
    for (int j = 0; j < attractors.size(); j++) {
      particle.attracted(attractors.get(j));
    }
    
    particle.update();
    particle.draw();
  }
}

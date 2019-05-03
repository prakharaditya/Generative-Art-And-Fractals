class Particle {
   PVector p; 
   PVector v;
   int alpha;
   
   Particle() {
      p = new PVector(300, 380);
      v = new PVector();
      v.x = random(-1, 1);
      v.y = random(-5, -1);
      alpha = 255;
   }
   
   boolean isAlive()
   {
      return alpha > 0; 
   }
   
   void update() {
     p.add(v);
     alpha -= 5;
   }
   
   
   
   void draw() {
     noStroke();
     fill(150, alpha);
     circle(p.x, p.y, 16);
   }
}

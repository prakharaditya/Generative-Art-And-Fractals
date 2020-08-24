public class Particle {
  PVector P;
  PVector PP;
  PVector V = new PVector(0, 0);
  PVector A = new PVector(0, 0);
  float maxSpeed;
   
  Particle(PVector start, float maxspeed) {
    maxSpeed = maxspeed;
    P = start;
    PP = P.copy();
  }
  
  void Run() {
    Update();
    Edges();
    Draw();
  }
  
  void Update() {
    P.add(V);
    V.limit(maxSpeed);
    V.add(A);
    A.mult(0);
  }
  
  void ApplyForce(PVector force) {
    A.add(force); 
  }
  
  void Draw() {
    stroke(0, 5);
    strokeWeight(1);
    line(P.x, P.y, PP.x, PP.y);
    UpdatePreviousPos();
  }
  
  void Edges() {
    if (P.x > width) {
      P.x = 0;
      UpdatePreviousPos();
    }
    if (P.x < 0) {
      P.x = width;    
      UpdatePreviousPos();
    }
    if (P.y > height) {
      P.y = 0;
      UpdatePreviousPos();
    }
    if (P.y < 0) {
      P.y = height;
      UpdatePreviousPos();
    }
  }
  
  void UpdatePreviousPos() {
    this.PP.x = P.x;
    this.PP.y = P.y;
  }
  
  void Flow(FlowField ff) {
    int x = floor(P.x / ff.scl);
    int y = floor(P.y / ff.scl);
    int index = x + y * ff.cols;
    
    PVector force = ff.vectors[index];
    ApplyForce(force);
  }
}

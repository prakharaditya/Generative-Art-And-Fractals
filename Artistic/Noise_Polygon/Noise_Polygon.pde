int sides = 4; // Number of sides
float[] x = new float[sides];
float[] y = new float[sides];
float variance = 10; // Variation strength
int iterations = 150;
int radius = 150; // The initial radius

void setup() {
   size(800, 800, P3D);
}

void draw() {
   // Setup
   float angle = radians(360/float(sides));
   for (int i=0; i < sides; i++) {
      x[i] = cos(angle*i+50) * radius;
       y[i] = sin(angle*i+50) * radius;
   }
   stroke(255, 15);
   strokeWeight(1);
   background(51);
   noFill();
   noLoop();

   // Draw
   for (int a=0; a < iterations; a++) {
     for (int i=0; i < sides; i++) {
       x[i] += random(-variance, variance);
       y[i] += random(-variance, variance);
     }
     
     beginShape(); // draw polygon shape
     curveVertex(x[sides - 1] + width * 0.5f, y[sides - 1]+height * 0.5f);
     
     for (int i=0; i < sides; i++) {
       curveVertex(x[i] + width * 0.5f, y[i] + height * 0.5f);
     }
     
     curveVertex(x[0] + width * 0.5f, y[0] + height * 0.5f);
     curveVertex(x[1] + width * 0.5f, y[1] + height * 0.5f);
     endShape();
   }
}

void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  sides -= e;
  
  if (sides <= 3) sides = 3;
  
  x = new float[sides];
  y = new float[sides];
  redraw();
}

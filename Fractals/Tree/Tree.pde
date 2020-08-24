float angle = PI / 4;
float ral = PI / 8; // Random Angle Limit
float lengthRatio = 0.67f;
float widthRatio = 0.7f;

void setup() {
  size(600, 600);
}

void draw() {
  background(51);
  stroke(255);
  translate(width / 2, height);
  branch(200, 12); 
}

void branch(float l, float w) {
  strokeWeight(w);
  line(0, 0, 0, -l);
  translate(0, -l);
  
  if (l > 3) { 
    pushMatrix();
    //rotate(angle);
    rotate(angle + random(-ral, ral));
    branch(l * lengthRatio, w * widthRatio);
    popMatrix();
    pushMatrix();
    // rotate(-angle);
    rotate(-angle + random(-ral, ral));
    branch(l * lengthRatio, w * widthRatio);
    popMatrix();
  };
  
  noLoop();
}

void mouseWheel(MouseEvent event) {
  angle += event.getCount() * 0.1;
  redraw();
}

void keyPressed() {
  if (keyCode == UP) lengthRatio += 0.01;
  else if (keyCode == DOWN) lengthRatio -= 0.01;
  
  if (keyCode == LEFT) widthRatio -= 0.01;
  else if (keyCode == RIGHT) widthRatio += 0.01;
  
  redraw();
}

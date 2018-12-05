int LIMIT = 500;
float[] x = new float[LIMIT];
float[] y = new float[LIMIT];
float[] speed = new float[LIMIT];

void setup() {
  size(800, 800);
  background(0);
  stroke(255);
  strokeWeight(5);

  int i = 0;
  while (i < LIMIT) {    
    x[i] = random(0, width);
    y[i] = random(0, height);
    speed[i] = random(1, 5);
    i++;
  }
}

void draw() {
  fill(0, 100);
  rect(0,0,width,height);
  
  int i = 0;
  while (i < LIMIT) {    
    strokeWeight(speed[i]);
    point(x[i], y[i]);
    x[i] -= speed[i];
    if (x[i] < 0) {
      x[i] = width;
    }
    i++;
  }
}  

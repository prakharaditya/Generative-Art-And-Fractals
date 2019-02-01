void setup() {
  size(800, 800);
  background(255);
  noLoop();
}

void draw () {
    noStroke(); 
    for (int x = 10; x < width; x += 10)
    {
      for (int y = 10; y < height; y += 10)
      {
        float circleSize = random(10 *0.3, 10);
        fill(random(255));
        ellipse(x, y, circleSize, circleSize);
      }
    }
}

int SQUARES = 60;
final int INITIAL_SIZE = 400;
final int INITIAL_WEIGHT = 25;
int weight;
int size;
float time;

void setup()
{
  size(600, 600);
  fill(255);
  stroke(0);
  time = 0;
  frameRate(30);
}

void draw()
{
  weight = INITIAL_WEIGHT;
  size = INITIAL_SIZE;
  background(255);
  translate(width / 2, height / 2);
  rectMode(CENTER);
  for (int i = 0; i < SQUARES; i++)
  {
    // Uncomment this to make into a multicoloured thing.
    //stroke(((time * i) * 56) % 255,((time * i) * 87) % 255, ((time * i) * 22) % 255);
    fill((size + i * 10) % 255 - 125, (i* 10 + 12) % 255, 126);
    float sAngle = (i % 2 == 0) ? 0 : PI;
    rotate(sAngle + time);
    strokeWeight(Math.max(weight, 5));
    rect(0, 0, size, size);
    size *= 0.95;
    weight *= 0.95;
    
  }
  ellipse(0, 0, 5, 5);
  time += 0.002;
}
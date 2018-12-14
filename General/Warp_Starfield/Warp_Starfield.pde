class Star
{
  PVector p;
  
  public Star()
  {
    p = new PVector(random(-width/2, width/2), random(-height/2, height/2), random(width/2));
  }

  public void run()
  {
    p.z -= speed;
    if (p.z < 1.0f)
    {
      p.z = width/2;
      p.x = random(-width/2, width/2);
      p.y = random(-height/2, height/2);
    }    

    float r = map(p.z, 0, width/2, 10, 0);
    ellipse(map(p.x / p.z, 0, 1, 0, width/2), map(p.y / p.z, 0, 1, 0, height/2), r, r);
    stroke(255);
  }
}

Star[] s = new Star[800];

float speed = 2.0f;

void setup()
{
  size(800, 600);
  
  for (int i = 0; i < s.length; i++) {
    s[i] = new Star();
  }
}

void draw()
{
  fill(0, 100);
  rect(0, 0, width, height);
  translate(width/2, height/2);
  
  fill(255);
  noStroke();
  
  for (int i = 0; i < s.length; i++) {
    s[i].run();
  }
}


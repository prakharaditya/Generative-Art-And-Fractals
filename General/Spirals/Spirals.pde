float r;
float s;
int draw_this;

void setup()
{
  size(600, 600);
  r = 0;
  s = 1;
  background(0);
  noFill();
  stroke(255);
  draw_this = 1;
}

void draw()
{
  drawSelect(draw_this);
}

void keyPressed()
{
  if (key == '1')
  {
    background(0);
    r = 0;
    s = 1;
    draw_this = 1;
  }
  if (key == '2')
  {
    background(0);
    r = 0;
    s = 1;
    draw_this = 2;
  }
  if (key == '3')
  {
    background(0);
    r = 0;
    s = 1;
    draw_this = 3;
  }
  if (key == '4')
  {
    background(0);
    r = 0;
    s = 1;
    draw_this = 4;
  }
}

void drawSelect(int selection)
{
  switch(selection)
  {
    case 1:
      circles();
      break;
    case 2: 
      arcs();
      break;
    case 3:
      web();
      break;
    case 4: 
      flower();
      break;
  }
}


void circles()
{
    translate(width / 2, height / 2);
    rotate(r);
    //stroke(r, s, 255);
    ellipse(s, r,s, s);
    r += 0.1;
    s += 0.01;
}

void arcs()
{
  fill(random(255), random(255), random(255));
     translate(width / 2, height / 2);
    rotate(r);
    //stroke(r, s, 255);
    arc(r, s,s, s, 0, PI);
    r += 0.1;
    s += 0.01;
}

void web()
{
     translate(width / 2, height / 2);
    rotate(r);
    //stroke(r, s, 255);
    arc(r, s,s, s, HALF_PI, PI+ HALF_PI);
    r += 0.1;
    s += 0.01;
}

void flower()
{
    fill(r % 255,s % 255, r + s % 255);
    translate(width / 2, height / 2);
    rotate(r);
    ellipse(r, s,r, s);
    r += 1;
    s += 0.1;
}

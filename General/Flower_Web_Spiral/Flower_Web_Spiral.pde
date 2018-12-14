float r;
float s;

void setup()
{
  size(600, 600);
  r = 0;
  s = 1;
  background(0);
  noFill();
  stroke(255);
}

void draw()
{
//circles();
//arcs();
web();
//disco();
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

void disco()
{
    fill(r % 255,s % 255, r + s % 255);
    translate(width / 2, height / 2);
    rotate(r);
    ellipse(r, s,r, s);
    r += 1;
    s += 0.1;
}

float angle = 0.0;

void setup()
{
    size(900, 500);
    background(0);
}

void draw()
{
    noStroke();
    translate(width / 2, height / 2);
    rotate(angle);
    ellipse(angle, 0, 2, 2);
    angle += 0.2;
}

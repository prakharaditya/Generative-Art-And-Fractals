void setup()
{
    size(1000,1000);
    background(0);
    noFill();
    stroke(255);
    translate(width / 2, height / 2);
    ellipse(0,0, width, height);
    ellipseMode(RADIUS);
    render(width / 2, 0, 5);
}

void render(float r, float c, float n)
{
    float halfRadius = r / 2;
    ellipse(c + halfRadius, 0, halfRadius, halfRadius);
    if (halfRadius > n)
    {
        render(halfRadius, c + halfRadius, n);
    }
    
    ellipse(c - halfRadius, 0, halfRadius, halfRadius);
    
    if (halfRadius > n)
    {
        render(halfRadius, c - halfRadius, n);
    }
}
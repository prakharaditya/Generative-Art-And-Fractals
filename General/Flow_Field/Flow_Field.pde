float t;
float CELL_SIZE = 10;

void setup()
{
    size(600, 600);
}

void draw()
{
    t += 0.01;
    background(0);
    stroke(255);

    for(float x = 0; x < width; x += CELL_SIZE)
    {
        for(float y = 0; y < height; y += CELL_SIZE)
        {
        PVector f = getFlow(x, y);
        line(x, y, x + f.x, y + f.y);
        }
    }
}

PVector getFlow(float x, float y)
{
    float angle = noise(x / 100.0f + t, y / 100.0f) * TWO_PI;
    return PVector.fromAngle(angle).setMag(10);
}

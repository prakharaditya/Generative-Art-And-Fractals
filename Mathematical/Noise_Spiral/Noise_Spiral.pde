void setup()
{
    size(800, 800);
    background(255);
    noLoop();
}

void draw()
{
    noiseSpiral(20, 100);
}

void noiseSpiral(int border, int rotations)
{
    strokeWeight(1);
    stroke(0, 70);
    float radius = width/2 - border;
    int centX = width/2;
    int centY = height/2;
    float x, y;
    float lastx = 0;
    float lasty = 0;
    float radiusNoise = random(10);
    
    for (float ang = 0; ang <= 360*rotations; ang += 0.5)
    {
        radiusNoise += 0.5;
        radius -= 0.005;
        float thisRadius = radius - (noise(radiusNoise) * 10);
        float rad = radians(ang);
        x = centX + (thisRadius * cos(rad));
        y = centY + (thisRadius * sin(rad));
        if (lastx > 0)
        {
        line(x, y, lastx, lasty);
        }
        
        lastx = x;
        lasty = y;
    }
}
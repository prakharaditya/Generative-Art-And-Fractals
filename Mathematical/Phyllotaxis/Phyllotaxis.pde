final int SIZE = 3;

float a;
float c;
float n = 0.0f;

float aTimes = 137.5f;
float r;

void setup()
{
    size(500, 500);
    background(0);
}

void draw()
{
    c = 4.0f;
    translate(width / 2, height / 2);
    a = n * aTimes;
    r = c * sqrt(n);  
    float x = r * cos(radians(a));
    float y = r * sin(radians(a));
    fill((abs(x) % 200 ) + 55, ((abs(x) + abs(y)) % 200 ) + 55, (abs(y) % 200) + 55);
    //noStroke();
    stroke(0, 55);
    ellipse(x, y, SIZE, SIZE);  
    n++;
}
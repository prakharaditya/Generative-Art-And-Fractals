void setup()
{
    size(600, 600);
}

void draw()
{
    translate(width / 2, height / 2);
    background(51);
    stroke(255);
    int r = 100;
    
    for (float i = -HALF_PI; i < (-HALF_PI + (PI / 4)); i+= 0.01)
    {
        float x = r * cos(i);
        float y = r * sin(i);
        point(x, y);
        point(x, -y);
        point(-x, y);
        point(-x, -y);       
        point(y, x);
        point(-y, x);
        point(y, -x);
        point(-y, -x);
    }
}
int circle_count = 10;
Circle[] circles = {};   

void setup()
{
    size(1000,600); 
    background(255);
    smooth();
    strokeWeight(1);

    drawCircles();
}

void draw()
{
    //background(255);
    fill(255, 100);
    rect(0, 0, width, height);
    
    for(Circle c : circles)
    {
        c.update();
    }
}

void mouseReleased()
{
    drawCircles();
}

void drawCircles()
{
    for (int i = 0; i < circle_count; i++)
    { 
        circles = (Circle[])append(circles, new Circle());
    }
}

class Circle
{
    PVector pos;
    PVector vel;
    float radius; 

    Circle ()
    {
        pos = new PVector(random(width), random(height));
        vel = new PVector(random(2), random(2));
        radius = random(100) + 10; 
    }

    void update()
    {
        pos.add(vel);
        
        if (pos.x > (width + radius)) { pos.x = 0 - radius; }
        if (pos.x < (0 - radius)) { pos.x = width + radius; }
        if (pos.y > (height + radius)) { pos.y = 0 - radius; }
        if (pos.y < (0 - radius)) { pos.y = height + radius; }
        
    for (int i = 0; i < circles.length; i++)
    {
        Circle otherCirc = circles[i];
        if (otherCirc != this)
        {  
            float dis = dist(pos.x, pos.y, otherCirc.pos.x, otherCirc.pos.y); 
            float overlap = dis - radius - otherCirc.radius; 
            if (overlap < 0)
            { 
            PVector mid = new PVector();
            if (pos.x < otherCirc.pos.x)
            {
                mid.x = pos.x + (otherCirc.pos.x - pos.x) / 2;
            } else {
                mid.x = otherCirc.pos.x + (pos.x - otherCirc.pos.x) / 2;
            }
            if (pos.y < otherCirc.pos.y)
            {
                mid.y = pos.y + (otherCirc.pos.y - pos.y) / 2;
            }
            else
            {
                mid.y = otherCirc.pos.y + (pos.y - otherCirc.pos.y) / 2;
            }
            
            stroke(0, 100);
            noFill();
            overlap *= -0.9; 
            ellipse(mid.x, mid.y, overlap, overlap);
            }
        }
        }
    }
}
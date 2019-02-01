int NUM_POINTS = 4;
final int RADIUS = 400;
final float PERCENT = 0.5;
final int ITR = 100;
float sf = 1.0f;
float tX = 0.0f;
float tY = 0.0f;

PVector[] points;
PVector current;
int previous;

void setup()
{
    size(800, 800);
    background(0);
    seed();
}

void draw()
{
    pushMatrix();
    translate(tX, tY);  
    scale(sf);

    for (int i = 0; i < ITR; i++)
    {
        stroke(255, 0, 255);
        strokeWeight(1);    
        point(current.x, current.y);
        applyRule(0);
    }
    popMatrix();
}

void applyRule(int rule)
{
    int r = floor(random(NUM_POINTS));
    switch(rule)
    {
    case 0:
        {
        nextRandomVertex(r);
        } 
        break;
    case 1:
        {
        notLastVertex(r);
        } 
        break;    
    }
    previous = r;
}

void nextRandomVertex(int r)
{
    current.lerp(points[r], PERCENT);
}

void notLastVertex(int r)
{
    if ((points[r] != points[previous]))
    {
        current.lerp(points[r], PERCENT);
    }
}

void seed()
{ 
    points = new PVector[NUM_POINTS]; 

    float a_step = TWO_PI / NUM_POINTS; 

    for (int i = 0; i < NUM_POINTS; i++)
    {
        float a = i * a_step; 
        points[i] = PVector.fromAngle(a).mult(RADIUS).add(width / 2, height / 2);
    }

    current = new PVector(random(width), random(height));

    stroke(255);
    strokeWeight(10);

    for (PVector v : points)
    {
        point(v.x, v.y);
    }
}

void mouseClicked()
{
    if (mouseButton == LEFT)
    {
        NUM_POINTS++;
    } else if (mouseButton == RIGHT)
    {
        NUM_POINTS--;
        NUM_POINTS = max(NUM_POINTS, 1);
    }

    seed();
    background(0);
}

void mouseWheel(MouseEvent e)
{
    sf += e.getAmount() / 100;
    tX -= e.getAmount() * mouseX / 100;
    tY -= e.getAmount() * mouseY / 100;
    background(0);
    seed();
}

void keyPressed()
{
    if (key == 'r')
    {
        sf = 1.0f;
        tX = 0.0f;
        tY = 0.0f;
        background(0);
    }
}

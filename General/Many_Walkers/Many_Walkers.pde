public class RandomWalker
{
    private PVector position;
    private int size;
    
    public RandomWalker(PVector _position, int _size)
    {
        position = _position;
        size = _size;
    }

    public void update()
    {
        position.x += Math.floor(Math.random() * 3) - 1;
        position.y += Math.floor(Math.random() * 3) - 1;

        if (position.x > width) position.x = width - size;
        if (position.x < 0) position.x = 0 + size;
        if (position.y > height) position.y = height - size;
        if (position.y < 0) position.y = 0 + size;
    }

    public void draw()
    {
        update();
        fill(0);
        ellipse(position.x, position.y, size, size);
    }
}

ArrayList<RandomWalker> walkers;
final int MAX_WALKERS = 5000;

void setup()
{
    size(800, 600);
    walkers = new ArrayList<RandomWalker>();
    
    for (int i = 0; i < MAX_WALKERS; ++i)
    {
      walkers.add(new RandomWalker(new PVector((int) random(width), (int) random(height)), 1));
    }
    background(255);
}

void draw()
{
    fill(255, 10);
    rect(0, 0, width, height);
    for (RandomWalker walker : walkers)
    {
      walker.draw();
    }
}

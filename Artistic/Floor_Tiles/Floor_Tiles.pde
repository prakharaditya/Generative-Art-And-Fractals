int Spacing = 50;
int S1 = Spacing;
int S2 = Spacing * 2;

final int WIDTH = 1200;
final int HEIGHT = 800;

color[] colour_array = { #9AB8B9, #556F90, #1E4D6C, #2B394B, #2B394B };
int colour_index_limit = colour_array.length;

public color getColour()
{
    return colour_array [int(random(0, colour_index_limit))];
}

void setup()
{
    size(1200, 800);
    frameRate(1);
}

void draw()
{
    background(255);
    noStroke();
    
    for(int X_ = 0; X_ < WIDTH; X_ = X_ + 100)
    {
        for (int Y_ = 0;Y_ < HEIGHT; Y_ = Y_ + 100)
        {
        fill(getColour());
        triangle(X_, Y_, X_, Y_ + S1, X_ + S1, Y_ + S1);
        fill(getColour());
        triangle(X_, Y_, X_ + S1, Y_, X_ + S1, Y_ + S1);

        fill(getColour());
        triangle(X_ + S1, Y_ + S1, X_ + S1, Y_ + S2, X_ + S2, Y_ + S2);
        fill(getColour());
        triangle(X_ + S1, Y_ + S1, X_ + S2, Y_+50, X_ + S2, Y_ + S2);

        fill(getColour());
        triangle(X_ + S1, Y_ + S1, X_ + S2, Y_ + S1, X_ + S2, Y_);
        fill(getColour());
        triangle(X_ + S1, Y_ + S1, X_ + S1, Y_, X_ + S2, Y_);

        fill(getColour());
        triangle(X_, Y_ + S2, X_ + S1, Y_ + S2, X_ + S1, Y_ + S1);
        fill(getColour());
        triangle(X_, Y_ + S2, X_, Y_ + S1, X_ + S1, Y_ + S1);
        }
    } 
}
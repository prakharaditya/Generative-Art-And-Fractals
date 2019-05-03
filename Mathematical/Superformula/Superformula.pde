float a = 6.0;   // Size
float b = 6.0;   // Size
float m = 4.0;   // No. of points
float n1 = 1;    // Smoothness
float n2 = 1.0;  // Shape of spikes
float n3 = 1.0;  // Shape of spikes
float theta_inc = 0.001;

void setup()
{
    size(600, 600);
}

void draw()
{
    translate(width / 2, height / 2);
    fill(0);
    beginShape();
    for(float theta = 0; theta <= 2 * PI; theta += theta_inc) {
        float rad = pow(pow(abs(cos(m * theta / 4.0) / a), n2) + 
                    pow(abs(sin(m * theta / 4.0) / b), n3), -1.0 / n1);
        float x = rad * cos(theta) * 50;
        float y = rad * sin(theta) * 50;
        vertex(x, y);
    }
    endShape();
}
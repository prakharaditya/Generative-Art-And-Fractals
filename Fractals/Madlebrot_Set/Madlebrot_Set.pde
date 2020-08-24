float min = -1;
float max = 1;
float x = 0;
float y = 0;
int max_itr = 100;

void setup() {
  size(600, 600);
  colorMode(HSB);
}


void draw()
{
    loadPixels();
  for (int x = 0; x < width; ++x) {
    for (int y = 0; y < height; ++y) {
      float a = map(x, 0, width, min, max);
      float b = map(y, 0, height, min, max);

      float n = 0;
      float z = 0;

      float ca = a;
      float cb = b;


      while (n < max_itr) {
        float aa = a * a - b * b;
        float bb = 2 * a * b;

        a = aa + ca;
        b = bb + cb;

        if (abs(a + b) > 20) {
          break;
        }

        n++;
      }

      float br = map(n, 0, max_itr, 0, 1);
      br = map(sqrt(br), 0, 1, 255, 0);
      if (n == max_itr) {
        br = 0;
      }

      pixels[x + y * width] = color(br, 255, 255);
    }
  }

  updatePixels();
  translate(x, y);
}

void keyPressed() {
  if (keyCode == DOWN) {
    max += 0.01;
    max_itr += 10;
  } else if (keyCode == UP) {
    max -= 0.01;
    max_itr += 10;
  }
  if (keyCode == LEFT) {
    min -= 0.01;
    max_itr += 10;
  } else if (keyCode == RIGHT) {
    min += 0.01;
    max_itr += 10;
  }
  redraw();
}

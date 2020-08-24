PVector angle = new PVector(0, 0);
float zoom = 5;
int maxiterations = 100;

void setup() {
  size(840, 560);
  colorMode(HSB, 1);
}

void draw() {
  
  PVector C = calculateFromMouse();
  //PVector C = calculateFromTime();

  background(255);
  
  float w = zoom;
  PVector size = new PVector(w, (w * height) / width);
  PVector min = new PVector(-size.x * 0.5f, -size.y * 0.5f);
  PVector max = new PVector(min.x + size.x, min.y + size.y);
  PVector D = new PVector(
    (max.x - min.x) / (width),
    (max.y - min.y) / (height)
  );

  loadPixels();
  
  float y = min.y;
  for (int j = 0; j < height; j++) {
    float x = min.x;
    for (int i = 0; i < width; i++) {

      // As we iterate z = z^2 + cm does z tend towards infinity?
      float a = x;
      float b = y;
      int n = 0;
      while (n++ < maxiterations) {
        float aa = a * a;
        float bb = b * b;

        if (aa + bb > 4.0) break;
        
        float twoab = 2.0 * a * b;
        a = aa - bb + C.x;
        b = twoab + C.y;
      }

      if (n == maxiterations) {
        pixels[i + j * width] = color(0);
      } else {
        float hu = sqrt(float(n) / maxiterations);
        pixels[i + j * width] = color(hu, 255, 150);
      }
      x += D.x;
    }
    y += D.y;
  }
  updatePixels();
}

PVector calculateFromMouse() {
   angle.x += 0.001;
   angle.y += 0.01;
   float ca = map(mouseX, 0, width, -1, 1);
   float cb = map(mouseY, 0, width, -1, 1);
   return new PVector(ca, cb);
}

PVector calculateFromTime() {
   angle.x += 0.001;
   angle.y += 0.01;
   float ca = sin(angle.x);
   float cb = sin(angle.y);
   return new PVector(ca, cb);
}

void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  zoom += e * 0.1f;
}

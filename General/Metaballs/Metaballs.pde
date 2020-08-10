Blob[] blobs = new Blob[5];

void setup() {
  size(640, 360);
  for (int i = 0; i < blobs.length; ++i) {
    blobs[i] = new Blob(random(width), random(height));
  }
}

void draw() {
  background(51);
  loadPixels();
  for (int x = 0; x < width; ++x) {
    for (int y = 0; y < height; ++y) {
      int index = x + y * width;
      float c = 0;
      for (Blob b : blobs) {
        float d = dist(x, y, b.p.x, b.p.y);
        c += 100 * b.r / d;
      }

      float C = constrain(c, 0, 250);
      pixels[index] = color(C, C, C);
    }
  }
  updatePixels();

  for (Blob b : blobs) {
    b.update();
    b.draw();
  }
}

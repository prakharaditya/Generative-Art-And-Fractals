PVector[] points = new PVector[50];

void setup() {
  size(400, 400);
  for (int i = 0; i < points.length; i++) {
    points[i] = new PVector(random(width), random(height), random(width));
  }
}

void draw() {
  loadPixels();
  
  for (int x = 0; x < width; x++) {
    for (int y = 0; y < height; y++) {
      
        float[] distances = new float[points.length];
        for (int i = 0; i < points.length; i++) {
          PVector v = points[i];
          float z = frameCount % width;
          float d = dist(x, y, z, v.x, v.y, v.z);        
          distances[i] = d;
        }
        
        int n = 0;
        float[] sorted = sort(distances);
        float noise = map(sorted[n], 0, width / 2, 0, 255);
        int index = x + y * width;
        pixels[index] = color(noise);
    }
  }
  
  updatePixels();
}

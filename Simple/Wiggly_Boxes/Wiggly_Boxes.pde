/* 
 * Replication of Schotter (Gravel) - Georg Nees ,1968
 */
float r, c;
float scale = 10.0f;

void setup() {
  size(500, 500);
  noLoop();
}

void draw() {
 noFill();
 for (int i = 0; i < height; i += scale) {
   for (int j = 0; j < width; j += scale) {
     translate(i, j);
     rotate(random(1.0) * (j / 2) / 100);
     rect(0, 0, scale, scale);
     resetMatrix();
   }
 }
}

import peasy.*;

PVector[] points = new PVector[1];
PVector max;
PeasyCam cam;
float angle = 0;

void setup()
{
 size(800, 800, P3D);
 strokeWeight(4);
 cam = new PeasyCam(this, 900);
 max = new PVector(width / 30, height / 30);
 points[0] = new PVector(width / 2, height / 2, 0);
}

void draw()
{
  background(51);
  //rotateZ(angle);
  rotateX(angle);
  
  points = (PVector[]) expand(points, points.length + 1);
  
  float newX = points[points.length - 2].x + random(-max.x, max.x);
  if (newX < points[points.length - 2].x) newX -= max.x;
  else newX += max.x;
  
  float newY = points[points.length - 2].y + random(-max.y, max.y);
  if (newY < points[points.length - 2].y) newY -= max.y;
  else newY += max.y;
  
 float newZ = random(-115, 115);
       
  points[points.length - 1] = new PVector(newX, newY, newZ);
  
  for(PVector v1 : points) {
    for(PVector v2 : points) {
      if(dist(v1.x, v1.y, v1.z, v2.x, v2.y, v2.z) < sqrt(pow(max.x * 2, 2) + pow(max.y * 2, 2)) + 20) {
        int cMod = (int)random(-20, 20);
        stroke(24 + random(-cMod, cMod), 176 + random(-cMod, cMod), 196 + random(-cMod, cMod), 20);
        line(v1.x, v1.y, v1.z, v2.x, v2.y, v2.z);
      }
    }
  }
  smooth();
  angle += 0.01;
}

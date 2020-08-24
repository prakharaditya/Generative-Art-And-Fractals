ArrayList<Circle> circles;
int totalCircles = 50; // Num. New Circles Max Per Frame
int maxAttempts = 75; // Num. Attempts To Find A Place For A New Circle

void setup() {
  size(640, 360);
  circles = new ArrayList<Circle>();
  // frameRate(1);
}

void draw() {
  background(51);

  int count = 0;
  int attempts = 0;

  while (count <  totalCircles) {
    Circle newC = newCircle();
    if (newC != null) {
      circles.add(newC);
      count++;
    }
    attempts++;
    if (attempts > maxAttempts) {
      noLoop();
      println("Breaking Loop");
      break;
    } 
  }


  for (Circle c : circles) {
    if (c.growing) {
      if (c.edges()) {
        c.growing = false;
      } else {
        for (Circle other : circles) {
          if (c != other) {
            float d = dist(c.s.x, c.s.y, other.s.x, other.s.y);
            if (d - 2 < c.s.z + other.s.z) {
              c.growing = false;
              break;
            }
          }
        }
      }
    }
    c.show();
    c.grow();
  }
}

Circle newCircle() {
  float x = random(width);
  float y = random(height);

  boolean valid = true;
  for (Circle c : circles) {
    float d = dist(x, y, c.s.x, c.s.y);
    if (d < c.s.z) {
      valid = false;
      break;
    }
  }

  if (valid) {
    return new Circle(x, y);
  } else {
    return null;
  }
}

import peasy.*;

PeasyCam cam;

Tree tree;
int max_dist = 150;
int min_dist = 5;
int num_leaves = 200;

void setup() {
  size(600, 900, P3D);
  tree = new Tree(num_leaves);
  cam = new PeasyCam(this, 500);
}

void draw() {
  background(51);
  tree.draw();
  tree.grow();
}

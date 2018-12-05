int i = 0;
final int W = 400;
final int H = 400;
float[] p0 = { W / 2, H - 50 };
float[] p1 = { W / 2, 50 };
float branchAngleA = PI / 4;
float branchAngleB = PI / 4;
float trunkRatio = 0.5;

void setup() {
  size(400, 400);
}

void draw() {
  background(220);
  tree(p0, p1, i);
}

float randomRange(float min, float max) {
    return random(min, max);
}

void mouseClicked() {
    tree(p0, p1, i);
    i++;
};

void tree(float[] p0, float[] p1, int limit) {
    float dx = p1[0] - p0[0];
    float dy = p1[1] - p0[1];
    float dist = sqrt(dx * dx + dy * dy);
    float angle = atan2(dy, dx);
    float branchLength = dist * (1 - trunkRatio);
    float[] pA = {
            p0[0] + dx * trunkRatio,
            p0[1] + dy * trunkRatio
        };
    float[] pB = {
            pA[0] + cos(angle + branchAngleA) * branchLength,
            pA[1] + sin(angle + branchAngleA) * branchLength
        };
    float[] pC = {
            pA[0] + cos(angle - branchAngleB) * branchLength,
            pA[1] + sin(angle - branchAngleB) * branchLength
        };

			line(p0[0], p0[1], pA[0], pA[1]);

    if (limit > 0) {
        tree(pA, pC, limit - 1);
        tree(pA, pB, limit - 1);
    } else {
        line(pB[0], pB[1], pA[0], pA[1]);
        line(pA[0], pA[1], pC[0], pC[1]);
    }
}
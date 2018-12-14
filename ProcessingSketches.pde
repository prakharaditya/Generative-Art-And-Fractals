final int W = 600;
final int H = 200;

final float[] p0 = { 10, H - 10 };
final float[] p1 = { W - 10, H - 10 };

void setup() {
    size(600, 200);
}

void draw() {
    background(220);
    koch(p0, p1, 1);
}

void koch(float[] p0, float[] p1, int limit) {
    float dx = p1[0] - p0[0];
     float   dy = p1[1] - p0[1];
    float    dist = sqrt(dx * dx + dy * dy);
    float    unit = dist / 3;
    float    angle = atan2(dy, dx);
        float[] pA = {
            p0[0] + dx / 3,
            p0[1] + dy / 3
        };
        float[] pC = {
            p1[0] - dx / 3,
            p1[1] - dy / 3
        };
        float[] pB = {
            pA[0] + cos(angle - PI / 3) * unit,
            pA[1] + sin(angle - PI / 3) * unit
        };

    if (limit > 0) {
        koch(p0, pA, limit - 1);
        koch(pA, pB, limit - 1);
        koch(pB, pC, limit - 1);
        koch(pC, p1, limit - 1);
    } else {
        line(p0[0], p0[1], pA[0], pA[1]);
        line(pA[0], pA[1], pB[0], pB[1]);
        line(pB[0], pB[1], pC[0], pC[1]);
        line(pC[0], pC[1], p1[0], p1[1]);
    }
}

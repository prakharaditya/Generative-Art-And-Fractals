int i = 0;
final int W = 400;
final int H = 400;
float[] p0 = {      0, -H / 2 };
float[] p1 = {  W / 2, H / 2 };
float[] p2 = { -W / 2, H / 2 };

void setup() {
    size(400, 400);
}

void draw() {
    translate(width / 2, height / 2);
    background(220);
    sierpinsky(p0, p1, p2, i);
}
void mouseClicked() {  
    sierpinsky(p0, p1, p2, i);
    i++;
}

void sierpinsky(float[] p0, float[] p1, float[] p2, int limit) {
    if (limit > 0) {
        float[] pA = {
                (p0[0] + p1[0]) / 2,
                (p0[1] + p1[1]) / 2
            };
        float[] pB = {
                (p1[0] + p2[0]) / 2,
                (p1[1] + p2[1]) / 2
            };
        float[] pC = {
                (p2[0] + p0[0]) / 2,
                (p2[1] + p0[1]) / 2
            };
        sierpinsky(p0, pA, pC, limit - 1);
        sierpinsky(pA, p1, pB, limit - 1);
        sierpinsky(pC, pB, p2, limit - 1);
    } else {
        drawTriangle(p0, p1, p2);
    }
}

void drawTriangle(float[] p0, float[] p1, float[] p2) {
    float r = floor(random(255));
    float g = floor(random(255));
    float b = floor(random(255));

    fill(r, g, b);
    line(p0[0], p0[1], p1[0], p1[1]);
    line(p1[0], p1[1], p2[0], p2[1]);
    line(p2[0], p2[1], p0[0], p0[1]);
}

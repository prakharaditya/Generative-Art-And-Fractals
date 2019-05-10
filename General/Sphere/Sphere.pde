import peasy.*;
PeasyCam cam;

int total = 100;
float r = 200;
PVector[][] s;

void setup() {
    size(600, 600, P3D);
    cam = new PeasyCam(this, 500);
    s = new PVector[total + 1][total + 1];
}

void draw() {
    background(0);
    noStroke();
    lights();
    float r = 200;
    for (int i = 0; i < total+1; i++) {
        float lat = map(i, 0, total, 0, PI);
        for (int j = 0; j < total+1; j++) {
        float lon = map(j, 0, total, 0, TWO_PI);
        float x = r * sin(lat) * cos(lon);
        float y = r * sin(lat) * sin(lon);
        float z = r * cos(lat);
        s[i][j] = new PVector(x, y, z);
        }
    }

    for (int i = 0; i < total; i++) {
        float c = map(i, 0, total, 0, 255 * 2);
        beginShape(TRIANGLE_STRIP);
        for (int j = 0; j < total+1; j++) {
        PVector v1 = s[i][j];
        vertex(v1.x, v1.y, v1.z);
        PVector v2 = s[i+1][j];
        vertex(v2.x, v2.y, v2.z);
        }
        endShape();
    }
}
// f(x, y) = [a, b // c, d][x / y] + [e / f]
final float[][] rules = {
    {
        0.85,
        0.04,
        -0.04,
        0.85,
        0,
        1.6,
        0.85
    },
   {
        0,
        0,
        0,
        0.16,
        0,
        0,
        0.01
   },
    {
        0.2,
        -0.26,
        0.23,
        0.22,
        0,
        1.6,
        0.07
    },
    {
        -0.15,
        0.28,
        0.26,
        0.24,
        0,
        0.44,
        0.07
    }
};

float x, y;

void setup() {
  size(600, 800);
  x = random(1);
  y = random(1);
  background(0);
  noStroke();
}

void draw() 
{
  translate(width / 2, height);

  fern();
}

float[] selectRule() {
    float random = random(1);
    for (int i = 0; i < rules.length; i++) {
        float[] rule = rules[i];
        if (random < rule[6]) {
            return rule;
        }
        random -= rule[6];
    }
    float[] a = new float[1];
    return a;
}

void fern() {
    for (int i = 0; i < 100; i++) {
        float[] rule = selectRule();
        float x1 = x * rule[0] + y * rule[1] + rule[4];
        float y1 = x * rule[2] + y * rule[3] + rule[5];
        x = x1;
        y = y1;
      
        rect(x * 75, -y * 75, 1, 1);
    }
}

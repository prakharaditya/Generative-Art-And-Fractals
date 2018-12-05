// f(x, y) = [a, b // c, d][x / y] + [e / f]
const rules = [
    {
        a: 0.85,
        b: 0.04,
        c: -0.04,
        d: 0.85,
        e: 0,
        f: 1.6,
        p: 0.85
    },
    {
        a: 0,
        b: 0,
        c: 0,
        d: 0.16,
        e: 0,
        f: 0,
        p: 0.01
    },
    {
        a: 0.2,
        b: -0.26,
        c: 0.23,
        d: 0.22,
        e: 0,
        f: 1.6,
        p: 0.07
    },
    {
        a: -0.15,
        b: 0.28,
        c: 0.26,
        d: 0.24,
        e: 0,
        f: 0.44,
        p: 0.07
    }
];

let x, y;

function setup() {
  createCanvas(600, 800);
  x = random();
  y = random();
  background(0);
  noStroke();
}

function draw() 
{
  translate(width / 2, height);

  fern();
}

function selectRule() {
    let random = Math.random();
    for (let i = 0; i < rules.length; i++) {
        let rule = rules[i];
        if (random < rule.p) {
            return rule;
        }
        random -= rule.p;
    }
}

function fern() {
    for (let i = 0; i < 100; i++) {
        let rule = selectRule(),
            x1 = x * rule.a + y * rule.b + rule.e,
            y1 = x * rule.c + y * rule.d + rule.f;
        x = x1;
        y = y1;
      
        rect(x * 75, -y * 75, 1, 1);
    }
}

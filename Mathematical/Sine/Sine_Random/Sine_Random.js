let a = 0.0;

function setup() {
    createCanvas(700, 500);
    background(125);
    colorMode(HSB, 100);
    noStroke();
    }

    function draw() {
    let x = map(sin(a) * sin(a * 0.8), -1, 1, 0, width);
    let y = map(sin(a * 1.1 + 1.5) * sin(a * 3.1), -1, 1, 0, height);
    let co = map(sin(a * 0.03), -1, 1, 0, 100);
    let sz = map(sin(a * 1.7) * sin(a * 2.3), -1, 1, 5, 30);
    let bri = map(sin(a * 1.3) * sin(a * 4.1), -1, 1, 10, 60);
    fill(0, 10);

    fill(co, 50, bri);
    ellipse(x, y, sz, sz);

    a += 0.01;
}

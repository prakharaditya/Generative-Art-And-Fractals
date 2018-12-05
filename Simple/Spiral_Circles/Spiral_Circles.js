let angle = 0.0;

function setup() {
    createCanvas(900, 500);
    background(0);
}

function draw() {
    noStroke();
    translate(width / 2, height / 2);
    rotate(angle);
    ellipse(angle, 0, 2, 2);
    angle += 0.2;
}
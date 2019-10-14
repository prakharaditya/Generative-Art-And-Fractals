function setup() {
    createCanvas(800, 800);
    background(0);
    noFill();
    stroke(255);
    translate(width / 2, height / 2);
    ellipse(0, 0, width, height);
    ellipseMode(RADIUS);
    drawArcs(width / 2, 0, 5);
}

function drawArcs(r, c, n) {
    let halfRadius = r / 2;
    arc(c + halfRadius, 0, halfRadius, halfRadius, 0, PI);
    if (halfRadius > n) {
        drawArcs(halfRadius, c + halfRadius, n);
    }

    arc(c - halfRadius, 0, halfRadius, halfRadius, PI, 2 * PI);

    if (halfRadius > n) {
        drawArcs(halfRadius, c - halfRadius, n);
    }
}
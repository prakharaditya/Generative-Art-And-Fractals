function setup() {
    createCanvas(800, 800);
    background(0);
    noFill();
    stroke(255);
    translate(width / 2, height / 2);
    ellipse(0, 0, width, height);
    ellipseMode(RADIUS);
    drawCircles(width / 2, 0, 5);
}

function drawCircles(r, c, n) {
    let halfRadius = r / 2;
    ellipse(c + halfRadius, 0, halfRadius, halfRadius);
    if (halfRadius > n) {
        drawCircles(halfRadius, c + halfRadius, n);
    }

    ellipse(c - halfRadius, 0, halfRadius, halfRadius);

    if (halfRadius > n) {
        drawCircles(halfRadius, c - halfRadius, n);
    }
}
let circle_count = 10;
let circles = [];

function setup() {
    createCanvas(1000, 600);
    background(255);
    smooth();
    strokeWeight(1);
    drawCircles();
}

function draw() {
    fill(255, 100);
    rect(0, 0, width, height);

    for (let c of circles) {
        c.update();
    }
}

function mouseReleased() {
    drawCircles();
}

function drawCircles() {
    for (let i = 0; i < circle_count; i++) {
        circles.push(new Circle());
    }
}

class Circle {
    constructor() {
        this.pos = createVector(random(width), random(height));
        this.vel = createVector(random(2), random(2));
        this.radius = random(100) + 10;
    }

    update() {
        this.pos.add(this.vel);

        if (this.pos.x > (width + this.radius)) { this.pos.x = 0 - this.radius; }
        if (this.pos.x < (0 - this.radius)) { this.pos.x = width + this.radius; }
        if (this.pos.y > (height + this.radius)) { this.pos.y = 0 - this.radius; }
        if (this.pos.y < (0 - this.radius)) { this.pos.y = height + this.radius; }

        for (let i = 0; i < circles.length; i++) {
            let otherCirc = circles[i];
            if (otherCirc != this) {
                let dis = dist(this.pos.x, this.pos.y, otherCirc.pos.x, otherCirc.pos.y);
                let overlap = dis - this.radius - otherCirc.radius;
                if (overlap < 0) {
                    let mid = createVector();
                    if (this.pos.x < otherCirc.pos.x) {
                        mid.x = this.pos.x + (otherCirc.pos.x - this.pos.x) / 2;
                    } else {
                        mid.x = otherCirc.pos.x + (this.pos.x - otherCirc.pos.x) / 2;
                    }
                    if (this.pos.y < otherCirc.pos.y) {
                        mid.y = this.pos.y + (otherCirc.pos.y - this.pos.y) / 2;
                    }
                    else {
                        mid.y = otherCirc.pos.y + (this.pos.y - otherCirc.pos.y) / 2;
                    }

                    stroke(0, 100);
                    noFill();
                    overlap *= -0.9;
                    ellipse(mid.x, mid.y, overlap, overlap);
                }
            }
        }
    }
}
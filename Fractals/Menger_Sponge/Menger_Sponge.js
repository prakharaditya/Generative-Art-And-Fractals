let a = 0;
sponge = [];


function setup() {
    createCanvas(600, 600, WEBGL);
    let b = new Box(0, 0, 0, 200);
    sponge.push(b);
}

function draw() {
    background(0);
    stroke(255);
    lights();

    rotateX(a);

    for (let i = 0; i < sponge.length; ++i) {
        sponge[i].show();
    }

    a += 0.01;
}

function mousePressed() {
    let next = [];

    for (let i = 0; i < sponge.length; ++i) {
        next.push(...sponge[i].generate());
    }
    sponge = next;
}

class Box {
    constructor(x, y, z, r_) {
        this.pos = createVector(x, y, z);
        this.r = r_;
    }

    generate() {
        let boxes = [];
        for (let x = -1; x < 2; x++) {
            for (let y = -1; y < 2; y++) {
                for (let z = -1; z < 2; z++) {
                    let sum = abs(x) + abs(y) + abs(z);

                    let newR = this.r / 3;
                    /* USE <= 1 FOR INVERSE (COOL FRACTAL) */
                    if (sum > 1) {
                        let b = new Box(this.pos.x + x * newR,
                            this.pos.y + y * newR,
                            this.pos.z + z * newR, newR);
                        boxes.push(b);
                    }
                }
            }
        }
        return boxes;
    }

    show() {
        push();
        translate(this.pos.x, this.pos.y, this.pos.z);
        box(this.r);
        pop();
    }
}
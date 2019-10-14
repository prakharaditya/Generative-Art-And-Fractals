let cols, rows;
let scale = 20;
let w = 1200;
let h = 2400;
let move = 0;

let terrain;

function setup() {
    createCanvas(600, 600, WEBGL);

    cols = w / scale;
    rows = h / scale;

    terrain = new Array(cols)
    for (let i = 0; i < cols; i++) {
        terrain[i] = new Array(rows);
    }

    let yoff = 0;
    for (let y = 0; y < rows; ++y) {
        let xoff = 0;
        for (let x = 0; x < cols; ++x) {
            terrain[x][y] = map(noise(xoff, yoff), 0, 1, -100, 100);
            xoff += 0.2;
        }
        yoff += 0.2;
    }
}

function draw() {
    move -= 0.1;
    let yoff = move;
    for (let y = 0; y < rows; ++y) {
        let xoff = 0;
        for (let x = 0; x < cols; ++x) {
            terrain[x][y] = map(noise(xoff, yoff), 0, 1, -100, 100);
            xoff += 0.2;
        }
        yoff += 0.2;
    }

    background(0);
    stroke(255);
    noFill();

    translate(width / 2, height / 2 + 100);
    rotateX(PI / 3);
    translate(-w / 2, -h / 2);

    for (let y = 0; y < rows - 1; ++y) {
        beginShape(TRIANGLE_STRIP);
        for (let x = 0; x < cols; ++x) {
            vertex(x * scale, y * scale, terrain[x][y]);
            vertex(x * scale, (y + 1) * scale, terrain[x][y + 1]);
            //rect(x * scale, y * scale, scale, scale);
        }
        endShape();
    }
}

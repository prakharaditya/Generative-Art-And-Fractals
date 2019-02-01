let t;
const CELL_SIZE = 20;

function setup() {
	t = 0.0;
	createCanvas(600, 600);
}

function draw() {
	t += 0.01;
	background(0);
	stroke(255);

	for (let x = 0; x < width; x += CELL_SIZE) {
		for (let y = 0; y < height; y += CELL_SIZE) {
			let f = getFlow(x, y);
			line(x, y, x + f.x, y + f.y);
		}
	}
}

function getFlow(x, y) {
	let angle = noise(x / 100 + t, y / 100);
	let p = p5.Vector.fromAngle(angle).setMag(10);
	return p;
}

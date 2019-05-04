let x = 0;
let y = 0;
let space = 20;
let prob = 0.75;

function setup() {
	createCanvas(600, 600);
	background(0);
}

function draw() {
	stroke(255);
	strokeWeight(5);
	strokeCap(ROUND);
	for (let i = 0; i < 60; ++i) {
		if (random(1) < prob) {
			line(x, y, x + space, y + space);
		} else {
			line(x, y + space, x + space, y);
		}

		x += space;

		if (x > width) {
			x = 0;
			y += space;
		}
	}
}

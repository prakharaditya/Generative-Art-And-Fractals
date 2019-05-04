let walkers = [];
const MAX_WALKERS = 5000;

function setup() {
	createCanvas(800, 600);

	for (let i = 0; i < MAX_WALKERS; ++i) {
		walkers.push(
			new RandomWalker(
				createVector(floor(random(width)), floor(random(height))),
				1
			)
		);
	}
	background(255);
}

function draw() {
	fill(255, 10);
	rect(0, 0, width, height);
	for (let i = 0; i < walkers.length; ++i) {
		walkers[i].draw();
	}
}

class RandomWalker {
	constructor(_position, _size) {
		this.p = _position;
		this.s = _size;
	}

	update() {
		this.p.x += Math.floor(Math.random() * 3) - 1;
		this.p.y += Math.floor(Math.random() * 3) - 1;

		if (this.p.x > width) this.p.x = width - this.s;
		if (this.p.x < 0) this.p.x = 0 + this.s;
		if (this.p.y > height) this.p.y = height - this.s;
		if (this.p.y < 0) this.p.y = 0 + this.s;
	}

	draw() {
		this.update();
		fill(0);
		ellipse(this.p.x, this.p.y, this.s, this.s);
	}
}

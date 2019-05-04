let ps = [];

function setup() {
	createCanvas(600, 400);
}

function draw() {
	background(0);

	for (let i = 0; i < 1; ++i) {
		ps.push(new Particle());
	}

	for (let i = ps.length - 1; i >= 0; --i) {
		if (ps[i].isAlive()) {
			ps[i].update();
			ps[i].draw();
		} else {
			ps.splice(i, i);
		}
	}
}

class Particle {
	constructor() {
		this.p = createVector(300, 380);
		this.v = createVector();
		this.v.x = random(-1, 1);
		this.v.y = random(-5, -1);
		this.alpha = 255;
	}

	isAlive() {
		return this.alpha > 0;
	}

	update() {
		this.p.add(this.v);
		this.alpha -= 5;
	}

	draw() {
		noStroke();
		fill(150, this.alpha);
		circle(this.p.x, this.p.y, 16);
	}
}

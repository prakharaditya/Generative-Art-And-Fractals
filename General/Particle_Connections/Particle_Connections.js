const particles = [];

function setup() {
	createCanvas(window.innerWidth, window.innerHeight);

	const count = Math.floor(window.innerWidth / 10);

	for (let i = 0; i < count; i++) {
		particles.push(new Particle());
	}
}

function draw() {
	background(55, 100, 144);
	particles.forEach((p, i) => {
		p.Update();
		p.Draw();
		p.NeighbourCheck(particles.slice(i));
	});
}

class Particle {
	constructor() {
		this.P = createVector(random(width), random(height));
		this.V = createVector(random(-0.5, 0.5), random(-0.5, 0.5));
		this.S = 10;
	}

	Update() {
		this.P.add(this.V);
		this.Bounds();
	}

	Draw() {
		noStroke();
		fill(255, 255 * 0.5);
		circle(this.P.x, this.P.y, this.S);
	}

	Bounds() {
		if (this.P.x < 0 || this.P.x > width) {
			this.V.x *= -1;
		}

		if (this.P.y < 0 || this.P.y > height) {
			this.V.y *= -1;
		}
	}

	NeighbourCheck(particles) {
		stroke(255, 255 * 0.1);
		particles.forEach((p) => {
			const d = dist(this.P.x, this.P.y, p.P.x, p.P.y);
			if (d < 120) {
				line(this.P.x, this.P.y, p.P.x, p.P.y);
			}
		});
	}
}

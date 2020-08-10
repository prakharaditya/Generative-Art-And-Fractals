const attractors = [];
const particles = [];

function setup() {
	createCanvas(400, 400);
	background(51);

	for (let i = 0; i < 100; ++i) {
		particles.push(new Particle(random(width), random(height)));
	}

	for (let i = 0; i < 5; ++i) {
		attractors.push(createVector(random(width), random(height)));
	}
}

function draw() {
	background(51);
	stroke(255);
	strokeWeight(4);

	for (let i = 0; i < attractors.length; ++i) {
		stroke(0, 255, 0);
		point(attractors[i].x, attractors[i].y);
	}

	for (let i = 0; i < particles.length; ++i) {
		for (let j = 0; j < attractors.length; ++j) {
			particles[i].attracted(attractors[j]);
		}

		particles[i].update();
		particles[i].show();
	}
}

function mousePressed() {
	attractors.push(createVector(mouseX, mouseY));
}

function Particle(x, y) {
	this.P = createVector(x, y);
	this.PP = createVector(x, y);
	this.V = createVector();
	this.V.setMag(random(1, 3));
	this.A = createVector();

	this.update = function () {
		this.P.add(this.V);
		this.V.add(this.A);
		this.A.mult(0);
	};

	this.show = function () {
		stroke(255);
		strokeWeight(2);
		point(this.P.x, this.P.y);
		line(this.P.x, this.P.y, this.PP.x, this.PP.y);

		this.PP.x = this.P.x;
		this.PP.y = this.P.y;
	};

	this.attracted = function (target) {
		var force = p5.Vector.sub(target, this.P);
		var d = force.mag();
		d = constrain(d, 1, 25);
		var G = 6.67408;
		var strength = G / (d * d);
		force.setMag(strength);
		this.A.add(force);
	};
}

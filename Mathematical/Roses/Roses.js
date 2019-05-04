let d = 1;
let n = 1;
let k = n / d;

function setup() {
	createCanvas(600, 600);
	frameRate(1);
}

function draw() {
	background(51);
	noFill();
	stroke(255);
	strokeWeight(1);
	translate(width / 2, height / 2);
	beginShape();
	for (let a = 0; a < TWO_PI * n; a += 0.02) {
		let r = 200 * cos(k * a);
		let x = r * cos(a);
		let y = r * sin(a);
		vertex(x, y);
	}
	endShape();
	d++;
	if (d > 7) {
		d = 1;
		n++;
	}
	k = d / n;
}

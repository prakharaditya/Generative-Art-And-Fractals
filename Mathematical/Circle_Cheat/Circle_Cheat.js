function setup() {
	createCanvas(600, 600);
}

function draw() {
	translate(width / 2, height / 2);
	background(51);
	stroke(255);
	let r = 100;

	for (let i = -HALF_PI; i < -HALF_PI + PI / 4; i += 0.01) {
		let x = r * cos(i);
		let y = r * sin(i);
		point(x, y);
		point(x, -y);
		point(-x, y);
		point(-x, -y);
		point(y, x);
		point(-y, x);
		point(y, -x);
		point(-y, -x);
	}
}

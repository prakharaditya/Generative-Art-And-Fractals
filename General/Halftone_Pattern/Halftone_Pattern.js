function setup() {
	createCanvas(800, 800);
	background(255);
	noLoop();
}

function draw() {
	noStroke();
	for (let x = 10; x < width; x += 10) {
		for (let y = 10; y < height; y += 10) {
			let circleSize = random(10 * 0.3, 10);
			fill(random(255));
			ellipse(x, y, circleSize, circleSize);
		}
	}
}

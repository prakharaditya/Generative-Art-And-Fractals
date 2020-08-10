const reflections = 10; // Number of reflections about the axis
const angle = 360 / reflections; // Angle for calculation
let counter = 0; // Counter for

function setup() {
	createCanvas(800, 800);
	angleMode(DEGREES);
	background(127);
}

function draw() {
	translate(width / 2, height / 2);
	strokeWeight(22);

	// Only 'draw' if the mouse is in bounds...
	if (mouseX > 0 && mouseX < width && mouseY > 0 && mouseY < height) {
		// Calculate mouse & prev. mouse position.
		const M = createVector(mouseX - width / 2, mouseY - height / 2);
		const PM = createVector(pmouseX - width / 2, pmouseY - height / 2);

		// Only 'draw' if the user holds the mouse
		if (mouseIsPressed) {
			// Generate colours based off of the counter value
			let R = map(sin(counter), -1, 1, 0, 255);
			let G = map(cos(counter), -1, 1, 0, 255);
			let B = map(sin(-counter), -1, 1, 0, 255);

			counter++;

			stroke(R, G, B);

			// Create all 'slices' of the image.
			for (let i = 0; i < reflections; i++) {
				rotate(angle);
				line(M.x, M.y, PM.x, PM.y);
				push();
				scale(1, -1);
				line(M.x, M.y, PM.x, PM.y);
				pop();
			}
		}
	}
}

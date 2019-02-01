function setup() {
	createCanvas(800, 600);
	walker = new RandomWalker(width / 2, height / 2, 2);
	background(255);
}

function draw() {
	fill(255, 10);
	rect(0, 0, width, height);
	walker.draw();
}

class RandomWalker {
	constructor(_x, _y, _size) {
		this.position = createVector(_x, _y);
		this.walker_size = _size;
	}

	update() {
		this.position.x += Math.floor(Math.random() * 3) - 1;
		this.position.y += Math.floor(Math.random() * 3) - 1;

		if (this.position.x > width) this.position.x = width - this.walker_size;
		if (this.position.x < 0) this.position.x = 0 + this.walker_size;
		if (this.position.y > height)
			this.position.y = height - this.walker_size;
		if (this.position.y < 0) this.position.y = 0 + this.walker_size;
	}

	draw() {
		this.update();
		fill(0);
		ellipse(
			this.position.x,
			this.position.y,
			this.walker_size,
			this.walker_size
		);
	}
}

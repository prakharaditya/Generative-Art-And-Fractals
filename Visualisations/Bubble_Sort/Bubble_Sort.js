let values;
let i = 0;

function setup() {
	createCanvas(800, 500);
	values = Array(width);
	for (let i = 0; i < values.length; ++i) {
		values[i] = random(height);
	}
}

function draw() {
	background(51);
	stroke(255);

	if (i < values.length) {
		for (let j = 0; j < values.length - i - 1; ++j) {
			let a = values[j];
			let b = values[j + 1];
			if (a > b) {
				swap(values, j, j + 1);
			}
		}
	} else {
		noLoop();
	}
	i++;

	for (let i = 0; i < values.length; ++i) {
		line(i, height, i, height - values[i]);
	}
}

function swap(arr, a, b) {
	let tmp = arr[a];
	arr[a] = arr[b];
	arr[b] = tmp;
}

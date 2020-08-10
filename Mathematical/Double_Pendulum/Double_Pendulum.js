let r2 = 200;
let r1 = 200;
let m1 = 10;
let m2 = 40;
let a1 = Math.PI / 2;
let a2 = Math.PI / 2;
let a1v = 0;
let a2v = 0;
let G = 1.25;

const s = [];

function setup() {
	createCanvas(850, 500);
}

function draw() {
	let num1 = -G * (2 * m1 + m2) * Math.sin(a1);
	let num2 = -m2 * G * Math.sin(a1 - 2 * a2);
	let num3 = -2 * Math.sin(a1 - a2) * m2;
	let num4 = a2v * a2v * r2 + a1v * a1v * r1 * Math.cos(a1 - a2);
	let den = r1 * (2 * m1 + m2 - m2 * Math.cos(2 * a1 - 2 * a2));
	let a1a = (num1 + num2 + num3 * num4) / den;

	num1 = 2 * Math.sin(a1 - a2);
	num2 = a1v * a1v * r1 * (m1 + m2);
	num3 = G * (m1 + m2) * Math.cos(a1);
	num4 = a2v * a2v * r2 * m2 * Math.cos(a1 - a2);
	den = r2 * (2 * m1 + m2 - m2 * Math.cos(2 * a1 - 2 * a2));
	let a2a = (num1 * (num2 + num3 + num4)) / den;

	background(255);

	translate(width / 2, 50);

	let x1 = r1 * Math.sin(a1);
	let y1 = r1 * Math.cos(a1);
	let x2 = x1 + r2 * Math.sin(a2);
	let y2 = y1 + r2 * Math.cos(a2);

	let pv = createVector(x2, y2);
	s.push(pv);
	noFill();
	stroke(0, 20);
	strokeWeight(1);
	beginShape();

	for (let i = 0; i < s.length; ++i) {
		vertex(s[i].x, s[i].y);
	}

	endShape();

	stroke(0);
	strokeWeight(2);
	line(0, 0, x1, y1);
	fill(0);
	line(x1, y1, x2, y2);
	circle(x1, y1, m1 / 2);
	circle(x2, y2, m2 / 2);
	point(x2, y2);

	a1v += a1a;
	a2v += a2a;
	a1 += a1v;
	a2 += a2v;
}

let time = 0.0;

function setup() {
  createCanvas(800, 300);
}

function draw() {
  background(255);
  let x = 0.0;
  while (x < width)
  {
    let a = height / 2 + 20 * noise(x / 100, time);
    stroke(0, 50, 150);
    line(x, a, x, height);
    x += 1;
  }
  time += 0.02;
}
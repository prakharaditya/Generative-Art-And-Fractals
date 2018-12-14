const LIMIT = 500;
let x = new Array(LIMIT);
let y = new Array(LIMIT);
let speed = new Array(LIMIT);

function setup() {
  createCanvas(800, 800);
  background(0);
  stroke(255);
  strokeWeight(5);

  let i = 0;
  while (i < LIMIT) {    
    x[i] = random(0, width);
    y[i] = random(0, height);
    speed[i] = random(1, 5);
    i++;
  }
}

function draw() {
  fill(0, 100);
  rect(0,0,width,height);
  
  let i = 0;
  while (i < LIMIT) {    
    strokeWeight(speed[i]);
    point(x[i], y[i]);
    x[i] -= speed[i];
    if (x[i] < 0) {
      x[i] = width;
    }
    i++;
  }
}  
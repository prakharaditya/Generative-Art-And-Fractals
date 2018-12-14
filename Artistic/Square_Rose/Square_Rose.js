let SQUARES = 60;
let INITIAL_SIZE = 400;
let INITIAL_WEIGHT = 25;
let weight;
let size;
let time;

function setup() {
  createCanvas(600, 600);
  fill(255);
  stroke(0);
  time = 0;
  frameRate(30);
}

function draw() {
  weight = INITIAL_WEIGHT;
  size = INITIAL_SIZE;
  background(255);
  translate(width / 2, height / 2);
  rectMode(CENTER);
  for (let i = 0; i < SQUARES; i++)
  {
   	// Uncomment this to make into a multicoloured thing.
    //stroke(((time * i) * 56) % 255,((time * i) * 87) % 255, ((time * i) * 22) % 255);
    fill((size + i * 10) % 255 - 125, (i* 10 + 12) % 255, 126);
    let sAngle = (i % 2 == 0) ? 0 : PI;
    rotate(sAngle + time);
    strokeWeight(Math.max(weight, 5));
    rect(0, 0, size, size);
    size *= 0.95;
    weight *= 0.95;
    
  }
  ellipse(0, 0, 5, 5);
  time += 0.002;
}
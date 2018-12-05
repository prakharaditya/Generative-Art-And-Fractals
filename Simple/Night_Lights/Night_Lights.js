function setup() {
    createCanvas(500, 400);
    background(0);
    noStroke();
    frameRate(10);
  }
  
  function draw() {
    fill(0, 10);
    rect(0, 0, width, height);
    fill(255);
    ellipse(random(width), random(height), 20, 20);
  }
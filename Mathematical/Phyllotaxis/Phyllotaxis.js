const SIZE = 3;

let a;
let c;
let n = 0.0;

let aTimes = 137.5;
let r;

function setup() {
  createCanvas(500, 500);
  background(0);
}

function draw() {
    c = 4.0;
    translate(width / 2, height / 2);
  
    a = n * aTimes;
    r = c * sqrt(n); 
  
    let x = r * cos(radians(a));
    let y = r * sin(radians(a));
  
    fill((abs(x) % 200 ) + 55, ((abs(x) + abs(y)) % 200 ) + 55, (abs(y) % 200) + 55);
    noStroke();
    ellipse(x, y, SIZE, SIZE);  
    n++;
}
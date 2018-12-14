let a = 0;
let b = 0;
let c = 0;

function setup() {
    background(255);
    colorMode(HSB, 100);
    createCanvas(500, 400);
    smooth();
    strokeWeight(3);
    }

function draw() {
    stroke(c, 80, 80, 20);
    let x0 = map(sin(a), -1, 1, 20, width - 20);
    let y0 = map(cos(a), -1, 1, 20, height - 20);
    
    let x1 = map(sin(b), -1, 1, 20, width - 20);
    let y1 = map(cos(b), -1, 1, 20, height - 20);
    
    line(x0, y0, x1, y1);
    
    // Twirly
    a += 0.03;
    b += 0.05;
    
    // Heart
    //a += 0.3;
    //b += 0.4;
    
    // Triangle
    //a += 0.01;
    //b += 0.04;
    
    // Clover
    //a += 0.1;
    //b += 0.04;
    
    c++;
    if (c > 100) {
        c = 0;
    }
}
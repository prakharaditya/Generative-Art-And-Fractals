let radius = 100;
function setup() {
  createCanvas(600, 400, WEBGL);
  background(255);
  stroke(0);
  smooth();
}

function draw() {
  background(255);

  rotateY(frameCount * 0.03);
  rotateX(frameCount * 0.04);

  let s = 0;
  let t = 0;
  let lastx = 0;
  let lasty = 0;
  let lastz = 0;

  while (t < 180) {
    s += 25;
    t += 0.2;
    let radianS = radians(s);
    let radianT = radians(t);

    let thisx = 0 + radius * cos(radianS) * sin(radianT);
    let thisy = 0 + radius * sin(radianS) * sin(radianT);
    let thisz = 0 + radius * cos(radianT);

    if (lastx != 0) {
      line(thisx, thisy, thisz, lastx, lasty, lastz);
    }

    lastx = thisx;
    lasty = thisy;
    lastz = thisz;
  }
}

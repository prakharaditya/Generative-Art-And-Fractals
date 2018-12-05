/* 
 * Replication of Schotter (Gravel) - Georg Nees ,1968
 */
let r, c;
let scale = 20.0;

function setup() {
  createCanvas(500, 500);
  noLoop();
}

function draw() {
 noFill();
 for (let i = 0; i < height; i += scale) {
   for (let j = 0; j < width; j += scale) {
     translate(i, j);
     rotate(random(1.0) * (j / 2) / 100);
     rect(0, 0, scale, scale);
     resetMatrix();
   }
 }
}
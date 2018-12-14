const s = [];
const speed = 2.0;

const W = 800;
const H = 600;

function Star()
{
  this.p = createVector(
      	random(-W/2, W/2), 
      	random(-H/2, H/2), 
        random(W/2)
   );
}

Star.prototype.run = function()
{
    this.p.z -= speed;
    if (this.p.z < 1.0)
    {
      this.p.z = W / 2;
      this.p.x = random(-W / 2, W / 2);
      this.p.y = random(-H / 2, H / 2);
    }    

    let r = map(this.p.z, 0, W / 2, 10, 0);
    ellipse(map(this.p.x / this.p.z, 0, 1, 0, W/2), 
      			map(this.p.y / this.p.z, 0, 1, 0, H/2), r, r);
    stroke(255);
}

function setup()
{
  createCanvas(800, 600);
  
  for (let i = 0; i < 800; i++) {
    s[i] = new Star();
  }
}

function draw()
{
  fill(0, 100);
  rect(0, 0, width, height);
  translate(width/2, height/2);
  
  fill(255);
  noStroke();
  
  for (let i = 0; i < s.length; i++) {
    s[i].run();
  }
}


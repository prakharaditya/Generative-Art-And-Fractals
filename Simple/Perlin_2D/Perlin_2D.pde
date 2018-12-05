size(600,600);
smooth();
background(255);
float xstart = random(10);
float xnoise = xstart;
float ynoise = random(10);

for (int y = 0; y <= height; y+=1) {
 ynoise += 0.01;
xnoise = xstart;
 for (int x = 0; x <= width; x+=1) {
 xnoise += 0.01;

 stroke(0, (noise(xnoise, ynoise) * 255));
 line(x,y, x+1, y+1);
 }
}

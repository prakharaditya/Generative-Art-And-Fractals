function setup()
{
    createCanvas(800, 800);
    background(255);
    smooth();
    noStroke();
    let  radius = 10;
    for (let i = 0; i <= width; i += radius / 2)
    {
        for (let j = 0; j <= height; j += radius / 2)
        {
            let size = (random(radius * 2));
            fill(255, 255, 0);
            arc(random(i + i), random(j), size, size, random(PI*2), random(PI*2));
            fill(0);
            arc(random(i), random(j), size, size, random(PI*2), random(PI*2));
        }
    } 
}


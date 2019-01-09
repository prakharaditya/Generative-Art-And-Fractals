let a;   // Size
let b;   // Size
let m;  // No. of points
let n1;  // Smoothness
let n2;  // Shape of spikes
let n3;  // Shape of spikes
let theta_inc = 0.05;
let aS, bS, mS;
let n1S, n2S, n3S;

function setup()
{
    createCanvas(600, 600); 
    
    // create sliders
    aS = createSlider(0.0, 10.0, 4.0);
    aS.position(20, 20);
    bS = createSlider(0.0, 10.0, 4.0);
    bS.position(20, 50);
    mS = createSlider(1, 10, 1);
    mS.position(20, 80);
    
    n1S = createSlider(0.0, 5.0, 4);
    n1S.position(20, 110);
    n2S = createSlider(1.0, 5.0, 1.0);
    n2S.position(20, 140);
    n3S = createSlider(1.0, 5.0, 1.0);
    n3S.position(20, 170);
    }

    function draw() 
    {
    background(255);
    a = aS.value();
    b = bS.value();
    m = mS.value();
    
    n1 = n1S.value();
    n2 = n2S.value();
    n3 = n3S.value();
        
    drawShape();
    }

    function drawShape()
    {
    translate(width / 2, height / 2);
    fill(0);
    beginShape();
    for(let theta = 0; theta <= 2 * PI; theta += theta_inc)
    {
        let rad = pow(pow(abs(cos(m * theta / 4.0) / a), n2) + 
                    pow(abs(sin(m * theta / 4.0) / b), n3), -1.0 / n1);
        let x = rad * cos(theta) * 50;
        let y = rad * sin(theta) * 50;
        vertex(x, y);
    }
    endShape(); 	 
}
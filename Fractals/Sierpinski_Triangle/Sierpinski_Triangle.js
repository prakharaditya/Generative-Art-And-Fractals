let i = 0;

function setup() {
    createCanvas(400, 400);
    (p0 = {
        x: 0,
        y: -height / 2
    }),
        (p1 = {
            x: width / 2,
            y: height / 2
        }),
        (p2 = {
            x: -width / 2,
            y: height / 2
        });
}

function draw() {
    translate(width / 2, height / 2);
    background(220);
    sierpinsky(p0, p1, p2, i);
}

window.addEventListener('click', function() {
    sierpinsky(p0, p1, p2, i);
    i++;
});

function sierpinsky(p0, p1, p2, limit) {
    if (limit > 0) {
        let pA = {
                x: (p0.x + p1.x) / 2,
                y: (p0.y + p1.y) / 2
            },
            pB = {
                x: (p1.x + p2.x) / 2,
                y: (p1.y + p2.y) / 2
            },
            pC = {
                x: (p2.x + p0.x) / 2,
                y: (p2.y + p0.y) / 2
            };
        sierpinsky(p0, pA, pC, limit - 1);
        sierpinsky(pA, p1, pB, limit - 1);
        sierpinsky(pC, pB, p2, limit - 1);
    } else {
        drawTriangle(p0, p1, p2);
    }
}

function drawTriangle(p0, p1, p2) {
    let r = Math.floor(Math.random() * 255),
        g = Math.floor(Math.random() * 255),
        b = Math.floor(Math.random() * 255);

    fill(r, g, b);
    line(p0.x, p0.y, p1.x, p1.y);
    line(p1.x, p1.y, p2.x, p2.y);
    line(p2.x, p2.y, p0.x, p0.y);
}

let p0, p1;

function setup() {
    createCanvas(400, 400);
    p0 = {
        x: 10,
        y: height / 2
    };
    p1 = {
        x: width - 10,
        y: height / 2
    };
}

function draw() {
    background(220);
    koch(p0, p1, 2);
}

function koch(p0, p1, limit) {
    let dx = p1.x - p0.x,
        dy = p1.y - p0.y,
        dist = sqrt(dx * dx + dy * dy),
        unit = dist / 3,
        angle = atan2(dy, dx),
        pA = {
            x: p0.x + dx / 3,
            y: p0.y + dy / 3
        },
        pC = {
            x: p1.x - dx / 3,
            y: p1.y - dy / 3
        },
        pB = {
            x: pA.x + cos(angle - PI / 3) * unit,
            y: pA.y + sin(angle - PI / 3) * unit
        };

    if (limit > 0) {
        koch(p0, pA, limit - 1);
        koch(pA, pB, limit - 1);
        koch(pB, pC, limit - 1);
        koch(pC, p1, limit - 1);
    } else {
        line(p0.x, p0.y, pA.x, pA.y);
        line(pA.x, pA.y, pB.x, pB.y);
        line(pB.x, pB.y, pC.x, pC.y);
        line(pC.x, pC.y, p1.x, p1.y);
    }
}

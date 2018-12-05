let i = 0;

function setup() {
    createCanvas(400, 400);
    (p0 = {
        x: width / 2,
        y: height - 50
    }),
        (p1 = {
            x: width / 2,
            y: 50
        }),
        (branchAngleA = PI / 4),
        (branchAngleB = PI / 4),
        (trunkRatio = 0.5);
}

function draw() {
    background(220);
    tree(p0, p1, i);
}

function randomRange(min, max) {
    return min + random() * (max - min);
}

window.addEventListener('click', function() {
    tree(p0, p1, i);
    i++;
});

function tree(p0, p1, limit) {
    var dx = p1.x - p0.x,
        dy = p1.y - p0.y,
        dist = sqrt(dx * dx + dy * dy),
        angle = atan2(dy, dx),
        branchLength = dist * (1 - trunkRatio),
        pA = {
            x: p0.x + dx * trunkRatio,
            y: p0.y + dy * trunkRatio
        },
        pB = {
            x: pA.x + cos(angle + branchAngleA) * branchLength,
            y: pA.y + sin(angle + branchAngleA) * branchLength
        },
        pC = {
            x: pA.x + cos(angle - branchAngleB) * branchLength,
            y: pA.y + sin(angle - branchAngleB) * branchLength
        };

    line(p0.x, p0.y, pA.x, pA.y);

    if (limit > 0) {
        tree(pA, pC, limit - 1);
        tree(pA, pB, limit - 1);
    } else {
        line(pB.x, pB.y, pA.x, pA.y);
        line(pA.x, pA.y, pC.x, pC.y);
    }
}

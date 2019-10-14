let p;
let level_max = 6;
let _strutFactor = 0.2;
let size = 450;

function setup() {
    createCanvas(1000, 1000);
    smooth();
    noLoop();
}

function draw() {
    translate(width / 2, height / 2);
    background(255);
    p = new Sutcliffe();
}

class Sutcliffe {

    constructor() {
        this.pointArr = [0, 0, 0, 0, 0];

        let step = 360 / 5;

        for (let i = -18, j = 0; i < 360 - 18; i += step, j++) {
            this.pointArr[j] = createVector(size * cos(radians(i)), size * sin(radians(i)));
        }

        this.root = new Segment(0, 0, this.pointArr);
        this.root.draw();
    }
}

class Segment {

    constructor(lev, n, points) {
        this.level = lev;
        this.num = n;

        this.oPoints = points;
        this.mPoints = this.calculateMids();
        this.pPoints = this.calculateStruts();
        this.children = [];

        if ((this.level + 1) < level_max) {
            let child = new Segment(this.level + 1, 0, this.pPoints);
            this.children.push(child);

            for (let i = 0; i < this.oPoints.length; i++) {
                let next = i - 1;

                if (next < 0) {
                    next += this.oPoints.length;
                }

                let newPoints = [
                    this.pPoints[i],
                    this.mPoints[i],
                    this.oPoints[i],
                    this.mPoints[next],
                    this.pPoints[next]
                ];

                child = new Segment(this.level + 1, i + 1, newPoints);
                this.children.push(child);
            }
        }
    }

    calculateMids() {
        let mid_points = new Array(this.oPoints.length);

        for (let i = 0; i < this.oPoints.length; i++) {
            let next = i + 1;
            if (next == this.oPoints.length) {
                next = 0;
            }

            mid_points[i] = this.calcMidPoint(this.oPoints[i], this.oPoints[next]);;
        }

        return mid_points;
    }

    calcMidPoint(end1, end2) {
        let m = createVector(0, 0);

        if (end1.x > end2.x) m.x = end2.x + ((end1.x - end2.x) / 2);
        else m.x = end1.x + ((end2.x - end1.x) / 2);

        if (end1.y > end2.y) m.y = end2.y + ((end1.y - end2.y) / 2);
        else m.y = end1.y + ((end2.y - end1.y) / 2);

        return m;
    }

    calculateStruts() {
        let strutArray = new Array(this.mPoints.length);
        for (let i = 0; i < this.mPoints.length; i++) {
            let nexti = i + 3;
            if (nexti >= this.mPoints.length) {
                nexti -= this.mPoints.length;
            }

            let thisSP = this.calcProjPoint(this.mPoints[i], this.oPoints[nexti]);
            strutArray[i] = thisSP;
        }
        return strutArray;
    }

    calcProjPoint(mp, op) {
        let p = createVector(0, 0);
        let adj, opp;

        if (op.x > mp.x) opp = op.x - mp.x;
        else opp = mp.x - op.x;

        if (op.y > mp.y) adj = op.y - mp.y;
        else adj = mp.y - op.y;

        if (op.x > mp.x) p.x = mp.x + (opp * _strutFactor);
        else p.x = mp.x - (opp * _strutFactor);

        if (op.y > mp.y) p.y = mp.y + (adj * _strutFactor);
        else p.y = mp.y - (adj * _strutFactor);

        return p;
    }


    draw() {
        strokeWeight(5 - this.level);
        for (let i = 0; i < this.oPoints.length; i++) {
            let next = i + 1;
            if (next == this.oPoints.length) {
                next = 0;
            }
            line(this.oPoints[i].x, this.oPoints[i].y, this.oPoints[next].x, this.oPoints[next].y);
        }

        strokeWeight(0.5);
        fill(255, 150);
        for (let k = 0; k < this.children.length; k++) {
            this.children[k].draw();
        }
    }
}
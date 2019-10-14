let cells;
let cell_size = 10;
let row, col;

function setup() {
    createCanvas(500, 300);
    row = floor(width / cell_size);
    col = floor(height / cell_size);
    reset();
}

function draw() {
    background(200);

    for (let x = 0; x < row; x++) {
        for (let y = 0; y < col; y++) {
            cells[x][y].calcNextState();
        }
    }

    translate(cell_size / 2, cell_size / 2);

    for (let x = 0; x < row; x++) {
        for (let y = 0; y < col; y++) {
            cells[x][y].draw();
        }
    }
}


function reset() {
    cells = new Array(row);
    for (let i = 0; i < row; i++) {
        cells[i] = new Array(col);
    }


    for (let x = 0; x < row; x++) {
        for (let y = 0; y < col; y++) {
            let c = new Cell(x, y);
            cells[x][y] = c;
        }
    }


    for (let x = 0; x < row; x++) {
        for (let y = 0; y < col; y++) {
            let above = y - 1;
            let below = y + 1;
            let left = x - 1;
            let right = x + 1;

            if (above < 0) {
                above = col - 1;
            }
            if (below == col) {
                below = 0;
            }
            if (left < 0) {
                left = row - 1;
            }
            if (right == row) {
                right = 0;
            }

            cells[x][y].addNeighbour(cells[left][above]);
            cells[x][y].addNeighbour(cells[left][y]);
            cells[x][y].addNeighbour(cells[left][below]);
            cells[x][y].addNeighbour(cells[x][below]);
            cells[x][y].addNeighbour(cells[right][below]);
            cells[x][y].addNeighbour(cells[right][y]);
            cells[x][y].addNeighbour(cells[right][above]);
            cells[x][y].addNeighbour(cells[x][above]);
        }
    }
}

function mousePressed() {
    reset();
}

function mouseMoved() {
    let x = floor(mouseX / cell_size);
    let y = floor(mouseY / cell_size);

    let above = y - 1;
    let below = y + 1;
    let left = x - 1;
    let right = x + 1;

    if (above < 0) { above = col - 1; }
    if (below == col) { below = 0; }
    if (left < 0) { left = row - 1; }
    if (right == row) { right = 0; }

    cells[x][y].current = 255;
    cells[right][y].current = 255;
    cells[left][y].current = 255;
    cells[x][below].current = 255;
    cells[x][above].current = 255;
}

class Cell {
    constructor(ex, why) {
        this.x = ex * cell_size;
        this.y = why * cell_size;
        this.previous = 0;
        this.next = ((this.x / 500) + (this.y / 300)) * 14;
        this.current = this.next;
        this.neighbours = [];
    }

    addNeighbour(cell) {
        this.neighbours.push(cell);
    }

    calcNextState() {
        let total = 0;
        for (let i = 0; i < this.neighbours.length; i++) {
            total += this.neighbours[i].current;
        }

        let average = floor(total / 8);

        if (average == 255) {
            this.next = 0;
        }
        else if (average == 0) {
            this.next = 255;
        }
        else {
            this.next = this.current + average;
            if (this.previous > 0) { this.next -= this.previous; }
            if (this.next > 255) { this.next = 255; }
            else if (this.next < 0) { this.next = 0; }
        }
        this.previous = this.current;
    }

    draw() {
        this.current = this.next;
        stroke(0);
        fill(this.current);
        rect(this.x, this.y, cell_size, cell_size);
    }
}
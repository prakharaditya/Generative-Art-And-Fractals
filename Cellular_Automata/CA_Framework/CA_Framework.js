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

class Cell {


    constructor(ex, why) {
        this.x = ex * cell_size;
        this.y = why * cell_size;

        if (random(2) > 1) {
            this.next = true;
        } else {
            this.next = false;
        }

        this.current = this.next;
        this.neighbours = [];
    }

    addNeighbour(cell) {
        this.neighbours.push(cell);
    }

    calcNextState() {
        // TODO: Implement
    }

    draw() {
        this.current = this.next;
        stroke(0);
        if (this.current == true) {
            fill(0);
        } else {
            fill(255);
        }
        rect(this.x, this.y, cell_size, cell_size);
    }

}
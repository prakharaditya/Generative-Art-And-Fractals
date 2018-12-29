let Spacing = 50;
let S1 = Spacing;
let S2 = Spacing * 2;

let WIDTH = 1200;
let HEIGHT = 800;

let colour_array = ['#9AB8B9', '#556F90', '#1E4D6C', '#2B394B', '#2B394B'];
let colour_index_limit = colour_array.length;

function getColour() {
    return colour_array[int(random(0, colour_index_limit))];
}


function setup() {
    createCanvas(1200, 800);
    frameRate(1);
}

function draw() {
    background(255);
    noStroke();

    for (let X_ = 0; X_ < WIDTH; X_ = X_ + 100) {
        for (let Y_ = 0; Y_ < HEIGHT; Y_ = Y_ + 100) {
        fill(getColour());
        triangle(X_, Y_, X_, Y_ + S1, X_ + S1, Y_ + S1);
        fill(getColour());
        triangle(X_, Y_, X_ + S1, Y_, X_ + S1, Y_ + S1);

        fill(getColour());
        triangle(X_ + S1, Y_ + S1, X_ + S1, Y_ + S2, X_ + S2, Y_ + S2);
        fill(getColour());
        triangle(X_ + S1, Y_ + S1, X_ + S2, Y_ + 50, X_ + S2, Y_ + S2);

        fill(getColour());
        triangle(X_ + S1, Y_ + S1, X_ + S2, Y_ + S1, X_ + S2, Y_);
        fill(getColour());
        triangle(X_ + S1, Y_ + S1, X_ + S1, Y_, X_ + S2, Y_);

        fill(getColour());
        triangle(X_, Y_ + S2, X_ + S1, Y_ + S2, X_ + S1, Y_ + S1);
        fill(getColour());
        triangle(X_, Y_ + S2, X_, Y_ + S1, X_ + S1, Y_ + S1);
        }
    }
}
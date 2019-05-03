// Uses Depth First Search
import java.util.Stack;

int rows; 
int cols;

int cell_size = 5;

ArrayList<Cell> cells;
Cell current;
Stack<Cell> stack;

void setup() {
  size(400, 400);
  rows = width / cell_size;
  cols = height / cell_size;
  cells = new ArrayList<Cell>();
  stack = new Stack<Cell>();

  for (int j = 0; j < rows; ++j) {
    for (int i = 0; i < cols; ++i) {
      cells.add(new Cell(i, j));
    }
  }

  current = cells.get(0);
}

void draw() {
  background(51);

  for (Cell c : cells) {
    c.draw();
  }

  current.visited = true;
  current.highlight();
  Cell next = current.checkNeighbours();
  if (next != null) {
    next.visited = true;
    stack.push(current);
    removeWalls(current, next);    
    current = next;
  } else if (stack.size() > 0) {
     current = stack.pop();
  }
}

class Cell {
  public int i;
  public int j;
  public boolean[] walls;
  public boolean visited;

  public Cell(int _i, int _j) {
    i = _i;
    j = _j;
    visited = false;
    walls = new boolean[]{true, true, true, true};
  }

  public void draw() {
    stroke(255);
    noFill();
    int x = i * cell_size;
    int y = j * cell_size;
    if (walls[0]) line(x, y, x + cell_size, y);
    if (walls[1]) line(x + cell_size, y, x + cell_size, y + cell_size);
    if (walls[2]) line(x + cell_size, y + cell_size, x, y + cell_size);
    if (walls[3]) line(x, y + cell_size, x, y);

    if (visited) {
      fill(255, 0, 255, 100);
      noStroke();
      rect(x, y, cell_size, cell_size);
    }
  }

  public Cell checkNeighbours() {
    ArrayList<Cell> n = new ArrayList<Cell>();
    if (j > 1) { 
      Cell top = cells.get(i + (j - 1) * cols);
      if (!top.visited) { 
        n.add(top);
      };
    }

    if (i < cols - 1) { 
      Cell right = cells.get((i + 1) + j * cols);
      if (!right.visited) { 
        n.add(right);
      };
    }

    if (j < rows - 1) {
      Cell bottom = cells.get(i + (j + 1) * cols);
      if (!bottom.visited) { 
        n.add(bottom);
      };
    }

    if (i > 1) { 
      Cell left = cells.get((i - 1) + j * cols);
      if (!left.visited) { 
        n.add(left);
      };
    }

    if (n.size() > 0) {
      int random = (int)random(0, n.size());
      return n.get(random);
    } else {
      return null;
    }
  }

  public void highlight() {
    int x = i * cell_size;
    int y = j * cell_size;
    fill(0, 0, 255, 100);
    noStroke();
    rect(x, y, cell_size, cell_size);
  }
}

public void removeWalls(Cell a, Cell b) {
  int x = a.i - b.i;
  if (x == 1) {
    a.walls[3] = false;
    b.walls[1] = false;
  } else if (x == -1) {
    a.walls[1] = false;
    b.walls[3] = false;
  }

  int y= a.j - b.j;
  if (y == 1) {
    a.walls[0] = false;
    b.walls[2] = false;
  } else if (y == -1) {
    a.walls[2] = false;
    b.walls[0] = false;
  }
}

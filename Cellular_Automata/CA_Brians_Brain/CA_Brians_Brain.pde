Cell[][] cells;
int cell_size = 10;
int row, col;

void setup()
{ 
    size(500, 300);
    row = floor(width/cell_size);
    col = floor(height/cell_size);
    reset();
} 

void reset()
{
    cells = new Cell[row][col];
    
    for (int x = 0; x < row; x++)
    {
        for (int y = 0; y < col; y++)
        {  
        Cell c = new Cell(x, y);  
        cells[x][y] = c;     
        }        
    }          

    
    for (int x = 0; x < row; x++)
    {
        for (int y = 0; y < col; y++)
        {  
        int above = y-1;    
        int below = y+1;    
        int left = x-1;      
        int right = x+1;      
        
        if (above < 0)    { above = col-1;  }  
        if (below == col) { below = 0;      }  
        if (left < 0)     { left = row-1;   }  
        if (right == row) { right = 0;      }  

        cells[x][y].addNeighbour(cells[left][above]   );  
        cells[x][y].addNeighbour(cells[left][y]       );    
        cells[x][y].addNeighbour(cells[left][below]   );  
        cells[x][y].addNeighbour(cells[x][below]      );  
        cells[x][y].addNeighbour(cells[right][below]  );  
        cells[x][y].addNeighbour(cells[right][y]      );  
        cells[x][y].addNeighbour(cells[right][above]  );  
        cells[x][y].addNeighbour(cells[x][above]      );    
        }
    }
}

void draw()
{
    background(200);
                        
    for (int x = 0; x < row; x++)
    {
        for (int y = 0; y < col; y++)
        {
        cells[x][y].calcNextState();
        }
    }
                            
    translate(cell_size/2, cell_size/2);    
                            
    for (int x = 0; x < row; x++)
    {
        for (int y = 0; y < col; y++)
        {
        cells[x][y].draw();
        }
    }
}

void mousePressed()
{
    reset();
}

class Cell
{
    float x, y;
    int current;
    int next;  
    Cell[] neighbours;
    
    Cell(float ex, float why)
    {
        x = ex * cell_size;
        y = why * cell_size;
        if (random(2) > 1)
        {  
        next = 1;
        }
        else
        {
        next = 0; 
        }
        current = next;
        neighbours = new Cell[0];
    }

    void addNeighbour(Cell cell)
    {
        neighbours = (Cell[])append(neighbours, cell); 
    }
    
    void calcNextState()
    {
        if (current == 0)
        {    
            int firingCount = 0;
            for (int i=0; i < neighbours.length; i++)
            {
                if (neighbours[i].current == 1)
                {    
                    firingCount++;
                }
            }
            if (firingCount == 2)
            {     
                next = 1;    
            } 
            else
            {
                next = current;    
            }
        }
        else if (current == 1)
        {     
            next = 2;
        }
        else if (current == 2)
        {     
            next = 0;
        }  
    }
    
    void draw() {
        current = next;
        stroke(0);
        if (current == 1)
        {
            fill(0);
        }
        else
        {
            fill(255);
        }
        rect(x, y, cell_size, cell_size);
    }
    
}
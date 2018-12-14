Cell[][] cells;
int cell_size = 5;
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

void mouseMoved() {
    //restart();
    int x = floor(mouseX/cell_size);
    int y = floor(mouseY/cell_size);
    
    int above = y-1;    
    int below = y+1;    
    int left = x-1;      
    int right = x+1;      
    
    if (above < 0)    { above = col-1;  }  
    if (below == col) { below = 0;      }  
    if (left < 0)     { left = row-1;   }  
    if (right == row) { right = 0;      }  
    
    cells[x][y].current = 255;
    cells[right][y].current = 255;
    cells[left][y].current = 255;
    cells[x][below].current = 255;
    cells[x][above].current = 255;
}

class Cell
{
    float x, y;
    float current;
    float next;
    float previous = 0; 
    Cell[] neighbours;
    
    Cell(float ex, float why)
    {
        x = ex * cell_size;
        y = why * cell_size;
        next = ((x / 500) + (y / 300)) * 14;  
        current = next;
        neighbours = new Cell[0];
    }

    void addNeighbour(Cell cell)
    {
        neighbours = (Cell[])append(neighbours, cell); 
    }
    
    void calcNextState()
    {
        float total = 0;        
        for (int i=0; i < neighbours.length; i++)
        {  
            total += neighbours[i].current;    
        }

        float average = int(total/8);
                    
        if (average == 255)
        {
            next = 0;
        }
        else if (average == 0)
        {
            next = 255;
        }
        else
        {
            next = current + average;
            if (previous > 0) { next -= previous; }   
            if (next > 255) { next = 255; }
            else if (next < 0) { next = 0; }
        }
    
        previous = current;  
    }
    
    void draw() {
    current = next;
    stroke(0);
    fill(current);    
    rect(x, y, cell_size, cell_size);
    }
    

}
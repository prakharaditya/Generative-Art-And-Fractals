int size = 2;
final int OUTER_PADDING = 20;

int [][] array;
int [] walkerPosition;

int[][] slotsFree;
int slotsIndex;

int w_;
int h_;

void setup()
{
    size(800, 800);
    w_ = (width - (2 * OUTER_PADDING)) / size;
    h_ = (height - (2 * OUTER_PADDING)) / size;
        
    array = new int [h_][w_];
    walkerPosition = new int[2];
        
    slotsFree = new int[h_ * w_ * 4][2];
    slotsIndex = 0;
        
    slotsFree[0][0] = array.length / 2;
    slotsFree[0][1] = array[walkerPosition[0]].length / 2;
    background(255);
}

void draw()
{
    boolean proceed = false;
    int a = 0;
    int x = 0;
    int y = 0;
    
    while(!proceed)
    {
        a = (int)random(0, slotsIndex);
        
        x = slotsFree[a][0];
        y = slotsFree[a][1];
        
        if (array[x][y] == 0) proceed = true;    
    }
    
    array[x][y] = 1;
    
    if (!(x + 1 < w_)) x--;
    if (!(y + 1 < h_)) y--;
    if (!(x - 1 > 0)) x = 1;
    if (!(y - 1 > 0)) y = 1;

        if (array[x - 1][y    ] == 0)
        {
        int[] z = {x - 1, y};
        slotsFree[slotsIndex] = z;
        slotsIndex++;
        }
        
        if (array[x    ][y - 1] == 0)
        {
        int[] b = {x, y - 1};
        slotsFree[slotsIndex] = b;
        slotsIndex++;
        }
        
        if (array[x + 1][y    ] == 0)
        {
        int[] c = {x + 1, y};
        slotsFree[slotsIndex] = c;
        slotsIndex++;
        }
        
        if (array[x    ][y + 1] == 0)
        {
        int[] d = {x, y + 1};
        slotsFree[slotsIndex] = d;
        slotsIndex++;
    }
    drawGrid();
}

public void drawGrid()
{
    for (int i = 0; i < array.length; i++)
    {
        for (int j = 0; j < array[i].length; j++)
        {
        int x_ = OUTER_PADDING + (j * size);
        int y_ = OUTER_PADDING + (i * size);

        if(array[i][j] == 1)
        {
            int r, g, b;
            
            if (j > array[i].length / 2)
            {
            r = (int)map(j, array[i].length / 2, array[i].length, 255 / 2, 0);
            }
            else
            {
            r = (int)map(j, 0, array[i].length / 2, 0, 255 / 2);
            }
            
            if (i > array.length / 2)
            {
            b = (int)map(i, array.length / 2, array.length, 255 / 2, 0);
            }
            else
            {
            b = (int)map(i, 0, array.length / 2, 0, 255 / 2);
            }
            
            g = 0;
            fill(r, g, b);
        }
        else
        {
            noFill();
        }      
        noStroke();
        rect(x_, y_, size, size);      
        }
    }
}
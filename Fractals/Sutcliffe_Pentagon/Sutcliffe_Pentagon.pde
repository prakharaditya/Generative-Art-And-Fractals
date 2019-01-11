Sutcliffe p; 
int level_max = 6;
float _strutFactor = 0.2;
int size = 450;

void setup()
{
    size(1000, 1000); 
    smooth();
    noLoop();
}

void draw()
{
    translate(width / 2, height / 2);
    background(255);
    //size++;
    p = new Sutcliffe();
}

class Sutcliffe
{            
    PVector[] pointArr = new PVector[5];      
    Segment root;          
                    
    Sutcliffe()
    {                       
        int step = 360 / 5;
        
        for (int i = -18, j = 0; i < 360 - 18; i += step, j++)
        { 
            pointArr[j] = new PVector(size * cos(radians(i)), size * sin(radians(i)));      
        }
        
        root = new Segment(0, 0, pointArr);
        root.draw();
    }                      
}            

class Segment
{      
    int level, num;        
    PVector[] oPoints = {};
    PVector[] mPoints = {};  
    PVector[] pPoints = {};
    Segment[] children = {};
    
    Segment(int lev, int n, PVector[] points)
    {  
        level = lev;        
        num = n;          
        
        oPoints = points;
        mPoints = calculateMids();
        pPoints = calculateStruts();
        
        if ((level + 1) < level_max)
        {
        Segment child = new Segment(level + 1, 0, pPoints);
        children = (Segment[])append(children, child);
        
        for (int i = 0; i < oPoints.length; i++)
        {
            int next = i - 1;
            if (next < 0) { next += oPoints.length; }
            
            PVector[] newPoints = { pPoints[i], mPoints[i],
            oPoints[i], mPoints[next], pPoints[next] };
            
            child = new Segment(level + 1, i + 1, newPoints);
            children = (Segment[])append(children, child);
        } 
        }    
    }      
    
    PVector[] calculateMids()
    {
        PVector[] mid_points = new PVector[oPoints.length];
        
        for (int i = 0; i < oPoints.length; i++)
        {      
        int next = i + 1;            
        if (next == oPoints.length) { next = 0; }

        mid_points[i] = calcMidPoint(oPoints[i], oPoints[next]);;            
        }
        
        return mid_points;            
    }              
        
    PVector calcMidPoint(PVector end1, PVector end2)
    {    
        PVector m = new PVector(0, 0); 
        
        if (end1.x > end2.x) m.x = end2.x + ((end1.x - end2.x)/2);        
        else m.x = end1.x + ((end2.x - end1.x)/2);    
        
        if (end1.y > end2.y) m.y = end2.y + ((end1.y - end2.y)/2);      
        else m.y = end1.y + ((end2.y - end1.y)/2);    
            
        return m;     
    }
    
    PVector[] calculateStruts()
    {
        PVector[] strutArray = new PVector[mPoints.length];
        for (int i = 0; i < mPoints.length; i++)
        {
        int nexti = i+3;
        if (nexti >= mPoints.length) { nexti -= mPoints.length; }
        
        PVector thisSP = calcProjPoint(mPoints[i], oPoints[nexti]); 
        strutArray[i] = thisSP;
        } 
        return strutArray;
    }
        
    PVector calcProjPoint(PVector mp, PVector op)
    {
        PVector p = new PVector(0, 0);
        float adj, opp;
        
        if (op.x > mp.x) opp = op.x - mp.x;  
        else opp = mp.x - op.x;   
        
        if (op.y > mp.y) adj = op.y - mp.y;
        else adj = mp.y - op.y;
        
        if (op.x > mp.x)p.x = mp.x + (opp * _strutFactor);
        else p.x = mp.x - (opp * _strutFactor); 
        
        if (op.y > mp.y) p.y = mp.y + (adj * _strutFactor);  
        else p.y = mp.y - (adj * _strutFactor);
        
        return p;  
    }
        
    
    void draw()
    {
        strokeWeight(5 - level);
        for (int i = 0; i < oPoints.length; i++)
        {
        int next = i + 1;          
        if (next == oPoints.length) { next = 0; }  
        line(oPoints[i].x, oPoints[i].y, oPoints[next].x, oPoints[next].y);  
        }   

        strokeWeight(0.5);
        fill(255, 150);
        for (int k = 0; k < children.length; k++)
        {
        children[k].draw();
        } 
    }
}
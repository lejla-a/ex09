part of jeu_de_rectangles;

class Sortie 
{
    static const num RADIUS = 40;
  
    num posX;
    num posY;
    num height;
    num width;
  
    String label = 'Sortie';
  
    CanvasElement canvas;
    CanvasRenderingContext2D context;
    num fontSize = 12;
  
    Sortie(this.canvas) 
    {
        context = canvas.getContext('2d');
        height = 50;
        width = 100;
    
        this.setSortiePosX(randomNum(canvas.width - width));
        this.setSortiePosY(randomNum(canvas.height - height));
    }
  
    draw() 
    {
        context
          ..beginPath()      
          ..rect(this.getSortiePosX(), this.getSortiePosY(), width, height)
          ..fillStyle = '#000000'
          ..fill()
          ..strokeStyle = '#000000'
          ..lineWidth = 0
          ..stroke()
          ..closePath();    
       // label
        context
          ..beginPath()
          ..font = 'bold ${fontSize}px sans-serif'
          ..textAlign = 'start'
          ..textBaseline = 'top'
          ..fillText(label, this.getSortiePosX(), this.getSortiePosY())
          ..closePath();
    }
    
    void setSortiePosX(num pPosX)
    {
        this.posX = pPosX;
    }
        
    void setSortiePosY(num pPosY)
    {
        this.posY = pPosY;
    }
    
    num getSortiePosX()
    {
        return this.posX;
    }
    
    num getSortiePosY()
    {
        return this.posY;
    }
    
    num getSortieHeight()
    {
        return this.height;
    }
        
    num getSortieWidth()
    {
        return this.width;
    }
}
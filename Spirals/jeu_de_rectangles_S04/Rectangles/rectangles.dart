part of jeu_de_rectangles;

abstract class Rectangles 
{
    static const num RECT_WIDTH = 90;
    static const num RECT_HEIGHT = 36;
    
    num rectPosX;
    num rectPosY;
    num width;
    num height;
  
    num rectWidth;
    num rectHeight;
    
    num vitesseX;
    num vitesseY;
    
    String colorCode;
    String label = '';
  
    CanvasElement canvas;
    CanvasRenderingContext2D context;
    num fontSize = 12;
  
    
    Rectangles(this.canvas) 
    {
        context = canvas.getContext('2d');
    
        width = 75;
        height = 30;
        var diagramWidth = canvas.width.toDouble();
        var diagramHeight = canvas.height.toDouble();
        this.rectPosX = randomNum(diagramWidth - width);
        this.rectPosY = randomNum(diagramHeight - height);
    
        colorCode = randomColorCode();
        
        this.setRectWidth(RECT_WIDTH);
        this.setRectHeight(RECT_HEIGHT);
    }
  
    void draw() 
    {
        this.context
          ..beginPath()
          ..fillStyle = colorCode
          ..rect(this.getRectPosX(), this.getRectPosY(), getRectWidth(), getRectHeight())
          ..strokeStyle = 'black'
          ..lineWidth = 2;
        this.context
          ..fill()
          ..stroke()
          ..closePath();
       // label
        this.context
          ..beginPath()
          ..font = 'bold ${fontSize}px sans-serif'
          ..textAlign = 'start'
          ..textBaseline = 'top'
          ..fillText(label, this.getRectPosX() + 4, this.getRectPosY() + 4, width - label.length - 4)
          ..closePath();
    }
    
    void setRectWidth(num pWidth)
    {
        if(pWidth > 0)
        {
            this.rectWidth = pWidth;
        }
    }
    
    void setRectHeight(num pHeight)
    {
        if(pHeight > 0)
        {
            this.rectHeight = pHeight;
        }
    }
    
    num getRectWidth()
    {
        return this.rectWidth;
    }
    
    num getRectHeight()
    {
        return this.rectHeight;
    }
    
    void setRectPosX(num pPosX)
    {
        //if(!this.validerPosX())
            this.rectPosX = pPosX;
    }
    
    void setRectPosY(num pPosY)
    {
        //if(!this.validerPosY())
            this.rectPosY = pPosY;
    }
    
    num getRectPosX()
    {
        return this.rectPosX;
    }
    
    num getRectPosY()
    {
        return this.rectPosY;
    }
    
    bool validerPosX()
    {
        return (this.getRectPosX() > canvas.width - this.getRectWidth() || this.getRectPosX() < 0);
    }
    
    bool validerPosY()
    {
        return (this.getRectPosY() > canvas.height - this.getRectHeight() || this.getRectPosY() < 0);
    }
    
    void setVitesseX(num pVitesseX)
    {
        this.vitesseX = pVitesseX;
    }
    
    void setVitesseY(num pVitesseY)
    {
        this.vitesseY = pVitesseY;
    }
    
    num getVitesseX()
    {
        return this.vitesseX;
    }
        
    num getVitesseY()
    {
        return this.vitesseY;
    }
}

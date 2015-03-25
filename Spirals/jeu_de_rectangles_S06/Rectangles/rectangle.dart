part of jeu_de_rectangles;

class Rectangle extends Rectangles 
{  
    num dx;
    num dy;
  
    Rectangle(canvas, speedLimit) : super(canvas) 
    {
        var speedNumber = int.parse(speedLimit);
        this.setVitesseX(randomNum(speedNumber));
        this.setVitesseY(randomNum(speedNumber));
    }
  
    move(RectangleRouge rectRouge, List<Rectangle> rectangles) 
    {       
        this.setRectPosX(this.getRectPosX() + this.getVitesseX());
        this.setRectPosY(this.getRectPosY() + this.getVitesseY());
        
        if (rectRouge.big) 
        {
            rectRouge.collision(this);
        }
        
        for (Rectangle rectangle in rectangles) 
        {
            if (rectangle != this) 
            {
                rectangle.collision(this);
            }
        }
        
        if (this.validerPosX()) 
            this.setVitesseX(-this.getVitesseX());
        if (this.validerPosY()) 
            this.setVitesseY(-this.getVitesseY());
    }
  
    collision(Rectangle rectangle) 
    {
        if (rectangle.getRectPosX() < this.getRectPosX() && rectangle.getRectPosY() < this.getRectPosY()) 
        {
            if (rectangle.getRectPosX() + rectangle.width >= this.getRectPosX() && rectangle.getRectPosY() + rectangle.getRectHeight() >= this.getRectPosY()) 
            {
                this.setVitesseX(-this.getVitesseX()); 
                this.setVitesseY(-this.getVitesseY());
                rectangle.setVitesseX(-rectangle.getVitesseX()); 
                rectangle.setVitesseY(-rectangle.getVitesseY());
            }
        } 
        else if (rectangle.getRectPosX() > this.getRectPosX()  && rectangle.getRectPosY() < this.getRectPosY()) 
        {
            if (rectangle.getRectPosX() <= this.getRectPosX() + this.getRectWidth() && rectangle.getRectPosY() + rectangle.getRectHeight() >= this.getRectPosY()) 
            {
                this.setVitesseX(-this.getVitesseX());  
                this.setVitesseY(-this.getVitesseY());
                rectangle.setVitesseX(-rectangle.getVitesseX());  
                rectangle.setVitesseY(-rectangle.getVitesseY());
            }
        } 
        else if (rectangle.getRectPosX() < this.getRectPosX()  && rectangle.getRectPosY() > this.getRectPosY()) 
        {
            if (rectangle.getRectPosX() + rectangle.getRectWidth() >= this.getRectPosX() && rectangle.getRectPosY() <= this.getRectPosY() + this.getRectHeight()) 
            {
                this.setVitesseX(-this.getVitesseX()); 
                this.setVitesseY(-this.getVitesseY());
                rectangle.setVitesseX(-rectangle.getVitesseX()); 
                rectangle.setVitesseY(-rectangle.getVitesseY());
            }
        } 
        else if (rectangle.getRectPosX() > this.getRectPosX()  && rectangle.getRectPosY() > this.getRectPosY()) 
        {
            if (rectangle.getRectPosX() <= this.getRectPosX() + this.getRectWidth() && rectangle.getRectPosY() <= this.getRectPosY() + this.getRectHeight()) 
            {
                this.setVitesseX(-this.getVitesseX());  
                this.setVitesseY(-this.getVitesseY());
                rectangle.setVitesseX(-rectangle.getVitesseX()); 
                rectangle.setVitesseY(-rectangle.getVitesseY());
            }
        }
    }
}
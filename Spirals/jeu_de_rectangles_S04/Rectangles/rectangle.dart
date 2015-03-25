part of jeu_de_rectangles;

class Rectangle extends Rectangles 
{  
    num dx;
    num dy;
  
    Rectangle(canvas) : super(canvas) 
    {
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
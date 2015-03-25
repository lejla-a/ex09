part of jeu_de_rectangles;

class RectangleRouge extends Rectangles 
{
    static const num bigWidth = 90;
    static const num bigHeight = 36;
    static const String bigColorCode = '#FF0000';
  
    static const num smallWidth = 35;
    static const num smallHeight = 14;
    static const String smallColorCode = '#000000';
  
    num collisionCount = 0;
    
    bool small = false;
    bool get big => !small;
    bool movable = false;
  
    RectangleRouge(canvas) : super(canvas) 
    {
        colorCode = bigColorCode;
        width = bigWidth;
        height = bigHeight;
        
        document.onMouseDown.listen((MouseEvent e) 
        {
            movable = !movable;
            
            if (small) 
            {
                bigger();
            }
        });
        
        document.onMouseMove.listen((MouseEvent e) 
        {
            if (movable) 
            {
                this.setRectPosX(e.offset.x - bigWidth / 2);
                this.setRectPosY(e.offset.y - bigHeight / 2);
                
                if (this.getRectPosX() + this.getRectWidth() > canvas.width) 
                {
                    this.setRectPosX(canvas.width - this.getRectWidth());
                }
                
                if (this.getRectPosX() < 0) 
                {
                    this.setRectPosX(0);
                }
                
                if (this.getRectPosY() + this.getRectHeight() > canvas.height) 
                {
                    this.setRectPosY(canvas.height - this.getRectHeight());
                }
                
                if (this.getRectPosY() < 0) 
                {
                    this.setRectPosY(0);
                }
             }
        });
    }
    
    bigger() 
    {
        if (small) 
        {
            small = false;
            colorCode = bigColorCode;
            this.setRectWidth(bigWidth);
            this.setRectHeight(bigHeight);
            movable = true;
        }
    }
  
    smaller(Rectangle rectangle) 
    {
        if (big) 
        {
            small = true;
            colorCode = smallColorCode;
            this.setRectWidth(smallWidth);
            this.setRectHeight(smallHeight);
            collisionCount++;
            movable = false;
        }
    }
    
    bool validerSortie(Sortie sortie)
    {      
        return (this.getRectPosX() + this.getRectWidth() < sortie.getSortiePosX() + sortie.getSortieWidth() && this.getRectPosX() >= sortie.getSortiePosX() &&
                this.getRectPosY() + this.getRectHeight() < sortie.getSortiePosY() + sortie.getSortieHeight() && this.getRectPosY() >= sortie.getSortiePosY());
    }
    
    collision(Rectangle rectangle) 
    {        
        if (big) 
        {
            if (rectangle.getRectPosX() < this.getRectPosX()  && rectangle.getRectPosY() < this.getRectPosY()) 
            {
                if (rectangle.getRectPosX() + rectangle.getRectWidth() >= this.getRectPosX() && rectangle.getRectPosY() + getRectHeight() >= this.getRectPosY()) 
                {
                    smaller(rectangle);
                }
            } 
            else if (rectangle.getRectPosX() > this.getRectPosX()  && rectangle.getRectPosY() < this.getRectPosY()) 
            {
                if (rectangle.getRectPosX() <= this.getRectPosX() + this.getRectWidth() && rectangle.getRectPosY() + rectangle.getRectHeight() >= this.getRectPosY()) 
                {
                    smaller(rectangle);
                }
            } 
            else if (rectangle.getRectPosX() < this.getRectPosX()  && rectangle.getRectPosY() > this.getRectPosY()) 
            {
                if (rectangle.getRectPosX() +  rectangle.getRectWidth() >= this.getRectPosX() && rectangle.getRectPosY() <= this.getRectPosY() + this.getRectHeight()) 
                {
                    smaller(rectangle);
                }
            } 
            else if (rectangle.getRectPosX() > this.getRectPosX()  && rectangle.getRectPosY() > this.getRectPosY()) 
            {
                if (rectangle.getRectPosX() <= this.getRectPosX() + this.getRectWidth() && rectangle.getRectPosY() <= this.getRectPosY() + this.getRectHeight()) 
                {
                    smaller(rectangle);
                }
            }
            
        }
    }
}
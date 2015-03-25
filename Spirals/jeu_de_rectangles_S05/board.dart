part of jeu_de_rectangles;

class Board 
{  
    CanvasElement canvas = querySelector('#canvas');
    
    List<Rectangle> rectangles;
    var rectangleRouge;
    bool stopped = true;
    num nbRectangles;
    num niveau = 1;
  
    Board() 
    {
        start_restart();
        
        LabelElement timeLabel = querySelector('#time');
        LabelElement msgLabel = querySelector('#msg');
        LabelElement niveauLabel = querySelector('#niveau');
        msgLabel.text = '';
        niveauLabel.text = niveau.toString();
        
        CanvasElement pauseButton = querySelector('canvas');
        
        pauseButton.onClick.listen((MouseEvent e) 
        {
            if (stopped) 
            {
                stopped = false;
                rectangleRouge.movable = true;
                msgLabel.text = '';
            } 
            else 
            {
                stopped = true;
                rectangleRouge.movable = false;
            }
        });
        
        new Timer.periodic(const Duration(milliseconds: 1000), (t) 
        {
            if (!stopped && rectangleRouge.big) 
            {
                var collisionCount = rectangleRouge.collisionCount;
                
                var minutes = 0;                
            }
        });
  
        window.animationFrame.then(gameLoop);
    }
  
    gameLoop(num delta) 
    {
        stopped ? null : displayRectangles();
        window.animationFrame.then(gameLoop);
    }
  
    start_restart()
    {        
        rectangleRouge = new RectangleRouge(canvas);
        rectangles = new List();        
        
        nbRectangles = randomNum(10);
        
        stopped = true;
        rectangleRouge.movable = false;
        
        for (var i = 0; i < nbRectangles; i++)
        {
            var rectangle = new Rectangle(canvas);
            rectangles.add(rectangle);
        }
        
        displayRectangles();      
    }
    
    
    displayRectangles() 
    {
        clear() 
        {
            CanvasRenderingContext2D context = canvas.getContext('2d');
            context.fillStyle = "#ffffff";
            context.fillRect(0, 0, context.canvas.width, context.canvas.height);
        }
  
        clear();
        
        rectangleRouge.draw();
        
        for (var i = 0; i < rectangles.length; i++) 
        {
            rectangles[i].move(rectangleRouge, rectangles);
            rectangles[i].draw();
        }
  
  
      if (rectangleRouge.collisionCount > 0) 
      {
          num remainder = rectangleRouge.collisionCount % 6;
          
          if (remainder == 0) 
          {
              
              var rectangle = new Rectangle(canvas);
              
              if (rectangle.dx > 0) 
              {
                  rectangle.dx++;
              } 
              else 
              {
                  rectangle.dx--;
              }
              if (rectangle.dy > 0) 
              {
                  rectangle.dy++;
              } 
              else 
              {
                  rectangle.dy--;
              }
          }
      }
    }
}

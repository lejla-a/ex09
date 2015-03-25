part of jeu_de_rectangles;

class Board 
{  
    CanvasElement canvas = querySelector('#canvas');
    
    List<Rectangle> rectangles;
    var rectangleRouge;
    var score = new Score();
    bool stopped = true;
    num nbRectangles;
    num niveau = 1;
  
    Board() 
    {
        var bestScore = new Score();
        var bestScoreSection = new BestScoreSection(bestScore);
        
        if (bestScore.load()) 
        {
            bestScoreSection.display();
        }
    
        start_restart();
    
        SelectElement speedLimitInput = querySelector('#speed-limit');
        speedLimitInput.value = score.currentSpeedLimit;
        
        speedLimitInput.onInput.listen((Event e) 
        {
            
            score.currentSpeedLimit = speedLimitInput.value;
            bestScore.currentSpeedLimit = speedLimitInput.value; 
            bestScore.load();
            bestScoreSection.display();
            rectangleRouge.collisionCount = 0;
            rectangleRouge.movable = false;
            
            for (Rectangle rectangle in rectangles) 
            {
                rectangle.dx = randomNum(num.parse(speedLimitInput.value));
                rectangle.dy = randomNum(num.parse(speedLimitInput.value));
            }
        });
        
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
                bestScoreSection.display();
                rectangleRouge.movable = false;
            }
        });
        
        new Timer.periodic(const Duration(milliseconds: 1000), (t) 
        {
            if (!stopped && rectangleRouge.big) 
            {
              
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
            var rectangle = new Rectangle(canvas, score.currentSpeedLimit);
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
  
  
      if (rectangleRouge.collisionCount > 0 && rectangleRouge.collisionCount != score.collisionCount) 
      {
          num remainder = rectangleRouge.collisionCount % 6;
          
          if (remainder == 0) 
          {
              var random = randomNum(score.currentTimeLimit * 60).round();
              
              if (random != 13.0 && random != score.seconds) 
              {
                  score.update(rectangleRouge.collisionCount, score.minutes, score.seconds, rectangles.length, niveau);
              }
              
              var rectangle = new Rectangle(canvas, score.currentSpeedLimit);
              
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

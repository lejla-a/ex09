part of jeu_de_rectangles;

class Board 
{  
    CanvasElement canvas = querySelector('#canvas');
    
    List<Rectangle> rectangles;
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
                msgLabel.text = '';
            } 
            else 
            {
                stopped = true;
            }
        });
        
        new Timer.periodic(const Duration(milliseconds: 1000), (t) 
        {
            
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
        rectangles = new List();        
        
        nbRectangles = randomNum(10);
        
        stopped = true;
        
        for (var i = 0; i < nbRectangles; i++)
        {
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
    }
}

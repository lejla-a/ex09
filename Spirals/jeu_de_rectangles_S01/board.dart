part of jeu_de_rectangles;

class Board 
{  
    CanvasElement canvas = querySelector('#canvas');
  
    Board() 
    { 
        
        LabelElement timeLabel = querySelector('#time');
        LabelElement msgLabel = querySelector('#msg');
        LabelElement niveauLabel = querySelector('#niveau');
       
        
        new Timer.periodic(const Duration(milliseconds: 1000), (t) 
        {
            
        });
    }
}

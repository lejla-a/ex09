part of jeu_de_rectangles;

class BestScoreSection 
{
    LabelElement bestTimeLabel = querySelector('#best-time');  
    Score bestScore;  
    BestScoreSection(this.bestScore);
  
    display() 
    {
        bestTimeLabel.text = '${bestScore.seconds}';
    }
}


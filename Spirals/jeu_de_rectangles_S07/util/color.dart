part of jeu_de_rectangles;

Map<String, String> colorMap() 
{
    return 
    {
      'turquoise':  '#40E0D0',
      'azure':      '#f0ffff',
      'beige':      '#f5f5dc',
      'blue':       '#0000ff',
      'gray':       '#909090',
      'white':      '#ffffff',
      'yellow':     '#ffff00'
    };
}

List<String> colorList() 
{
  return 
  [
      'turquoise',
      'azure',
      'beige',
      'blue',
      'gray',
      'white',
      'yellow'
  ];
}

String randomColor() => randomListElement(colorList());

String randomColorCode() => colorMap()[randomColor()];

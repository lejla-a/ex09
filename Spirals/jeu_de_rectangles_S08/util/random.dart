part of jeu_de_rectangles;

num randomNum(num max) 
{
    num random = new Random().nextDouble() * max;
    return random > max ? max : random;
}

int randomInt(int max) => new Random().nextInt(max);

randomListElement(List list) => list[randomInt(list.length - 1)];

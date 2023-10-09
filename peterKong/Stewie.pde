class Stewie
{
  public float stewieX, stewieY;
  public float stewieSize;
  public float stewieXspd, stewieYspd;
  boolean jumped;
  boolean moveLeft;
  boolean moveDown;
  boolean moveRight;
  PImage stewie;
  
  public Stewie()
  {
    stewieX = width/2;
    stewieY = 200;
    stewieXspd = 0;
    stewieYspd = 0;
    stewieSize = 100;
    jumped = false;
    moveLeft = false;
    moveRight = false;
    moveDown = false;
    
    stewie = loadImage("stewieGriffin.png");
    stewie.resize(int(stewieSize),0);
  }
  
  void drawStewie()
  {
    image(stewie, stewieX, stewieY);
  }
}

class Stewie
{
  public float stewieX, stewieY;
  public float stewieSize;
  public float stewieXspd, stewieYspd;
  boolean jumped;
  boolean moveLeft;
  boolean moveDown;
  boolean moveRight;
  
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
  }
  
  void drawStewie()
  {
    circle(stewieSize, stewieX, stewieY);
  }
}

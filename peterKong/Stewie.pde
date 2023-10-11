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
  
  void moveStewie()
  {
    stewieY += stewieYspd;
    stewieX += stewieXspd;
    stewieYspd += 0.7; //gravity
    stewieXspd *= 0.95;
    
    //checking collision on the floor
    if( stewieY >= height-(stewieSize/2) )
    {
      stewieYspd = 0;
      jumped = false;
    }
    
    //check collision on the right wall
    if( stewieX >= width-(stewieSize/2) )
    {
      stewieXspd = 0;
    }
    
    //check collision on the left wall
    if( stewieX <= stewieSize/2 )
    {
      stewieXspd = 0;
    }
  }
}

class Stewie
{
  public float stewieX, stewieY;
  public float stewieSize;
  public float tricycleX, tricycleY;
  public float tricycleSize;
  public float stewieXspd, stewieYspd;
  boolean jumped;
  boolean moveLeft;
  boolean moveDown;
  boolean moveRight;
  PImage stewie;
  PImage tricycle;
  
  public Stewie()
  {
    //setting initial values
    stewieX = width/2;
    stewieY = 200;
    tricycleX = width/2;
    tricycleY = 200;
    stewieXspd = 0;
    stewieYspd = 0;
    stewieSize = 100;
    tricycleSize = 80;
    jumped = false;
    moveLeft = false;
    moveRight = false;
    moveDown = false;
    
    //loading the image and resizing the image
    stewie = loadImage("stewieGriffin.png");
    stewie.resize(int(stewieSize),0);
    
    tricycle = loadImage("tricycle.png");
    tricycle.resize(int(tricycleSize),0);
  }
  
  void drawStewie()
  {
    //this draws the image
    image(stewie, stewieX, stewieY);
  }
  
  void moveStewie()
  {
    stewieY += stewieYspd;
    stewieYspd += 0.7; //gravity
    
    for( Platform P: plats )
    {
      //checks for collision on the top of the platform
      if( bottom() > P.top() && bottom() <= P.yMiddle() && stewieX >= P.left() && stewieX <=  P.right() )
      {
        stewieYspd = 0;
        stewieY = P.top()-stewieSize/2;
        jumped = false;
      }
    }
  }
  
  void drawTricycle()
  {
    image(tricycle, tricycleX, tricycleY);
  }
  
  
  public float top()   { return stewieY-stewieSize/2; }
  public float bottom(){ return stewieY+stewieSize/2; }
  public float left()  { return stewieX-stewieSize/2; }
  public float right() { return stewieX+stewieSize/2; }
}

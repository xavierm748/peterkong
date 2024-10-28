class kong
{
  public float kongSize;
  public float kongX, kongY;
  public float kongXspd, kongYspd;
  boolean jumped;
  boolean moveLeft;
  boolean moveDown;
  boolean moveRight;
  boolean barrelOnScreen;
  PImage kong;
  
  public kong()
  {
    //setting initial values
    kongX = 100;
    kongY = 50;
    kongXspd = 0;
    kongYspd = 0;
    kongSize = 100;
    barrelOnScreen = false;
    
    //loading the image and resizing the image
    kong = loadImage("kong.png");
    kong.resize(int(kongSize),0);
    
        
  }
  
  void drawkong()
  {
    //this draws the image
    image(kong, kongX, kongY);
  }
  
  void movekong()
  {
    //moves kong
    kongY += kongYspd;
    kongYspd += 0.7; //gravity
    
    for( Platform P: plats )
    {
      //checks for collision on the top of the platform
      if( bottom() > P.top() && bottom() <= P.yMiddle() && kongX >= P.left() && kongX <=  P.right() )
      {
        kongYspd = 0;
        kongY = P.top()-kongSize/2;
      }
    }
  }
  
    
  //for kong
  public float top()   { return kongY-kongSize/2; }
  public float bottom(){ return kongY+kongSize/2; }
  public float left()  { return kongX-kongSize/2; }
  public float right() { return kongX+kongSize/2; }
}

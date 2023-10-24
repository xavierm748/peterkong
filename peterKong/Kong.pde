class kong
{
  public float kongX, kongY;
  public float kongSize;
  public float barrelX, barrelY;
  public float barrelSize;
  public float kongXspd, kongYspd;
  public float barrelXspd, barrelYspd;
  boolean jumped;
  boolean moveLeft;
  boolean moveDown;
  boolean moveRight;
  PImage kong;
  PImage barrel;
  
  public kong()
  {
    //setting initial values
    kongX = 100;
    kongY = 50;
    kongXspd = 0;
    kongYspd = 0;
    kongSize = 140;
    barrelX = 100;
    barrelY = 50;
    barrelXspd = 0;
    barrelYspd = 0;
    barrelSize = 80;
        
    //loading the image and resizing the image
    kong = loadImage("kong.png");
    kong.resize(int(kongSize),0);
    
    //loading the image and resizing the image
    barrel = loadImage("barrel.png");
    barrel.resize(int(barrelSize),0);
    
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
      //checks for collision on the top of the platform
      if( barrelBottom() > P.top() && barrelBottom() <= P.yMiddle() && barrelX >= P.left() && barrelX <=  P.right() )
      {
        barrelYspd = 0;
        barrelY = P.top()-barrelSize/2;
      }
    }
  }
  
  void drawBarrel()
  {
    //this draws the image
    image(barrel, barrelX, barrelY);
  }
  
  void moveBarrel()
  {
    barrelX += barrelXspd;
    barrelXspd += 0.7;
    
    if( barrelX >= width-(kongSize/2) || barrelX <= 0+(kongSize/2) )
      barrelXspd = -barrelXspd;
    
      
    //collision on the barrel hitting peter
    //checks for collision on the top of peter
    if( barrelBottom() > p.top() && barrelX >= p.left() && barrelX <=  p.right() )
    {
      p.health -= 10;
    }
    //checks for collision on the bottom of peter
    if( barrelTop() < p.bottom() && barrelX >= p.left() && barrelX <=  p.right() )
    {
      p.health -= 10;
    }
    //checks for collision on the right side of peter
    if( barrelLeft() < p.right() && barrelY <= p.bottom() && barrelY >=  p.top() )
    {
      p.health -= 10;
    }
    //checks for collision on the left side of peter
    if( barrelRight() > p.left() && barrelY <= p.bottom() && barrelY >=  p.top() )
    {
      p.health -= 10;
    }
  }
  
  //for kong
  public float top()   { return kongY-kongSize/2; }
  public float bottom(){ return kongY+kongSize/2; }
  public float left()  { return kongX-kongSize/2; }
  public float right() { return kongX+kongSize/2; }
  //for the barrel
  public float barrelTop()   { return barrelY-barrelSize/2; }
  public float barrelBottom(){ return barrelY+barrelSize/2; }
  public float barrelLeft()  { return barrelX-barrelSize/2; }
  public float barrelRight() { return barrelX+barrelSize/2; }
}

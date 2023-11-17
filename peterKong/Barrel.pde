class Barrel
{
  //variables for the top of the barrel when it is rolling
  public float barrelXspd, barrelYspd;
  public float barrelX = k.kongX;
  public float barrelY = k.kongY;
  public float barrelSize;
  //variables for the side of the barrel
  public float sideBarrelXspd, sideBarrelYspd;
  public float sideBarrelX = k.kongX;
  public float sideBarrelY = k.kongY;
  public float sideBarrelSize;
  //miscellaneous variables
  public float rotateAmount;
  public float rotate;
  public boolean wasHit;
  public boolean barrelOnLadder;
  PImage barrel;
  PImage sideBarrel;
  
  public Barrel(float x, float y)
  {
    barrelX = x;
    barrelY += y;
    barrelXspd = 5;
    barrelYspd = 0;
    barrelSize = 60;
    sideBarrelX = x;
    sideBarrelY += y;
    sideBarrelXspd = 5;
    sideBarrelYspd = 0;
    sideBarrelSize = 60;
    rotateAmount += 0.08;
    wasHit = false;
    barrelOnLadder = false;
    
    //loading the image and resizing the image
    barrel = loadImage("barrel.png");
    barrel.resize(int(barrelSize),0);
    //loading the image and resizing the image
    sideBarrel = loadImage("side of barrel.png");
    sideBarrel.resize(int(sideBarrelSize),0);
    
  }
  
  void drawBarrel()
  {
    //this draws the image and rotates the image when so it looks like it is rolling
    push();
    translate(barrelX, barrelY);
    rotate(rotate);
    image(barrel, 0, 0);
    rotate += rotateAmount;
    pop();
  }
  
  void drawSideBarrel()
  {
    image(sideBarrel, barrelX, barrelY);
  }
  
  void moveBarrel()
  {
    //this moves the player
    barrelY += barrelYspd;
    barrelX += barrelXspd;  
    barrelYspd += 0.7; //gravity
    
    for( Platform P: plats )
    {
      //checks for collision on the top of the platform
      if( barrelBottom() > P.top() && barrelBottom() <= P.yMiddle() && barrelX >= P.left() && barrelX <=  P.right() )
      {
        barrelYspd = 0;
        barrelY = P.top()-barrelSize/2;
      }
      //checks for collision on the right side of the platform
      if( barrelLeft() < P.right() && barrelLeft() >= P.xMiddle() && barrelY <= P.bottom() && barrelY >=  P.top() )
      {
        barrelXspd = 0;
        barrelX = P.right()+barrelSize/2;
      }
      //checks for collision on the left side of the platform
      if( barrelRight() > P.left() && barrelRight() <= P.xMiddle() && barrelY <= P.bottom() && barrelY >=  P.top() )
      {
        barrelXspd = 0;
        barrelX = P.left()-barrelSize/2;
      }
    }
    //this maked it to where the barrel will "turn" to the side when it goes down a ladder
    for(Ladder L: ladder)
    {     
      //checks for collision on the top of the ladder
      if( barrelBottom() == L.ladderTop() && barrelX >= L.ladderLeft() && barrelX <=  L.ladderRight() )
      {
        barrelOnLadder = true;
        break;
      }
      else
        barrelOnLadder = false;
    }
    //makes it to where the barrel bounces off of either left or right wall
    if( barrelX >= width-(barrelSize/2) )
    {
      barrelXspd -= 5;
      rotateAmount -= 0.08;
    }
    if( barrelX <= 0+(barrelSize/2) )
    {
      barrelXspd += 5;
      rotateAmount += 0.08;
    }
    
    //this makes it to where the speed cant exceed 5 or -5
    if(barrelXspd >= 5)
      barrelXspd = 5;
    if(barrelXspd <= -5)
      barrelXspd = -5;
      
    //collision on the barrel hitting peter
    if(  dist( p.peterX, p.peterY, barrelX, barrelY ) <= p.peterSize/2 && wasHit == false)
    {
      p.health -= 50;
      p.peterX = width-100;
      p.peterY = height-150;
      wasHit = true;
    }
      
  }
  
  //for all of the sides of the barrel
  public float barrelTop()   { return barrelY-barrelSize/2; }
  public float barrelBottom(){ return barrelY+barrelSize/2; }
  public float barrelLeft()  { return barrelX-barrelSize/2; }
  public float barrelRight() { return barrelX+barrelSize/2; }
  //for all of the sides of the barrel
  public float sideBarrelTop()   { return sideBarrelY-sideBarrelSize/2; }
  public float sideBarrelBottom(){ return sideBarrelY+sideBarrelSize/2; }
  public float sideBarrelLeft()  { return sideBarrelX-sideBarrelSize/2; }
  public float sideBarrelRight() { return sideBarrelX+sideBarrelSize/2; }

}

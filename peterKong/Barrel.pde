class Barrel
{
  public float barrelXspd, barrelYspd;
  public float barrelX = 100;
  public float barrelY = 50;
  public float barrelSize;
  PImage barrel;
  
  public Barrel(float x, float y)
  {
    barrelX = x;
    barrelY += y;
    barrelXspd = 0;
    barrelYspd = 0;
    barrelSize = 80;
    
    //loading the image and resizing the image
    barrel = loadImage("barrel.png");
    barrel.resize(int(barrelSize),0);

  }
  
  void drawBarrel()
  {
    //this draws the image
    image(barrel, barrelX, barrelY);
  }
  
  void moveBarrel()
  {
    //this moves the player
    barrelY += barrelYspd;
    barrelX += barrelXspd;  
    barrelYspd += 0.7; //gravity
    barrelXspd = 5;
    
    for( Platform P: plats )
    {
      //checks for collision on the top of the platform
      if( barrelBottom() > P.top() && barrelBottom() <= P.yMiddle() && barrelX >= P.left() && barrelX <=  P.right() )
      {
        barrelYspd = 0;
        barrelY = P.top()-barrelSize/2;
      }
    }
    
    //makes it to where the barrel bounces off of either left or right wall
    if( barrelX >= width-(barrelSize/2) || barrelX <= 0+(barrelSize/2) )
      barrelXspd = -barrelXspd;
    
    //collision on the barrel hitting peter
    if(  dist( p.peterX, p.peterY, barrelX, barrelY ) <= p.peterSize/2 )
      p.health -= 10;
      
  }
  
  //for all of the sides of the barrel
  public float barrelTop()   { return barrelY-barrelSize/2; }
  public float barrelBottom(){ return barrelY+barrelSize/2; }
  public float barrelLeft()  { return barrelX-barrelSize/2; }
  public float barrelRight() { return barrelX+barrelSize/2; }

}

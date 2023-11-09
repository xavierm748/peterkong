class Barrel
{
  public float barrelXspd, barrelYspd;
  public float barrelX = k.kongX;
  public float barrelY = k.kongY;
  public float barrelSize;
  public float rotateAmount;
  public float rotate;
  public boolean wasHit;
  PImage barrel;
  
  public Barrel(float x, float y)
  {
    barrelX = x;
    barrelY += y;
    barrelXspd = 5;
    barrelYspd = 0;
    barrelSize = 60;
    rotateAmount += 0.08;
    wasHit = false;
    
    //loading the image and resizing the image
    barrel = loadImage("barrel.png");
    barrel.resize(int(barrelSize),0);
    
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

}

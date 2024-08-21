class Peter
{
  public float peterX, peterY;
  public float peterSize;
  public float peterXspd, peterYspd;
  public float health;
  public boolean hasHealth;
  public int jumpCounter;
  PImage peter;
  boolean jumped;
  boolean moveLeft;
  boolean moveDown;
  boolean moveRight;
  boolean goingUp;
  boolean peterOnLadder;

  public Peter()
  {
    //setting initial values of every variable
    peterX = width-100;
    peterY = height-100;
    peterXspd = 0;
    peterYspd = 0;
    peterSize = 70;
    health = 200;
    jumped = false;
    moveLeft = false;
    moveRight = false;
    moveDown = false;
    goingUp = false;
    hasHealth = true;
    
    //loads and resizes the image
    peter = loadImage("peter_griffin-removebg-preview.png");
    peter.resize(int(peterSize-25),0);
    noStroke();
    
  }
  
  public void drawPeter()
  {
    //this centers the image and draws the image
    imageMode(CENTER);
    image(peter,peterX,peterY);
  }
  
  public void movePeter()
  {
    //this moves the player
    peterY += peterYspd;
    peterX += peterXspd;  
    peterYspd += 0.7; //gravity
    peterXspd *= 0.95;
    
    //checking collision on the floor
    if( peterY >= height-(peterSize/2) )
    {
      peterYspd = 0;
      jumped = false;
    }
    
    //check collision on the right wall
    if( peterX >= width-(peterSize/2) )
    {
      peterXspd = 0;
    }
    
    //check collision on the left wall
    if( peterX <= peterSize/2 )
    {
      peterXspd = 0;
    }
    
    //this makes it to where the speed does not infinitly increase
    if( peterXspd >= 3 )
      peterXspd = 3;
    //this makes it to where the speed does not infinitly decrease
    if( peterXspd <= -3 )
      peterXspd = -3;
    
    //Collision
    for( Platform P: plats )
    {
      //checks for collision on the top of the platform
      if( bottom() > P.top() && bottom() <= P.yMiddle() && peterX >= P.left() && peterX <=  P.right() )
      {
        peterYspd = 0;
        peterY = P.top()-peterSize/2;
        jumped = false;
      }
      //checks for collision on the bottom of the platform
      if( top() < P.bottom() && top() >= P.yMiddle() && peterX >= P.left() && peterX <=  P.right() )
      {
        peterYspd = 0;
        peterY = P.bottom()+peterSize/2;
      }
      //checks for collision on the right side of the platform
      if( left() < P.right() && left() >= P.xMiddle() && peterY <= P.bottom() && peterY >=  P.top() )
      {
        peterXspd = 0;
        peterX = P.right()+peterSize/2;
      }
      //checks for collision on the left side of the platform
      if( right() > P.left() && right() <= P.xMiddle() && peterY <= P.bottom() && peterY >=  P.top() )
      {
        peterXspd = 0;
        peterX = P.left()-peterSize/2;
      }
    }
    
    for(Ladder L: ladder)
    {
      //checks to see if you are on the ladder
      if( ( peterX < L.ladderRight() && peterX >= L.ladderxMiddle() && peterY <= L.ladderBottom() && peterY >=  L.ladderTop()) || 
          ( peterX > L.ladderLeft() && peterX <= L.ladderxMiddle() && peterY <= L.ladderBottom() && peterY >=  L.ladderTop()) )
      {
        peterOnLadder = true;
        break;
      }
      else
        peterOnLadder = false;
      
      //checks for collision on the top of the ladder
      if( bottom() == L.ladderTop() && peterX >= L.ladderLeft() && peterX <=  L.ladderRight() )
      {
        peterYspd = 0;
        jumped = false;
      }
    }
  }
  
  //makes peter jump
  public void jump()
  {     
    if(!jumped)
    {
     peterYspd -= 17;
     jumped = true;
    }
  }  
    
  public float top()   { return peterY-peterSize/2; }
  public float bottom(){ return peterY+peterSize/2; }
  public float left()  { return peterX-peterSize/2; }
  public float right() { return peterX+peterSize/2; }
}

class Peter
{
  public float peterX, peterY;
  public float peterSize;
  public float peterXspd, peterYspd;
  public int jumpCounter;
  PImage peter;
  boolean jumped;
  boolean moveLeft;
  boolean moveDown;
  boolean moveRight;
  boolean diagonalLeft;
  boolean diagonalRight;
  
  public Peter()
  {
    peterX = width/2;
    peterY = 200;
    peterXspd = 0;
    peterYspd = 0;
    peterSize = 100;
    jumped = false;
    moveLeft = false;
    moveRight = false;
    moveDown = false;
    diagonalLeft = false;
    diagonalRight = false;
    
    peter = loadImage("peter_griffin-removebg-preview.png");
    peter.resize(int(peterSize-25),0);
    noStroke();

  }
  
  public void drawPeter()
  {
    imageMode(CENTER);
    image(peter,peterX,peterY);
  }
  
  public void movePeter()
  {
    //this moves the player
    peterY += peterYspd;
    peterX += peterXspd;  
    peterYspd += 0.7; //gravity
    peterXspd *= 0.98;
    
    //checking collision on the floor
    if( peterY >= height-(peterSize/2) )
    {
      peterYspd = 0;
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
    
    //Collision
    for( Platform P: plats )
    {
      //checks for collision on the top of the platform
      if( bottom() > P.top() && bottom() <= P.yMiddle() && peterX >= P.left() && peterX <=  P.right() )
      {
        peterYspd = 0;
        peterY = P.top()-peterSize/2;
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
  }
  
  public void jump()
  {     
    jumpCounter += 1;
    if(!jumped && jumpCounter > 0)
    {
     peterYspd -= 17;
     jumpCounter = 0;
     jumped = false;
    }
  }
  
  public void down()
  {
    if(!moveDown)
    {
     peterYspd += 25;
     moveDown = false;
    }
  }
  
  public void moveLeft()
  {
    if(!moveLeft)
    {

     peterXspd -= 5;
     moveLeft = false;
    }
  }
  
  public void moveRight()
  {
    if(!moveRight)
    {
     peterXspd += 5;
     moveRight = false;
    }
  }
  public void diagonalLeft()
  {
    if(!diagonalLeft)
    {
     peterXspd -= 5;
     peterYspd -= 17;
     diagonalLeft = false;
    }
  }
  public void diagonalRight()
  {
    if(!diagonalRight)
    {
     peterXspd += 5;
     moveRight = false;
    }
  }
    
  public float top()   { return peterY-peterSize/2; }
  public float bottom(){ return peterY+peterSize/2; }
  public float left()  { return peterX-peterSize/2; }
  public float right() { return peterX+peterSize/2; }
}

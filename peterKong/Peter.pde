class Peter
{
  public float peterX, peterY;
  public float peterSize;
  public float peterXspd, peterYspd;
  boolean jumped;
  boolean moveLeft;
  boolean moveDown;
  boolean moveRight;
  
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
    noStroke();
    
    println("xPos: "+peterX);
    println("yPos: "+peterY);
    println("peterXspd: "+peterXspd);
    println("peterYspd: "+peterYspd);

  }
  
  public void drawPeter()
  {
    circle(peterX,peterY,peterSize);
    
    //checking collision on the walls
    if( peterY >= height-(peterSize/2) )
      peterYspd = 0;
    if( peterX >= width-(peterSize/2) )
      peterXspd = 0;
    if( peterY <= peterSize/2 )
      peterYspd = 0;
    if( peterX <= peterSize/2 )
      peterXspd = 0;
      
    //checks for collision on the top of the platform
    if( peterY >= P.top() && peterY <= P.yMiddle() && peterX >= P.left() && peterX <=  P.right() )
    {
      peterYspd = 0;
      peterY = peterY-peterSize;
    }
    //checks for collision on the bottom of the platform
    if( peterY <= P.bottom() && peterY >= P.yMiddle() && peterX <= P.left() && peterX >=  P.right() )
    {
      peterYspd = 0;
    }
    //checks for collision on the right side of the platform
    if( peterX >= P.right() && peterX >= P.xMiddle() )
    {
      peterXspd = 0;
    }
    //checks for collision on the left side of the platform
    if( peterX <= P.left() && peterX <= P.yMiddle() )
    {
      peterXspd = 0;
    }
  }
  
  public void movePeter()
  {
    //this moves the player
    peterY += peterYspd;
    peterX += peterXspd;  
    peterYspd += 0.7; //gravity
    peterXspd *= 0.98;
    
  }
  
  public void jump()
  {
    if(!jumped)
    {
     for(int i = 0; i < 10; i++)
     {
       peterYspd -= 2.5;
     }
     jumped = false;
    }
  }
  
  public void down()
  {
    if(!moveDown)
    {
     for(int i = 0; i < 10; i++)
     {
       peterYspd += 1;
     }
     moveDown = false;
    }
  }
  
  public void left()
  {
    if(!moveLeft)
    {
     for(int i = 0; i < 10; i++)
     {
       peterXspd -= 0.5;
     }
     moveLeft = false;
    }
  }
  
  public void right()
  {
    if(!moveRight)
    {
     for(int i = 0; i < 10; i++)
     {
       peterXspd += 0.5;
     }
     moveRight = false;
    }
  }
}

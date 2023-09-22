class Peter
{
  float peterX, peterY;
  float peterSize;
  float peterXspd, peterYspd;
  boolean jumped;
  boolean moveLeft;
  boolean moveDown;
  boolean moveRight;
  
  
  public Peter()
  {
    peterX = width/2;
    peterY = height/2;
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
    
    if( peterY >= height-(peterSize/2) )
      peterYspd = 0;
    if( peterX >= width-(peterSize/2) )
      peterXspd = 0;
    if( peterY <= peterSize/2 )
      peterYspd = 0;
    if( peterX <= peterSize/2 )
      peterXspd = 0;
    if( peterY <= platformXpos+platformSize)
      peterYspd = 0;

  }
  
  public void movePeter()
  {
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

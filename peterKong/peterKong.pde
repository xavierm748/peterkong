//Peter Kong
//Xavier Mclarey

float peterX, peterY;
float peterSize;
float peterXspd, peterYspd;
float maxJumpHeight;
boolean jumped;
boolean moveLeft;
boolean moveDown;
boolean moveRight;


void setup()
{
  fullScreen();
  peterX = width/2;
  peterY = height/2;
  peterXspd = 0;
  peterYspd = 0;
  peterSize = 100;
  maxJumpHeight = 10;
  jumped = false;
  noStroke();
}

void draw()
{
  background(0);
  
  fill(#E80918);
  rect(1200,300,300,100);
  fill(#09E825);
  peterY -= peterYspd;
  peterX -= peterXspd;  
  peterY += 0.7;
  peterY *= 0.98;
  peterX += 0.7;
  peterX *= 0.98;
  
  circle(peterX,peterY,peterSize);
  
  if( peterY > width-(peterSize/2) )
  {
    peterYspd = 0;
    peterY = 0;
  }
  
}

void keyPressed()
{
  if( key == 'w')
    jump();
  if( key == 'a')
    left();
  if( key == 's')
    down();
  if( key == 'd')
    right();
}

public void jump()
{
  if(!jumped)
  {
   for(int i = 0; i < maxJumpHeight; i++)
   {
     peterYspd += 0.5;
   }
   jumped = false;
  }
}

public void left()
{
  if(!moveLeft)
  {
   for(int i = 0; i < 10; i++)
   {
     peterXspd += 0.5;
   }
   moveLeft = false;
  }
  peterX -= peterXspd;
}

public void down()
{
  if(!moveDown)
  {
   for(int i = 0; i < 10; i++)
   {
     peterYspd -= 0.5;
   }
   moveDown = false;
  }
   peterY += peterYspd;
}

public void right()
{
  if(!moveRight)
  {
   for(int i = 0; i < 10; i++)
   {
     peterXspd -= 0.5;
   }
   moveRight = false;
  }
  peterX += peterXspd;
}

//Peter Kong
//Xavier Mclarey

Peter p;
kong k;
HUD h;
StartScreen s;

ArrayList<Platform> plats = new ArrayList <Platform>();
float platformCount = 6;

void setup()
{
  fullScreen();
  //size(1400,1000);
  p = new Peter();
  k = new kong();
  h = new HUD();
  s = new StartScreen();
  
  for(int i = 0; i < platformCount  ; i++)
    plats.add( new Platform(250*i, 150*i) );
}

void draw()
{
  background(0);
  fill(#F50707);
  
  s.drawTitle();
  s.drawStartbutton();
  
  //this checks if the barrel is off the screen
  if(k.barrelY > height)
    k.barrelOnScreen = false;
  else
    k.barrelOnScreen = true;
  //this checks if peter has health
  if(p.health <= 0)
    p.hasHealth = false;

  if(s.gameStarted && p.hasHealth)
  {
    background(0);
    for(Platform pl: plats)
      pl.drawPlatform();

    fill(#4003FF);
    push();
    p.drawPeter();
    k.drawkong();
    if(k.barrelOnScreen)
    {
      k.drawBarrel();
      k.moveBarrel();
    }
    k.movekong();
    pop();
    p.movePeter();
    h.healthBar();
  }
  else if(!p.hasHealth)
  {
   h.gameOver();
   
   s.gameStarted = false;
  }
  //makes peter move right
  if(p.moveRight)
  {
    p.peterXspd = 5;
    p.moveRight = false;
  }
  //makes peter move left
  if(p.moveLeft)
  {
    p.peterXspd = -5;
    p.moveLeft = false;
  }
  //debugging
  
}

void mousePressed()
{
  if( mouseX >= s.left() && mouseX <= s.right() && mouseY >= s.top() && mouseY <= s.bottom() )
    s.gameStarted = true;
}

void keyPressed()
{
  //Movement For Peter
  if( key == ' ')
    p.jump();
  if( key == 'a')
    p.moveLeft = true;    
  if( key == 'd')
    p.moveRight = true;
  if( key == 's')
    p.down();
    
}

void keyReleased()
{
  //this makes te speed stop increasing
  if( key == 'a')
    p.moveLeft = false;    
  if( key == 'd')
    p.moveRight = false;
}

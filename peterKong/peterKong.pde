//Peter Kong
//Xavier Mclarey

Peter p;
Stewie s;
StartScreen S;

ArrayList<Platform> plats = new ArrayList <Platform>();
float platformCount = 6;
float platformPos = 0;

void setup()
{
  fullScreen();
  //size(1400,1000);
  p = new Peter();
  s = new Stewie();
  S = new StartScreen();
  
  for(int i = 0; i < platformCount  ; i++)
    plats.add( new Platform(platformPos) );
}

void draw()
{
  background(0);
  
  fill(#F50707);
  for(Platform pl: plats)
    pl.drawPlatform();
  
  if(!S.gameStarted)
  {
    fill(#4003FF);
    S.drawTitle();
    S.drawStartbutton();
    push();
    p.drawPeter();
    s.drawStewie();
    s.drawTricycle();
    s.moveStewie();
    pop();
    p.movePeter();
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
  println("Peter X speed: " + p.peterXspd);
  println("positions of the platforms: " + platformPos);
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

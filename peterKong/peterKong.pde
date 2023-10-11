//Peter Kong
//Xavier Mclarey

Peter p;
Stewie s;

ArrayList<Platform> plats = new ArrayList <Platform>();
float platformCount = 6;
float platformPos = 0;

void setup()
{
  fullScreen();
  //size(1400,1000);
  p = new Peter();
  s = new Stewie();
  
  for(int i = 0; i < platformCount  ; i++)
    plats.add( new Platform(platformPos) );
}

void draw()
{
  background(0);

  fill(#F50707);
  for(Platform pl: plats)
    pl.drawPlatform();
  
  fill(#4003FF);
  push();
  p.drawPeter();
  s.drawStewie();
  s.moveStewie();
  pop();
  p.movePeter();
  
  if(p.moveRight)
  {
    p.peterXspd = 5;
    p.moveRight = false;
  }
  if(p.moveLeft)
  {
    p.peterXspd = -5;
    p.moveLeft = false;
  }
  println("X speed: " + p.peterXspd);
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
    
  //Movement For Stewie
  if( key == CODED)
    if( keyCode == UP)
    p.jump();
  if( key == CODED)
    if( keyCode == CODED)
    p.moveLeft = true;    
  if( key == CODED)
    if( keyCode == CODED)
    p.moveRight = true;
  if( key == CODED)
    if( keyCode == DOWN)
    p.down();
}

void keyReleased()
{
  if( key == 'a')
    p.moveLeft = false;    
  if( key == 'd')
    p.moveRight = false;
}

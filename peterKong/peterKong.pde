//Peter Kong
//Xavier Mclarey

Peter p;
Stewie s;

ArrayList<Platform> plats = new ArrayList <Platform>();
float platformCount = 6;

void setup()
{
  fullScreen();
  //size(1400,1000);
  p = new Peter();
  s = new Stewie();
  
  for(int i = 0; i < platformCount  ; i++)
    plats.add( new Platform() );
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
  pop();
  p.movePeter();
  
  if(p.moveRight)
  {
    p.peterXspd = 6;
    p.moveRight = false;
  }
  if(p.moveLeft)
  {
    p.peterXspd = -6;
    p.moveLeft = false;
  }
  println("X speed: " + p.peterXspd);
}
 
void keyPressed()
{
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
  if( key == 'a')
    p.moveLeft = false;    
  if( key == 'd')
    p.moveRight = false;
}

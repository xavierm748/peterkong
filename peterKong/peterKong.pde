//Peter Kong
//Xavier Mclarey

Platform P;
Peter p;
Player s;

void setup()
{
  fullScreen();
  //size(1400,1000);
  P = new Platform();
  p = new Peter();
  s = new Player();
}

void draw()
{
  background(0);

  fill(#F50707);
  P.drawPlatform();
  fill(#12FF1F);
  p.drawPeter();
  p.movePeter();
}

void keyPressed()
{
  if( key == ' ')
    p.jump();
  if( key == 'a')
    p.moveLeft();    
  if( key == 'd')
    p.moveRight();
  if( key == 's')
    p.down();
}

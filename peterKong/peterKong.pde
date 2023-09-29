//Peter Kong
//Xavier Mclarey

Peter p;
Player s;

ArrayList<Platform> plats = new ArrayList <Platform>();
float platformCount = 5;

void setup()
{
  fullScreen();
  //size(1400,1000);
  p = new Peter();
  s = new Player();
  
  for(int i = 0; i < platformCount  ; i++)
    plats.add( new Platform() );
}

void draw()
{
  background(0);

  fill(#F50707);
  
  for(Platform pl: plats)
    pl.drawPlatform();
  //P.drawPlatform();
  fill(#4003FF);
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

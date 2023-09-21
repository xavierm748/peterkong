//Peter Kong
//Xavier Mclarey

Peter p;
Player s;

void setup()
{
  fullScreen();
  //size(1400,1000);
  p = new Peter();
  s = new Player();
}

void draw()
{
  background(0);
  fill(#E80918);
  rect(1200,300,300,100);
  fill(#09E825);
  p.drawPeter();
  p.movePeter();
}

void keyPressed()
{
  if( key == ' ')
    p.jump();
  if( key == 'a')
    p.left();    
  if( key == 'd')
    p.right();
  if( key == 's')
    p.down();
}

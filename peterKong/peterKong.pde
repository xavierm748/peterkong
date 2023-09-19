//Peter Kong
//Xavier Mclarey

Peter p;
Player s;

void setup()
{
  fullScreen();
  p = new Peter();
  s = new Player();
}

void draw()
{
  background(0);
  
  fill(#E80918);
  rect(1200,300,300,100);
  fill(#09E825);
  
  p.movePeter();
  p.drawPeter();
  p.jump();
  p.left();
  p.right();
}

//void keyPressed()
//{
//  if( key == ' ')
//    jump();
//  if( key == 'a')
//    left();    
//  if( key == 'd')
//    right();
//}

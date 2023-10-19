//Peter Kong
//Xavier Mclarey

Peter p;
kong s;
StartScreen S;

ArrayList<Platform> plats = new ArrayList <Platform>();
float platformCount = 6;

void setup()
{
  fullScreen();
  //size(1400,1000);
  p = new Peter();
  s = new kong();
  S = new StartScreen();
  
  for(int i = 0; i < platformCount  ; i++)
    plats.add( new Platform(150*i, 150*i) );
}

void draw()
{
  background(0);
  fill(#F50707);
  
  S.drawTitle();
  S.drawStartbutton();

  if(S.gameStarted)
  {
    background(0);
    for(Platform pl: plats)
      pl.drawPlatform();

    fill(#4003FF);
    push();
    p.drawPeter();
    s.drawkong();
    s.drawBarrel();
    s.movekong();
    s.moveBarrel();
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
  
}

void mousePressed()
{
  if( mouseX >= S.left() && mouseX <= S.right() && mouseY >= S.top() && mouseY <= S.bottom() )
    S.gameStarted = true;
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

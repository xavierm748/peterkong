//Peter Kong
//Xavier Mclarey

Peter p;
kong k;
HUD h;
StartScreen s;

ArrayList<Platform> plats = new ArrayList <Platform>();
ArrayList<Barrel> barrel = new ArrayList <Barrel>();
ArrayList<Ladder> ladder = new ArrayList <Ladder>();
float platformCount = 6;
float barrelCount = 1;
float barrelTimer;

void setup()
{
  fullScreen();
  
  p = new Peter();
  k = new kong();
  h = new HUD();
  s = new StartScreen();
  
  //this creates the platforms
  //platform 1
  plats.add( new Platform(0, height-900, 1375) );
  plats.add( new Platform(width-500, height-900, 300) );
  //platform 2
  plats.add( new Platform(width-1350, height-690, 1350) );
  plats.add( new Platform(width-1700, height-690, 300) );
  //platform 3
  plats.add( new Platform(0, height-480, 1025) );
  plats.add( new Platform(width-850, height-480, 650) );
  //platform 4
  plats.add( new Platform(width-1350, height-270, 1350) );
  plats.add( new Platform(width-1700, height-270, 300) );
  //platform 5
  plats.add( new Platform(0, height-60, width) );
  //this creates the ladders
  ladder.add( new Ladder(width-550, height-900) );
  ladder.add( new Ladder(width-1400, height-690) );
  ladder.add( new Ladder(width-900, height-480) );
  ladder.add( new Ladder(width-1400, height-270) );
  
  for(int i = 0; i < barrelCount  ; i++)
    barrel.add( new Barrel(100*i, 50*i) );
  
}

void draw()
{
  background(0);
  fill(#F50707);
  
  if(!s.gameStarted)
  {
    s.drawTitle();
    s.drawStartbutton();
  }

  //this checks if peter has health
  if( p.health <= 0 )
    p.hasHealth = false;

  if( s.gameStarted && p.hasHealth )
  {
    background(0);
    for(Platform pl: plats)
      pl.drawPlatform();
    for(Ladder la: ladder)
      la.drawLadder();
    

    fill(#4003FF);
    push();
    p.drawPeter();
    k.drawkong();
    
    if( millis() > barrelTimer )
    {
      barrelTimer = millis() + 3000;
      barrel.add( new Barrel(100, 50) );
    }
    
    for(Barrel b: barrel)
    {
      b.drawBarrel();
      b.moveBarrel();
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
    p.peterXspd += 5;
  //makes peter move left
  if(p.moveLeft)
    p.peterXspd -= 5;
  //makes peter move up when he is on the ladder
  if( p.goingUp && p.onLadder)
    p.peterYspd -= 1;
}

void mousePressed()
{
  if( mouseX >= s.left() && mouseX <= s.right() && mouseY >= s.top() && mouseY <= s.bottom() )
    s.gameStarted = true;
}

void keyPressed()
{
  //Movement For Peter
  if( key == ' ' )
    p.jump();
  if( key == 'a' || key == 'A' )
    p.moveLeft = true;    
  if( key == 'd' || key == 'D' )
    p.moveRight = true;
  if( key == 'w' || key == 'W' )
    p.goingUp = true;
}

void keyReleased()
{
  //this makes the speed stop increasing
  if( key == 'a' || key == 'A' )
    p.moveLeft = false;    
  if( key == 'd' || key == 'D' )
    p.moveRight = false;
  if( key == 'w' || key == 'W' )
    p.goingUp = false;
}

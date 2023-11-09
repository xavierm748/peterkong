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
float barrelCount = random(1,3);
float barrelTimer = 0;

void setup()
{
  fullScreen();
  //size(1400,1000);
  p = new Peter();
  k = new kong();
  h = new HUD();
  s = new StartScreen();
  
  //this creates the platforms
  plats.add( new Platform(0, height-910) );
  plats.add( new Platform(width-1700, height-735) );
  plats.add( new Platform(0, height-515) );
  plats.add( new Platform(width-1700, height-295) );
  plats.add( new Platform(0, height-75) );
  //this creates the ladders
  ladder.add( new Ladder(width-550, height-885) );
  ladder.add( new Ladder(width-1000, height-665) );
  ladder.add( new Ladder(width-900, height-445) );
  ladder.add( new Ladder(width-1400, height-225) );
  
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
      barrelTimer += millis() + 1000;
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
  {
    p.peterXspd += 5;
    p.moveRight = false;
  }
  //makes peter move left
  if(p.moveLeft)
  {
    p.peterXspd -= 5;
    p.moveLeft = false;
  }
  
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
  //this makes the speed stop increasing
  if( key == 'a')
    p.moveLeft = false;    
  if( key == 'd')
    p.moveRight = false;
}

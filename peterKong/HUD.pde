class HUD
{
  public float healthX, healthY;
  public float healthYsize;
  public boolean gameOver;

  
  public HUD()
  {
    //setting initial values
    healthX = 50;
    healthY = 10;
    healthYsize = 30;
    gameOver = false;
  }
  
  void healthBar()
  {
    //this draws the health
    fill(#FC0303);
    rect(healthX, healthY, p.health, healthYsize);
    
    //this is the border for the health bar
    push();
    noFill();
    stroke(255);
    strokeWeight(5);
    rect(healthX, healthY, 200, healthYsize);
    pop();
  }
  
  void gameOver()
  {
    background(0);
    push();
    fill(#FC0303);
    textSize(200);
    text("GAME OVER!", (width/2)-500, height/2);
    pop();
  }
}

class HUD
{
  public float healthX, healthY;
  public float healthYsize;

  
  public HUD()
  {
    healthX = 50;
    healthY = 10;
    healthYsize = 30;
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
}

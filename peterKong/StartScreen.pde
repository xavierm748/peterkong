class StartScreen
{
  public boolean gameStarted;
  float titleX, titleY;
  float titleSize;
  float buttonX, buttonY;
  float buttonSize;
  float buttonOutlineX, buttonOutlineY;
  
  public StartScreen()
  {
    titleSize = 200;
    titleX = (width/2)-450;
    titleY = 300;
    buttonSize = 100;
    buttonX = (width/2)-100;
    buttonY = height-300;
    buttonOutlineX = buttonX-25;
    buttonOutlineY = buttonY-75;
    gameStarted = false;
    
  }
  
  void drawTitle()
  {
    textSize(titleSize);
    text("Peter Kong", titleX, titleY);
  }
  
  void drawStartbutton()
  {
    textSize(buttonSize);
    text("Start",buttonX, buttonY);
    push();
    noFill();
    stroke(#F50707);
    strokeWeight(5);
    rect(buttonOutlineX, buttonOutlineY, 250, 80);
    pop();
  }
  
  public float top()   { return buttonOutlineY; }
  public float bottom(){ return buttonOutlineY+80; }
  public float left()  { return buttonOutlineX; }
  public float right() { return buttonOutlineX+250; }

}

class StartScreen
{
  public boolean gameStarted;
  float titleX, titleY;
  float titleSize;
  float startButtonX, startButtonY;
  float startButtonSize;
  
  public StartScreen()
  {
    titleSize = 200;
    titleX = (width/2)-titleSize/2;
    titleY = 300;
    startButtonSize = 100;
    startButtonX = (width/2)-startButtonSize/2;
    startButtonY = height-300;
    gameStarted = false;
  }
  
  void drawTitle()
  {
    textSize(titleSize);
    text("Peter Kong", titleX, titleY);
  }
  
  void drawStartbutton()
  {
    
  }
}

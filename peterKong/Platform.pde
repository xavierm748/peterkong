class Platform
{
  float platformX, platformY;
  float platformSize;
  
  public Platform()
  {
    platformX = width/2;
    platformY = height-100;
  }
  
  public void drawPlatform()
  {
    rect(platformX, platformY, platformSize, platformSize);
  }
}

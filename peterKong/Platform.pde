class Platform
{
  public float platformXpos;
  public float platformYpos;
  public float platformSize;
  
  public Platform()
  {
    platformXpos = width/2;
    platformYpos = height-100;
    platformSize = 100;
  }
  
  public void drawPlatform()
  {
    square(platformXpos, platformYpos, platformSize);
  }
}

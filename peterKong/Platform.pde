class Platform
{
  public float platformXpos;
  public float platformYpos;
  public float platformSize;
  
  public Platform()
  {
    platformXpos = (width/2)-50;
    platformYpos = height/2;
    platformSize = 100;
  }
  
  public void drawPlatform()
  {
    square(platformXpos, platformYpos, platformSize);
  }
  
  public float top(){ return platformYpos; }
  public float bottom(){ return platformYpos+platformSize; }
  public float left(){ return platformXpos; }
  public float right(){ return platformXpos+platformSize; }
  public float xMiddle(){ return platformXpos+(platformSize/2); }
  public float yMiddle(){ return platformYpos+(platformSize/2); }
  
}

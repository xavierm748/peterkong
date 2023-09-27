class Platform
{
  public float platformXpos;
  public float platformYpos;
  public float platformXsize;
  public float platformYsize;
  
  public Platform()
  {
    platformXpos = (width/2)-50;
    platformYpos = height/2;
    platformXsize = 100;
    platformYsize = 100;
  }
  
  public void drawPlatform()
  {
    rect(platformXpos, platformYpos, platformXsize, platformYsize);
  }
  
  public float top(){ return platformYpos; }
  public float bottom(){ return platformYpos+platformYsize; }
  public float left(){ return platformXpos; }
  public float right(){ return platformXpos+platformYsize; }
  public float xMiddle(){ return platformXpos+(platformXsize/2); }
  public float yMiddle(){ return platformYpos+(platformYsize/2); }
  
}

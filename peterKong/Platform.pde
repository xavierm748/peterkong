class Platform
{
  public float platformXpos;
  public float platformYpos;
  public float platformXsize;
  public float platformYsize;
  
  public Platform()
  {
    platformXpos = random(width);
    platformYpos = random(height);
    platformXsize = 200;
    platformYsize = 100;
  }
  
  public void drawPlatform()
  {
    rect(platformXpos, platformYpos, platformXsize, platformYsize);
  }
  
  public float top(){ return platformYpos; }
  public float bottom(){ return platformYpos+platformYsize; }
  public float left(){ return platformXpos; }
  public float right(){ return platformXpos+platformXsize; }
  public float xMiddle(){ return platformXpos+(platformXsize/2); }
  public float yMiddle(){ return platformYpos+(platformYsize/2); }
  
}

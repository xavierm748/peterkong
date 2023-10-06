class Platform
{
  public float platformXpos;
  public float platformYpos;
  public float platformXsize;
  public float platformYsize;
  PImage platform;
  
  public Platform()
  {
    platformXsize = 500;
    platformYsize = 100;
    platformXpos = random(width-platformXsize);
    platformYpos = random(height-platformYsize);
    
    platform = loadImage("donkeyKongPlatform.png");
    platform.resize(int(platformXsize),0);
  }
  
  public void drawPlatform()
  {
    image(platform, platformXpos, platformYpos);
    //rect(platformXpos, platformYpos, platformXsize, platformYsize);
  }

  public float top()     { return platformYpos; }
  public float bottom()  { return platformYpos+platformYsize; }
  public float left()    { return platformXpos; }
  public float right()   { return platformXpos+platformXsize; }
  public float xMiddle() { return platformXpos+(platformXsize/2); }
  public float yMiddle() { return platformYpos+(platformYsize/2); }
  
}

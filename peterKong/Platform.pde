class Platform
{
  public float platformXpos;
  public float platformYpos;
  public float platformXsize;
  public float platformYsize;
  PImage platform;
  
  public Platform(float platformDest)
  {
    platformXsize = 500;
    platformYsize = 100;
    platformXpos = platformDest;
    platformYpos = platformDest;
    
    //for(int i = 0; i < platformPos  ; i++)
    //  platformDest += 100;

    
    platform = loadImage("donkeyKongPlatform.png");
    platform.resize(int(platformXsize),0);
  }
  
  public void drawPlatform()
  {
    image(platform, platformXpos, platformYpos);
  }

  public float top()     { return platformYpos; }
  public float bottom()  { return platformYpos+platformYsize; }
  public float left()    { return platformXpos; }
  public float right()   { return platformXpos+platformXsize; }
  public float xMiddle() { return platformXpos+(platformXsize/2); }
  public float yMiddle() { return platformYpos+(platformYsize/2); }
  
}

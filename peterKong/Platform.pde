class Platform
{
  public float platformXpos;
  public float platformYpos;
  public float platformXsize;
  public float platformYsize;
  PImage platform;
  
  public Platform(float platformDest)
  {
    //setting the initial values of every variable
    platformXsize = 500;
    platformYsize = 100;
    platformXpos = platformDest;
    platformYpos = platformDest;
    
    //loading and resizing the png for the platforms
    platform = loadImage("donkeyKongPlatform.png");
    platform.resize(int(platformXsize),0);
  }
  
  public void drawPlatform()
  {
    //this draws the image for the platform
    image(platform, platformXpos, platformYpos);
  }

  //this sets the positions of the different sides of the platform
  public float top()     { return platformYpos; }
  public float bottom()  { return platformYpos+platformYsize; }
  public float left()    { return platformXpos; }
  public float right()   { return platformXpos+platformXsize; }
  public float xMiddle() { return platformXpos+(platformXsize/2); }
  public float yMiddle() { return platformYpos+(platformYsize/2); }
  
}

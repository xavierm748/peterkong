class Platform
{
  public float platformXpos;
  public float platformYpos;
  public float platformXsize;
  public float platformYsize;
  PImage platform;
  
  
  public Platform(float x, float y)
  {
    //setting the initial values of every variable
    //platformXsize = width/1.13;
    //platformYsize = height/15.4;
    platformXsize = 1700;
    platformYsize = 70;
    platformXpos = x;
    platformYpos += y;
    
    //loading and resizing the png for the platforms
    platform = loadImage("donkeyKongPlatform.png");
    platform.resize(int(platformXsize),int(platformYsize));
    
  }
  
  public void drawPlatform()
  {
    //this draws the platforms
    image(platform, platformXpos, platformYpos);
  }
  
  
  //this sets the positions of the different sides of the platforms
  public float top()     { return platformYpos; }
  public float bottom()  { return platformYpos+platformYsize; }
  public float left()    { return platformXpos; }
  public float right()   { return platformXpos+platformXsize; }
  public float xMiddle() { return platformXpos+(platformXsize/2); }
  public float yMiddle() { return platformYpos+(platformYsize/2); }
  
}

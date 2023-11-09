class Ladder
{
  public float ladderXpos;
  public float ladderYpos;
  public float ladderXsize;
  public float ladderYsize;
  PImage ladder;
  
  public Ladder(float x, float y)
  {
    //sets the initial values of the variabels
    ladderXsize = 50;
    ladderYsize = 210;
    ladderXpos = x;
    ladderYpos += y;
    
    //loading and resizing the png for the platforms
    ladder = loadImage("ladder.png");
    ladder.resize(int(ladderXsize),int(ladderYsize));
    
  }
  
  public void drawLadder()
  {
    //this draws the ladders
    image(ladder, ladderXpos, ladderYpos);
  }
  
  //this sets the positions of the different sides of the ladders
  public float ladderTop()     { return ladderYpos; }
  public float ladderBottom()  { return ladderYpos+ladderYsize; }
  public float ladderLeft()    { return ladderXpos; }
  public float ladderRight()   { return ladderXpos+ladderXsize; }
  public float ladderxMiddle() { return ladderXpos+(ladderXsize/2); }
  public float ladderyMiddle() { return ladderYpos+(ladderYsize/2); }
  
}

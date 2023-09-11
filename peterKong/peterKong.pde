//Peter Kong
//Xavier Mclarey

float peterX, peterY;
float peterSize = 100;
PImage peter;

void setup()
{
  size(1400,900);
  peter = loadImage("peter griffin 2.png");
  peter.resize(0, int(peterSize) );
  
  peterX = (width/2)-peterSize/2;
  peterY = (height/2)-peterSize/2;
}

void draw()
{
  background(0);
  
  image(peter, peterX, peterY);

  //peterX += 5;
  //if(peterX > width)
  //{
  //  peterX =- peterSize;
  //  peterSize = random(height);
  //}
}

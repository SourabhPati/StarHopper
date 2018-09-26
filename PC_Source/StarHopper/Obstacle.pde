class Obstacle
{
  PVector pos;
  PVector vel;
  float shape;
  PImage obst1;
  PImage obst2;
  PImage [] obst3;
  float frame;
  float wide;
  float tall;
  
  
  Obstacle(PVector pos,float shape)
  {
    this.pos = pos;
    this.shape = shape;
    frame = 0;
    obst1 = new PImage();
    obst2 = new PImage();
    obst3 = new PImage[6];
    loadSprites();
  }
  
  void put()
  {
    stroke(255);
    vel = new PVector(-5 + stateFactor,0);
    if(shape<1)
    {
      image(obst1,pos.x,pos.y - obst1.height);
       wide = obst1.width;
       tall = obst1.height;
    }
    else if(shape<2)
    {
      image(obst2,pos.x,pos.y - obst2.height + 10);
       wide = obst2.width;
       tall = obst2.height;
    }
    else
    {
      frame = (frame + 0.3) % 6;
      image(obst3[(int)frame],pos.x,pos.y - obst3[(int)frame].height + 53);
        wide = obst3[(int)frame].width;
      tall = obst3[(int)frame].height;
    }
    pos.add(vel);
  }
  
  boolean done()
  {
    if(pos.x < -200 )
      return true;
    return false;
  }
  
  void gameState()
  {
    score++;
    if(score % 2 == 0)
      stateFactor -= 0.33;
  }
  
  void loadSprites()
  {
    obst1 = loadImage("Data/obstacle1/tree" + (int)random(1,3) + ".png");
    obst2 = loadImage("Data/obstacle2/rock" + (int)random(1,3) + ".png");
    for(int i=0;i<6;++i)
      obst3[i] = loadImage("Data/obstacle3/flame" + (i+1) + ".png");
  }
  
  void collide()
  {
    if(m.pos.x > pos.x && m.pos.x < pos.x + wide/2 &&  m.pos.y + m.tall >= pos.y)
    {
      delay(900);
      collision = true;
    }    
  }
}

class MaMan
{
  PVector pos;
  PVector vel;
  PVector g;
  PImage maMan;
  PImage [] maManRun;
  PImage [] maManJump;
  float tall;
  float frameRun;
  float frameJump;
  boolean Jumping;
  
  MaMan(PVector pos)
  {
    this.pos = pos;
    g = new PVector(0,0.43);
    vel = new PVector(0,-15);
    maMan = new PImage();
    maManRun = new PImage[6];
    maManJump = new PImage[4];
    frameRun = frameJump =0;
  }
  
  void put()
  {
     Jumping = false;
     if(pos.y<b.vertHeight)
        jump();
      if(keys['w'] || arrows[0])
        jump();
      if(keyCode == DOWN){}
      if(keys['d'] || arrows[2])
        moveRight();
      else if(keys['a'] || arrows[1])
        moveLeft();
      else
      {
        if(!Jumping)
          image(maMan,pos.x,pos.y - tall);
      }
  }
  
  void jump()
  {
     frameJump = (frameJump + 0.058) % 4;
     tall = maManJump[(int)frameJump].height;
     image(maManJump[(int)frameJump],pos.x,pos.y - tall);
     pos.add(vel);
     vel.add(g);
     if(pos.y>b.vertHeight)
      {
        vel.y = -15;
        pos.y = b.vertHeight;
      }
      Jumping = true;
  }
  void moveRight()
  {
    if(!Jumping)
    {
      frameRun = (frameRun + 0.15) % 6;
      image(maManRun[(int)frameRun],pos.x,pos.y - tall);
    }
    if(pos.x<1919 - tall/2)
      pos.x+=5;
  }
  void moveLeft()
  {
    if(!Jumping)
    {
      frameRun = (frameRun + 0.15) % 6;
      tall = maManRun[(int)frameRun].height;
      image(maManRun[(int)frameRun],pos.x,pos.y - tall);
    }
    if(pos.x >1)
      pos.x-=5;
  }
  
  void loadSprites()
  {
    maMan = loadImage("Data/MaMan/idle/stand.png");
    for(int i = 0;i<6;++i)
      maManRun[i] = loadImage("Data/MaMan/run/run" + (i+1) + ".png");
    for(int i = 0;i<4;++i)
      maManJump[i] = loadImage("Data/MaMan/jump/jump" + (i+1) + ".png");
    tall = maMan.height;
  }
  
}

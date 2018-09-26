class Star
{
  float radius;
  PVector vel;
  PVector pos;
  
  
  Star(float r)
  {
    this.radius = r;
    vel = new PVector(-3,0);
    pos = new PVector(random(0,1920),random(0,1080));
  }
  
  void put()
  {
    vel.x += stateFactor;
    stroke(255);
    if(random(1)<0.3)
      stroke(random(255));
    strokeWeight(radius);
    point(pos.x,pos.y);
    if(pos.x<0)
    {
      pos.x = 1920;
      pos.y = random(0,1080);
    }
    pos.add(vel);
    vel.x -= stateFactor;
  }
}

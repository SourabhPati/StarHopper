void settings()
{
  fullScreen();
}

int fps = 60;
boolean left,right,up;
ArrayList<Obstacle> obstacles;
ArrayList<Star> Stars;
int score = 1;
float stateFactor = 0;
PImage GameOver = new PImage();
boolean collision = false;
int collisionScreenTimer = 0;

BaseLine b = new BaseLine(10,850);
MaMan m = new MaMan(new PVector(5,850));

void setup()
{
  orientation(LANDSCAPE);
  m.loadSprites();
  obstacles = new ArrayList<Obstacle>();
  Stars = new ArrayList<Star>();
  for(int i = 0; i<500 ; i++)
    Stars.add(new Star(3));
  GameOver = loadImage("GameOver.png");
  left = right = up = false;
}

void draw()
{
  if(!collision)
  {
    background(0);
    renderObstacles();
    renderStars();
    b.put();
    m.put();
  }
  else
  {
    handleCollision();
  }
}


void mousePressed()
{
  if(mouseY < m.pos.y - m.tall - 10)
  {
     up = true;
  }
  if(mouseX < m.pos.x)
    left = true;
  else if(mouseX >m.pos.x)
    right = true;
}

void mouseReleased()
{
  up = left = right = false;
}

void renderObstacles()
{
  if(random(1)<0.009 && obstacles.size()<3)
    obstacles.add(new Obstacle(new PVector(1920,850),random(0,3)));
    
  for(int i = obstacles.size() - 1 ; i>=0 ; --i)
  {
    Obstacle temp = obstacles.get(i);
    temp.put();
    if(temp.done())
    {
      temp.gameState();
      obstacles.remove(temp);
    }
    temp.collide();
  }
}

void renderStars()
{
  for(int j = 0; j<Stars.size(); j++)
  {
    Star s = Stars.get(j);
    s.put();
  }
}

void handleCollision()
{
  String [] ar = new String[1];
  ar[0] = Integer.toString((score-1));
  collisionScreenTimer++;
  background(0);
  image(GameOver,720,300);
  textSize(54);
  text("Final Score = " + (score-1) ,750,700);
  if(collisionScreenTimer > 3*fps)
    this.getActivity().finish();
}

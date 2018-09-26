void settings()
{
  fullScreen();
}

int fps = 60;
boolean [] keys = new boolean[128];
ArrayList<Obstacle> obstacles;
ArrayList<Star> Stars;
int score = 1;
float stateFactor = 0;
PImage GameOver = new PImage();
boolean collision = false;
int collisionScreenTimer = 0;
String [] HighScore;
int tempHigh;
boolean [] arrows = new boolean[3];


BaseLine b = new BaseLine(10,850);
MaMan m = new MaMan(new PVector(5,850));

void setup()
{
  m.loadSprites();
  obstacles = new ArrayList<Obstacle>();
  Stars = new ArrayList<Star>();
  for(int i = 0; i<500 ; i++)
    Stars.add(new Star(3));
  GameOver = loadImage("GameOver.png");
  setupHighScore();
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


void keyPressed()
{
  if(keyCode != UP && keyCode != LEFT && keyCode != RIGHT && keyCode != DOWN)
    keys[key] = true;
  else if(keyCode == UP) arrows[0] = true;else if(keyCode == LEFT) arrows[1] = true; else if(keyCode == RIGHT) arrows[2] = true;
}

void keyReleased()
{
  if(keyCode != UP && keyCode != LEFT && keyCode != RIGHT && keyCode != DOWN)
    keys[key] = false;
  else if(keyCode == UP) arrows[0] = false;else if(keyCode == LEFT) arrows[1] = false;else if(keyCode == RIGHT) arrows[2] = false;
}


void setupHighScore()
{
  HighScore = new String[1];
  HighScore = loadStrings("HighScore.txt");
  if(HighScore == null)
     tempHigh = 0;
  else
     tempHigh = Integer.parseInt(HighScore[0]);
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
  if((score -1) > Integer.parseInt(HighScore[0]))
    saveStrings("HighScore.txt",ar);
  text("Final Score = " + (score-1) ,750,700);
  if(collisionScreenTimer > 2*fps)
    exit();
}

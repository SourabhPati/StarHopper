class BaseLine
{
  float thickness;
  float vertHeight;
  
  BaseLine(float t,float v)
  {
    this.thickness = t;
    this.vertHeight = v;
  }
  
  void put()
  {
    stroke(255);
    strokeWeight(thickness);
    line(0,vertHeight,width,vertHeight);
    showScore();
  }
  
  void showScore()
  {
    textSize(44);
    text("SCORE :  " + (score-1) ,15,70);
    text("High Score :  " + tempHigh ,1520, 70);
    if((score-1) > tempHigh)
      tempHigh++;
  }
}

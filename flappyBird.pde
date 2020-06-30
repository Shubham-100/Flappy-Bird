import ddf.minim.*;
Minim minim;
AudioPlayer point,hit,wing;

Game g;
boolean game = false;
int score = 0, high = 0;

void setup()
{
  size(600, 800);
  PImage titlebaricon = loadImage("icon.jpg");
  surface.setIcon(titlebaricon);
  g = new Game();
  minim = new Minim(this);
  point = minim.loadFile("point.wav");
  hit = minim.loadFile("pipehit.wav");
  wing = minim.loadFile("fly.wav");
  fill(0);
  textAlign(CENTER);
  textSize(50);
}

void draw()
{
  if (game)
  { 
    g.birdY += g.birdSpeedY;
    g.moveBg();
    g.isOut();
    g.pipes();
    g.scores();
    g.drawBird();
    g.birdSpeedY += 0.12;
    g.isCollided();
  } 
  
  else 
  {
    if (score > high)
      high = score;
    image(g.start, 0, 0);
    if (mousePressed)
    {
      game = true;
      score = 0;
    } 
    text("High Score: "+high, width/2,height/2 + 80);
    text("Your Score: "+score, width/2,height/2 + 175);
  }
}  

void mousePressed()
{
  g.birdSpeedY -= 4.25;
  wing.play();
  wing.rewind();
}
public class Game
{ 
  PImage bg1, bg2, bird, pipe1, pipe2, start;
  float bg1X, bg1Y, bg2X, bg2Y, birdX, birdY, birdSpeedY, pipeX, pipe1Y, pipe2Y, gap = 150.0;
  float rad = 25.0, circleX, circleY;  // assumed radius of bird
  Game()
  {    
    pipeX = width - 45.0;
    bg1X = bg1Y = 0;
    birdX = width/4;
    birdY = height/2;
    circleX = birdX + rad;
    circleY = birdY + rad;
    bg2Y = 0;
    birdSpeedY = 0.5;
    bg1 = loadImage("back.png");
    bg2X = bg1.width;
    bg2 = loadImage("back.png");
    bird = loadImage("flappy.png");
    pipe1 = loadImage("pipe.png");
    pipe2 = loadImage("pipe.png");
    pipe1Y = random(-pipe1.height + 50, -300.0);
    pipe2Y = pipe1Y + pipe1.height + gap;
    start = loadImage("start.png");
    image(start, 0, 0);
  }

  void moveBg()
  {
    if (bg1X > -bg1.width)
    {
      bg1X -= 5.00;
      bg2X -= 5.00;
      image(bg1, bg1X, bg1Y);
      image(bg2, bg2X, bg2Y);
    } else
    {
      bg1X = 0;
      bg2X = bg1.width;
    }
  }

  void drawBird()
  {
    image(bird, birdX, birdY);
    circleX = birdX + rad;
    circleY = birdY + rad;
  }

  void isOut()
  {
    if (birdY < 0 || birdY > height)
    {
     // hit.play();
     // hit.rewind();
      game = false;
      birdX = width/4;
      birdY = height/2;
    }
  }

  void pipes()       
  {
    if (pipeX == - 45.00)
    {
      pipeX = width - 45.00; 
      pipe1Y = random(-pipe1.height + 50, -300.0);
      pipe2Y = pipe1Y + pipe1.height + gap;
    } else
    {
      image(pipe1, pipeX, pipe1Y);    //upper pipe
      image(pipe2, pipeX, pipe2Y);    //bottom pipe
    }

    pipeX -= 5.00;
  }

  void isCollided()
  { 
    if ( circleX + rad >= pipeX && circleX + rad <= pipeX + 45.0  && ((circleY -  rad <= pipe1Y + pipe1.height) || (circleY + rad >= pipe2Y)))
    {
      //hit.play();
      //hit.rewind();
      delay(50);
      game = false;
      g = new Game();
    }
  }

  void scores()
  {
    if (circleX - rad == pipeX)
    {
      score++; 
      //point.play();
      //point.rewind();
    }
    text("Score: "+ score, width/2, 50);
  }
};

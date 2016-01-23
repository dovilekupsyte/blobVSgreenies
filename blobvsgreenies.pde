void setup()
{
  size(500, 300);
  
  ball = new Ball();
}

Ball ball;

void draw()
{
  background(255);
  ball.render();
  ball.update();
}


class Ball
{
  PVector pos;
  PVector up;
  PVector forward;
  float size;
  float eyes;
  float iris;
  
  Ball(float x, float y)
  {
    pos = new PVector(x, y);
    up = new PVector(0, -5);
    forward = new PVector(+1, 0);
    this.size=25;
    this.eyes=6;
    this.iris=3;
  }

  Ball()
  {
    this(50, 250);
  }
  void update()
  {

    if (keyPressed)
    {
      if (key==CODED)
      {
        if (keyCode==UP)
        {
          pos.add(up);
        }
        if(keyCode==LEFT);
        {
          pos.sub(forward);
        }
        if(keyCode==RIGHT)
        {
          pos.add(forward);
        }
      }
    }
  }

  void render()
  {
    pushMatrix();
    translate(pos.x, pos.y);
    fill(255, 0, 0);
    noStroke();
    ellipse(0, 0, size, size);
    fill(255);
    noStroke();
    ellipse(-5, -2, eyes, eyes);
    ellipse(3, -2, eyes, eyes);
    fill(0);
    ellipse(-4, -1, iris, iris);
    ellipse(3, -1, iris, iris);
    stroke(0);
    strokeWeight(3);
    line(9, 0, 20, 0);
    popMatrix();
  }
}


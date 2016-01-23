class Ball
{
  PVector pos;
  PVector upright;
  PVector forward;
  float radius;
  float angle;
  float frequency;
  float size;
  float eyes;
  float iris;
  
  Ball(float x, float y)
  {
    this.radius=50;
    this.angle-=frequency;
    this.frequency=2;
    pos = new PVector(x, y);
    upright = new PVector(+radius, +(75+sin(radians(angle))*(radius)));
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
      if (key=='w')
      {
         pos.add(upright);
      }
      if (key=='d')
      {
        pos.add(forward);
      }
      if (key=='a')
      {
        pos.sub(forward);
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


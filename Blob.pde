class Blob extends GameObject
{
  char move;
  char left;
  char right;
  char shoot;

  int lives;

  Blob()
  {
    super(width*0.5f, height*0.5f, 50);
  }

  Blob(char move, char left, char right, char shoot, float startx, float starty, color c)
  {
    super(startx, starty, 50);
    this.move=move;
    this.left=left;
    this.right=right;
    this.shoot=shoot;
    this.c=c;
    lives=5;
  }

  int elapsed = 12;

  void update()
  {
    forward.x=sin(theta);
    forward.y=-cos(theta);
    if (keys[move])
    {
      pos.add(PVector.mult(forward, speed));
    }
    if (keys[left])
    {
      theta-=0.1f;
    }
    if (keys[right])
    {
      theta += 0.1f;
    }
    /*if(keys[shoot] && elapsed>12)
     {*/

    if (pos.x<0)
    {
      pos.x=0;
    }
    if (pos.x>width)
    {
      pos.x=width;
    }
    if (pos.y<0)
    {
      pos.y=0;
    }
    if (pos.y>height)
    {
      pos.y=height;
    }
    elapsed++;
  }

  void render()
  {
    pushMatrix();
    translate(pos.x, pos.y);
    stroke(0);
    fill(c);
    text("Lives: "+lives, w, 20);
    rotate(theta);
    noFill();
    ellipse(halfw, halfw, halfw, halfw);
    popMatrix();
  }
}
class Blob extends GameObject
{
  PVector velocity;
  float gravity;
  float jump;
  float speed;
  float ground;
  char move;
  char left;
  char right;
  char shoot;

  int lives;

  Blob()
  {
    super(width*0.5f, height*0.5f, 50);
  }

  Blob(char move, char left, char right, float startx, float starty, color c)
  {
    super(startx, starty, 50);
    velocity=new PVector(0, 0);
    this.gravity=0.5f;
    this.jump=150.0f;
    this.speed=10;
    this.ground=height-50;
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
    if(pos.y<ground)
    {
      speed+=gravity;
    }
    else
    {
      speed=0;
    }
    if(pos.y>=ground && jumpKey==true)
    {
      velocity.y = -speed;
    }
    speed=5;
    if (keys[left])
    {
      pos.sub(PVector.mult(side, speed));
    }
    if (keys[right])
    {
      pos.add(PVector.mult(side, speed));
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
    stroke(255);
    fill(255);
    text("Lives: "+lives, w, 20);
    rotate(theta);
    noFill();
    ellipse(halfw, halfw, halfw, halfw);
    popMatrix();
  }
}
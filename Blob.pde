class Blob extends GameObject
{
  PVector velocity;
  float gravity;
  float jump;
  float speed;
  float ground;
  float dir;
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
    super(startx, starty, 75);
    velocity=new PVector(0, 0);
    this.gravity=0.5f;
    this.jump=10;
    this.speed=10;
    this.ground=height-75;
    this.dir=0;
    this.left=left;
    this.right=right;
    this.shoot=shoot;
    this.c=c;
    lives=5;
  }

  int elapsed = 12;

  void update()
  {
    if(pos.y<ground)
    {
      velocity.y+=gravity;
    }
    else{velocity.y=0;
    }
    if(pos.y>=ground && jumpKey==true)
    {
      velocity.y = -jump;
    }
    PVector nextPos = new PVector(pos.x, pos.y);
    nextPos.add(velocity);
    float offset=0;
    if(nextPos.x>offset && nextPos.x<(width-offset));
    {
      pos.x=nextPos.x;
    }
    if(nextPos.y>offset && nextPos.y<(height-offset));
    {
      pos.y=nextPos.y;
    }
    speed=5;
    if (keys[left])
    {
      pos.sub(PVector.mult(side, speed));
      dir=-1;
    }
    if (keys[right])
    {
      pos.add(PVector.mult(side, speed));
      dir=1;
    }
    
    if(pos.x<0)
    {
      pos.x = 0;
    }
    
    if (pos.x > width-75)
    {
      pos.x = width-75;
    }
    
    elapsed++;
  }

  void render()
  {
    pushMatrix();
    translate(pos.x, pos.y);
    stroke(0);
    fill(255, 0, 0);
    ellipse(halfw, halfw, halfw, halfw);
    //eyes
    //dir used for flipping the drawing
    fill(255);
    ellipse(halfw-(5*dir), halfw-5, 6, 6);
    ellipse(halfw+(5*dir), halfw-5, 6, 6);
    fill(0);
    ellipse(halfw-(4*dir), halfw-5, 3, 3);
    ellipse(halfw+(6*dir), halfw-5, 3, 3);
    //gun
    fill(0);
    rect(halfw+(5*dir), halfw, 20*dir, 3);
    popMatrix();
    text("Lives: "+lives, 20, 20);
  }
}
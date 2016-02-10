class Blob extends GameObject
{
  PVector velocity;
  float gravity;
  float jump;
  float speed;
  float ground;
  float size;
  float dir;
  char up;
  char left;
  char right;
  char shoot;
  
  int lives;

  boolean jumpKey = false;

  Blob()
  {
    pos.x=halfw;
    pos.y=0;
    velocity=new PVector(0, 0);
    this.gravity=0.5f;
    this.jump=10;
    this.speed=10;
    this.ground=height-75;
    this.size=25;
    this.dir=0;
    this.left='A';
    this.right='D';
    this.up='W';
    this.shoot=' ';
    this.c=color(255, 0, 0);
    lives=5;
  }
  
  int elapsed = 12;

  void update()
  {
    if (keys[up])
    {
      jumpKey=true;
    } else
    {
      jumpKey=false;
    }
    if (pos.y<ground)
    {
      velocity.y+=gravity;
    } else {
      velocity.y=0;
    }
    if (pos.y>=ground && jumpKey==true)
    {
      velocity.y = -jump;
    }
    PVector nextPos = new PVector(pos.x, pos.y);
    nextPos.add(velocity);
    float offset=0;
    if (nextPos.x>offset && nextPos.x<(width-offset));
    {
      pos.x=nextPos.x;
    }
    if (nextPos.y>offset)// && nextPos.y<(height-offset));
    {
      pos.y=nextPos.y;
    }
    speed=5;
    if (keys[left])
    {
      pos.sub(PVector.mult(side, speed));
      dir=-1;
      flip=true;
    }
    if (keys[right])
    {
      pos.add(PVector.mult(side, speed));
      dir=1;
      flip=false;
    }

    if (keys[shoot]  && elapsed > 12)
    {
      // Create a new bullet instance and add it to the arraylist of bullets
      Bullet bullet = new Bullet();
      bullet.pos.x = pos.x;
      bullet.pos.y = pos.y;
      bullet.pos.add(PVector.mult(side, 2));
      bullet.c = c;
      gameObjects.add(bullet);
      elapsed = 0;
    }

    if (pos.x<25+halfw)
    {
      pos.x = 25+halfw;
    }

    if (pos.x > width-50)
    {
      pos.x = width-50;
    }

    elapsed++;
  }

  void render()
  {
    pushMatrix();
    translate(pos.x, pos.y);
    stroke(0);
    fill(255, 0, 0);
    ellipseMode(CENTER);
    ellipse(0, 0, size, size);
    //eyes
    //dir used for flipping the drawing
    fill(255);
    ellipse(0-(5*dir), 0-5, 6, 6);
    ellipse(0+(5*dir), 0-5, 6, 6);
    fill(0);
    ellipse(0-(4*dir), 0-5, 3, 3);
    ellipse(0+(6*dir), 0-5, 3, 3);
    //gun
    fill(0);
    rect(0+(10*dir), 5, 20*dir, 3);
    popMatrix();
    textSize(14);
    text("Lives:\t"+lives, width*0.25f, 50);
  }
}
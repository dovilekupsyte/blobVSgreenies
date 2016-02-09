class Greenie extends GameObject
{
  float startx;
  float starty;
  float speed;
  float dir;
  float health;
  float w;
  float h;
  color c;
  
  Greenie(float speed, float health)
  {
    this.speed=speed;
    this.health=health;
    this.dir=0;
    this.w=40;
    this.h=30;
    this.c=color(0, 255, 0);
  }
  
  void update()
  {
    if(dir==0)
    {
      pos.add(PVector.mult(side, speed));
    }
    else if(dir==1)
    {
      pos.sub(PVector.mult(side, speed));
    }
  }
  
  void render()
  {
    pushMatrix();
    translate(pos.x, pos.y);
    noStroke();
    fill(c);
    rectMode(CENTER);
    rect(0, 0, w, h);
    popMatrix();
  }
}
 
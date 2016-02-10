class Bullet extends GameObject
{
  float speed;
  Bullet()
  {
    this.speed = 1.1f;
    w = 10;
  }
  
  void render()
  {
    pushMatrix();
    translate(pos.x, pos.y);
    rectMode(CENTER);
    rect(0, 0, 10, 2);
    popMatrix();    
  }
  
  void update()
  {
    if(flip==false)
    {
      side.mult(speed);
      pos.add(side);
    }
    if(flip==true)
    {
      side.mult(speed);
      pos.sub(side);
    }
    
    if (pos.x < 0 || pos.y < 0 || pos.x > width || pos.y > height)
    {
      // Im dead!
      gameObjects.remove(this);
    }
  }
}
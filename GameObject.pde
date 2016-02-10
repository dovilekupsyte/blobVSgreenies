abstract class GameObject
{
  PVector pos;
  PVector side;
  float theta=0.0f;
  float w;
  float halfw;
  color c;
  
  GameObject()
  {
    this(width*0.5f, height*0.5f, 50);
  }
  
  GameObject(float x, float y, float w)
  {
    pos= new PVector(0, 0);
    side= new PVector(+1, 0);
    this.w=w;
    this.halfw=w*0.5f;
    this.theta=0.0f;
  }
  
  abstract void update();
  abstract void render();
}
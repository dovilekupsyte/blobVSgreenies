abstract class GameObject
{
  PVector pos;
  PVector forward;
  float theta=0.0f;
  float w;
  float halfw;
  float speed=5.0f;
  color c;
  
  GameObject()
  {
    this(width*0.5f, height*0.5f, 50);
  }
  
  GameObject(float x, float y, float w)
  {
    pos= new PVector(x, y);
    forward = new PVector(0, -1);
    this.w=w;
    this.halfw=w*0.5f;
    this.theta=0.0f;
  }
  
  abstract void update();
  abstract void render();
}
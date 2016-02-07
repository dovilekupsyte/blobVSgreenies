void setup()
{
  size(500, 300);
  background(0);
  Blob blob = new Blob('W', 'A', 'D', 200, height-50, color(255, 0, 0));
  gameObjects.add(blob);
}

ArrayList<GameObject> gameObjects= new ArrayList<GameObject>();

boolean[] keys = new boolean[512];
boolean jumpKey = false;

void draw()
{
  background(0);
  
  for(int i=gameObjects.size()-1; i>=0; i--)
  {
    GameObject go=gameObjects.get(i);
    go.update();
    go.render();
  }
}

void keyPressed()
{
  keys[keyCode]=true;
  if(key=='w' || key=='W')
  {
    jumpKey=true;
  }
  else
  {
    jumpKey=false;
  }
}
void keyReleased()
{
  keys[keyCode]=false;
}
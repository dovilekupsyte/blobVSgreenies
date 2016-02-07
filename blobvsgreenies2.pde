void setup()
{
  size(500, 300);
  background(255);
  Blob blob = new Blob('w', 'a', 'd', ' ', 200, height/2, color(255, 0, 0));
  gameObjects.add(blob);
}

ArrayList<GameObject> gameObjects= new ArrayList<GameObject>();

boolean[] keys = new boolean[512];

void keyPressed()
{
  keys[keyCode]=true;
}
void keyReleased()
{
  keys[keyCode]=false;
}

void draw()
{
  background(255);
  
  for(int i=gameObjects.size()-1; i>=0; i--)
  {
    GameObject go=gameObjects.get(i);
    go.update();
    go.render();
  }
}
final int menu=0;
final int play=1;
final int gameOver=2;
int state=menu;


ArrayList<GameObject> gameObjects= new ArrayList<GameObject>();

boolean[] keys = new boolean[512];

boolean flip = false;



void setup()
{
  size(500, 300);
  background(255);
  fill(255);
  
  Blob blob = new Blob();
  gameObjects.add(blob);
  Greenie g1 = new Greenie(0, -100, 5, 1);
  gameObjects.add(g1);
}

void showMenu()
{
  background(0);
  fill(255);
  printText("Blob VS Greenies", 48, 100);
  printText("WAD to move, SPACE to shoot", 32, 200);
  printText("Press SPACE to play!", 40, 250);
  if(keys[' '])
  {
    state=1;
  }
}

void gameOver()
{
  background(0);
  fill(255);
  printText("Blob VS Greenies", 48, 100);
  printText("GAME OVER", 48, 200);
  printText("Press SPACE to play", 32, 250);
  if(keys[' '])
  {
    state=0;
  }
}

void play()
{
  background(255);
  for(int i = gameObjects.size()-1; i>=0; i--)
  {
    GameObject go = gameObjects.get(i);
    go.update();
    go.render();
  }
  
  //check for collisions
  for(int i = gameObjects.size()-1; i>=0; i--)
  {
    GameObject og = gameObjects.get(i);
    if(og instanceof Greenie)
    {
      for(int j = gameObjects.size() - 1 ; j >= 0   ;j --)
      {
        GameObject ob = gameObjects.get(j);
        if(ob instanceof Blob)
        {
          if(og.pos.dist(ob.pos)<og.halfw+ob.halfw)
          {
            ((Blob) ob).lives--;
            if(((Blob) ob).lives==0)
            {
              gameObjects.remove(ob);
              state=2;
              break;
            }
          }
        }
        if(ob instanceof Bullet)
        {
          if(og.pos.dist(ob.pos)<og.halfw)
          {
            gameObjects.remove(og);
            gameObjects.remove(ob);
          }
        }
      }
    }
  }
}
void printText(String text, int size, int y)
{
  textSize(size);
  int tw=(int) textWidth(text);
  int x=(width/2)-(tw/2);
  text(text, x, y);
}

void draw()
{
  switch(state)
  {
    case 0:
      showMenu();
      break;
      
    case 1:
      play();
      break;
    
    case 2:
      gameOver();
      break;
  }
}

void keyPressed()
{
  keys[keyCode]=true;
  
  if(state==play)
  {
    if(keys['a'])
    {
      flip=true;
    }
    else
    {
      flip=false;
    }
  }
}
void keyReleased()
{
  keys[keyCode]=false;
}
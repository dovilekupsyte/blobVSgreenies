final int menu=0;
final int play=1;
final int gameOver=2;
int state=menu;
float gx, gy;

ArrayList<Greenie> greens = new ArrayList<Greenie>();
ArrayList<GameObject> gameObjects= new ArrayList<GameObject>();

boolean[] keys = new boolean[512];

boolean hit=false;
boolean flip = false;



void setup()
{
  size(500, 300);
  background(255);
  fill(255);
  
  Blob blob = new Blob();
  gameObjects.add(blob);
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

void reset()
{
  for (int i = 0 ; i < gameObjects.size() ; i ++)
  {
      GameObject child = gameObjects.get(i);
      if (child instanceof Blob)
      {
        Blob  blob = (Blob) gameObjects.get(i);
        blob.lives = 5;     
      }
      if (child instanceof Greenie)
      {
        gameObjects.remove(child);
      }
  }
}

void play()
{
  background(255);
  if(frameCount % 120 == 0)
  {
    Greenie g2 = new Greenie (1, 1);
    g2.pos.x=0;
    g2.pos.y=235;
    greens.add(g2);
    gameObjects.add(g2);
    println(g2.pos.y);
  }
  
  for(int i = gameObjects.size()-1; i>=0; i--)
  {
    GameObject go = gameObjects.get(i);
    go.update();
    go.render();
  }
  collide();
}

void collide()
{
  for(int i=gameObjects.size()-1; i>=0; i--)
  {
    GameObject go=gameObjects.get(i);
    if(go instanceof Greenie)
    {
      //println("bl\t"+go.pos.x);
      for(int j=gameObjects.size()-1; j>=0; j--)
      {
        GameObject other= gameObjects.get(j);
        if(other instanceof Blob)
        {
          if(go.pos.dist(other.pos)<40)
          {
            ((Blob) other).lives--;
            gameObjects.remove(go);
            if(((Blob) other).lives==0)
            {
              state=2;
            }
          }
        }
        if(other instanceof Bullet)
        {
          if(go.pos.dist(other.pos)<10)
          {
            hit=true;
            gameObjects.remove(go);
            gameObjects.remove(other);
            break;
          }
          else
          {
            hit=false;
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
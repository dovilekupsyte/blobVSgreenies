Button[] menuButtons;
final int menu=0;
final int level1=1;
final int level2=2;
int state=menu;

boolean drawBox;
void setup()
{
  size(500, 300);
  background(255);
  fill(255);
  menuButtons = new Button[1];
  menuButtons[0]=new Button("Play", width/2, 200);
  drawBox=false;
  showMenu();
  
  
}

ArrayList<GameObject> gameObjects= new ArrayList<GameObject>();

boolean[] keys = new boolean[512];
boolean jumpKey = false;
boolean flip = false;



void draw()
{
  switch(state)
  {
    case menu:
      showMenu();
      break;
      
    case level1:
      background(255);
      Blob blob = new Blob('A', 'D', ' ', 200, height-75, color(255, 0, 0));
      gameObjects.add(blob);
      Greenie g1 = new Greenie(0, -100, 5, 1);
      gameObjects.add(g1);
      for(int i=gameObjects.size()-1; i>=0; i--)
      {
        GameObject go=gameObjects.get(i);
        go.update();
        go.render();
      }
      break;
    
    default:
      exit();
      break;
  }
  
}
void showMenu()
{
  background(0);
  textAlign(CENTER);
  fill(255);
  textSize(28);
  text("Bolb VS Greenies", width/2, 100);
  menuButtons[0].draw(drawBox);
  
}
void mousePressed()
{
  if(state==menu)
  {
    if(menuButtons[0].containsMouse())
    {
      state=level1;
    }
  }
}
void keyPressed()
{
  keys[keyCode]=true;
  if(key=='A' || key=='a')
  {
    flip=true;
  }
  if(key=='D' || key=='d')
  {
    flip=false;
  }
  if(key=='W' || key=='w')
  {
    jumpKey=true;
  }
}
void keyReleased()
{
  keys[keyCode]=false;
  if(key=='W' || key=='w')
  {
    jumpKey=false;
  }
}
final int menu=0;
final int play=1;
final int gameOver=2;
int state=menu;
float gx, gy;
int score;
int goal;
float frequency;
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
  goal=5;
  frequency=180;
}

void showMenu()
{
  background(0);
  fill(255);
  printText("Blob VS Greenies", 32, 100);
  printText("WAD to move, SPACE to shoot", 12, 200);
  printText("Press SPACE to play!", 14, 250);
  if (keys[' '])
  {
    state=1;
  }
}

void gameOver()
{
  background(0);
  fill(255);
  printText("Blob VS Greenies", 32, 100);
  textSize(20);
  textAlign(CENTER);
  text("Score: "+score, width/2, 150);
  textAlign(LEFT);
  printText("GAME OVER", 16, 200);
  printText("Press SPACE to play", 14, 250);
  if (keys[' '])
  {
    state=0;
  }
}

void reset()
{
  for (int i = 0; i < gameObjects.size(); i ++)
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
  background(154, 222, 245);
  drawBorder();
  drawPlatform();
  checkScore();

  if (frameCount % frequency == 0)
  {
    Greenie g2 = new Greenie (1, 1);
    g2.dir=0;
    g2.pos.x=0;
    g2.pos.y=235;
    greens.add(g2);
    gameObjects.add(g2);
  }
  if (score>10)
  {
    if (frameCount % (frequency+30) == 0)
    {
      Greenie g2 = new Greenie (1, 1);
      g2.dir=1;
      g2.pos.x=width;
      g2.pos.y=235;
      greens.add(g2);
      gameObjects.add(g2);
    }
  }

  for (int i = gameObjects.size()-1; i>=0; i--)
  {
    GameObject go = gameObjects.get(i);
    go.update();
    go.render();
  }
  collide();
}


void collide()
{
  for (int i=gameObjects.size()-1; i>=0; i--)
  {
    GameObject go=gameObjects.get(i);
    if (go instanceof Greenie)
    {
      //println("bl\t"+go.pos.x);
      for (int j=gameObjects.size()-1; j>=0; j--)
      {
        GameObject other= gameObjects.get(j);
        if (other instanceof Blob)
        {
          if (go.pos.dist(other.pos)<40)
          {
            ((Blob) other).lives--;
            gameObjects.remove(go);
            if (((Blob) other).lives==0)
            {
              state=2;
            }
          }
        }
        if (other instanceof Bullet)
        {
          if (go.pos.dist(other.pos)<10)
          {
            score++;
            gameObjects.remove(go);
            gameObjects.remove(other);
            break;
          } else
          {
            hit=false;
          }
        }
      }
    }
  }
}

void checkScore()
{
  if (score==goal)
  {
    frequency=frequency-30;
    goal=score*2;
  }
}

void printText(String text, int size, int y)
{
  textSize(size);
  int tw=(int) textWidth(text);
  int x=(width/2)-(tw/2);
  text(text, x, y);
}

void drawBorder()
{
  println(frequency);
  text("Score: "+score, 400, 50);
  rectMode(CORNER);
  fill(212, 138, 36);
  strokeWeight(1.5);
  rect(0, 0, 25, 200);
  rect(0, 250, width, 50);
  rect(width-25, 0, 25, 200);
  //bricks
  float brick;
  float halfb;
  brick=25;
  halfb=brick/2;
  for (int i=0; i<16; i++)
  {
    line(0, i*halfb, brick, i*halfb);
    line(width-brick, i*halfb, width, i*halfb);
    line(0, (height-50)+(halfb*i), width, (height-50)+(halfb*i));
  }
  float y1, y2;
  y1=0;
  y2=halfb;
  for (int i=0; i<8; i++)
  {
    line(halfb, y1, halfb, y2);
    line(width-halfb, y1, width-halfb, y2);
    y1=y1+brick;
    y2=y2+brick;
  }
  //floor bricks
  float x1, x2, ya, yb;
  x1=halfb;
  x2=brick;
  ya=250;
  yb=ya+halfb;
  for (int i=0; i<2; i++)
  {
    for (int j=0; j<20; j++)
    {
      line(x1, ya, x1, yb);
      x1=x1+brick;
    }
    ya=yb;
    yb=yb+halfb;
    for (int j=0; j<20; j++)
    {
      line(x2, ya, x2, yb);
      x2=x2+brick;
      /*ya=yb;
       yb=yb+halfb;
       x2=x2+brick;*/
    }
    x1=halfb;
    x2=brick;
    ya=yb;
    yb=yb+halfb;
  }
  strokeWeight(1);
}

void drawPlatform()
{
  rectMode(CORNER);
  float px1, px2, py1, py2;
  px1=width/5;
  px2=px1*3;
  py1=175;
  py2=25;
  strokeWeight(1.5);
  fill(212, 138, 36);
  rect(px1, py1, px2, py2);
  line(px1, py1+12.5, px1+px2, py1+12.5);

  //bricks
  float brick=25;
  float halfb=brick/2;
  float bx, by;
  bx=px1+halfb;
  by=px1+brick;
  for (int i=0; i<12; i++)
  {
    line(bx, py1, bx, py1+halfb);
    bx=bx+brick;
    line(by, py1+halfb, by, py1+brick);
    by=by+brick;
  }
  strokeWeight(1);
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
}
void keyReleased()
{
  keys[keyCode]=false;
}
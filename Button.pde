class Button
{
  float x;
  float y;
  color textc;
  color hoverc;
  float size;
  float textw;
  String text;
  
  Button(String text, float x, float y)
  {
    this.text=text;
    this.x=x;
    this.y=y;
    this.size=18;
    this.textw=textWidth(text);
    this.textc=color(0, 255, 0);
    this.hoverc=color(255, 0, 0);
  }
  
  void draw(boolean on)
  {
    textSize(size);
    if(containsMouse())
    {
      fill(hoverc);
    }
    else
    {
      fill(textc);
    }
    text(text, x, y);
  }
  
  boolean containsMouse()
  {
    if(mouseX > x-textw && mouseX < x+textw + textw && mouseY < y && mouseY > y - size ) 
      return true;
    else return false;
  }
}
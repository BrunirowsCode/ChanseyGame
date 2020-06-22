class Item
{
  PVector position;
  PVector dimention;
  boolean visible;
  int type;
  
  Item(int t)
  {
    type = t;
    int track = int(random(0,3));
    float x = 0;
    switch(track)
    {
      case 0:
        x = width * 0.15;
      break;
      case 1:
        x = width * 0.5;
      break;
      case 2:
        x = width * 0.85;
      break;
    }
    position = new PVector(x, -100);
    dimention = new PVector(100, 100);
    visible = true;
  }
  
  void render()
  {
    if(!visible)return;
    pushMatrix();
    translate(position.x, position.y);
    tint(255);
    if(BOMB ==type)image(bomb, 0, 0, dimention.x, dimention.y);
    else if(STAR == type) image(star, 0, 0, dimention.x, dimention.y);
    popMatrix();
  }
  
  void update()
  {
    position.y+= ITEM_VELOCITY;
  }
}

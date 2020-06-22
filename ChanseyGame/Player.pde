class Player
{
  PVector position;
  PVector dimention;
  int axis;
  boolean left;
  boolean right;
  float xOff;
  Basket basket;
  int damage;

  Player(PVector p)
  {
    position = p;
    axis = 0;
    dimention = new PVector(300, 300);
    xOff = dimention.x * 0.5;
    left = false;
    right = false;
    basket = new Basket(new PVector(0, 35), new PVector(150, 20));
    damage = 0;
  }

  void update()
  {
    axis = 0;
    if (left)--axis;
    if (right)++axis;
    damage = damage > 0 ? damage - 1 : 0;
  }

  void render()
  {
    pushMatrix();
    translate(position.x + xOff * axis, position.y);
    if(damage > 0)
    {
      tint(255, 0, 0);
    }else
    {
      tint(255);
    }
    image(brunirows[axis + 1], 0, 0, dimention.x, dimention.y);
    popMatrix();
  }
  
  void getDamage()
  {
    damage = 10;
  }

  void keyPressed()
  {
    if (keyCode == LEFT)left = true;
    if (keyCode == RIGHT)right =true;
  }

  void keyReleased()
  {
    if (keyCode == LEFT)left = false;
    if (keyCode == RIGHT)right =false;
  }
}

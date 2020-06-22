class Basket
{
  PVector position;
  PVector dimention;
  
  Basket(PVector p, PVector d)
  {
    position = p;
    dimention = d;
  }
  
  void render()
  {
    pushMatrix();
    translate(position.x, position.y);
    fill(0,255,0);
    rect(0,0,dimention.x, dimention.y);
    popMatrix();
  }
}

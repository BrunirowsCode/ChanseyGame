class Cloud
{
  PVector scale;
  PVector position;
  float speed;
  
  Cloud()
  {
    scale = new PVector(random(100, 200), random(50, 100));
    position = new PVector(random(width), random(height * 0.5));
    speed = random(2, 4);
  }
  
  void render()
  {
    pushMatrix();
    translate(position.x, position.y);
    fill(255, 100);
    ellipse(0, 0, scale.x, scale.y);
    popMatrix();
  }
  
  void update()
  {
    position.x += speed;
    if(position.x > width + scale.x * 0.5) position.x = -scale.x  * 0.5;
  }
}

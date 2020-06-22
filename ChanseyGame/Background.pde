class Background
{
  color floor;
  color sky;
  Cloud[] clouds = new Cloud[10];

  Background(color f, color s)
  {
    floor = f;
    sky = s;
    for (int i = 0; i < clouds.length; ++i)
    {
      clouds[i] = new Cloud();
    }
  }

  void render()
  {
    noStroke();
    background(sky);
    fill(floor);
    rect(width * 0.5, height-75, width, 150);
    for (Cloud c : clouds)
    {
      c.render();
    }
  }

  void update()
  {
    for (Cloud c : clouds)
    {
      c.update();
    }
  }
}

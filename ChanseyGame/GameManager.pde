class GameManager
{
  int state;
  Background background;
  Player player;
  ArrayList<Item> items = new ArrayList<Item>();
  int stars;
  int points;
  int delay;

  GameManager()
  {
    state = MENU_STATE;
    background = new Background(color(0, 200, 0), color(0, 160, 255));
    player = new Player(new PVector(width * 0.5, height - 150));
    stars = STARS_NUMBER;
    points = 0;
    delay = 0;
  }

  void render()
  {
    switch(state)
    {
    case MENU_STATE:
      renderMenuState();
      break;
    case GAME_STATE:
      renderGameState();
      break;
    case RESULTS_STATE:
      renderResultsState();
      break;
    }
  }

  void update()
  {
    switch(state)
    {
    case MENU_STATE:

      break;
    case GAME_STATE:
      updateGameState();
      break;
    case RESULTS_STATE:

      break;
    }
  }

  void updateGameState()
  {
    background.update();
    player.update();
    if (delay < 150)
    {
      ++delay;
    } else
    {
      checkCollisions();
      for (Item i : items)
      {
        i.update();
      }
      if (stars > 0)
      {
        if (frameCount % FRAMES_TO_SPAWN == 0)
        {
          spawnItem();
        }
      } else {
        ++delay;
        if (delay > 360)
        {
          state = RESULTS_STATE;
        }
      }
    }
  }

  void renderResultsState()
  {
    background(0);
    textAlign(CENTER);
    fill(255);
    textSize(40);
    text("RESULTS", width * 0.5, height * 0.2);
    textSize(25);
    text("(Chansey)", width * 0.5, height * 0.25);
    image(brunirows[B_FRONT], width * 0.5, height * 0.5, 350, 350);
    textSize(30);
    fill(lerpColor(BAD_COLOR, GOOD_COLOR, (float)points / STARS_NUMBER));
    text(int(((float)points / STARS_NUMBER) * 100) + "%", width * 0.5, height * 0.8);
    
  }

  void spawnItem()
  {
    int type = random(1) <= STAR_APPEREANCE_PERCENTAGE ? STAR : BOMB;
    items.add(new Item(type));
    if (STAR == type)
    {
      --stars;
    }
  }

  void renderMenuState()
  {
    background(0);
    fill(255);
    textSize(40);
    text("BRUNIROWS CODE", width * 0.5, height * 0.2);
    textSize(25);
    text("(Chansey)", width * 0.5, height * 0.25);
    image(brunirows[B_FRONT], width * 0.5, height * 0.5, 350, 350);
    fill(255, sin(radians(frameCount * 10)) * 255);
    text("PRESS SPACE TO CONTINUE", width * 0.5, height * 0.8);
  }

  void renderGameState()
  {
    background.render();
    player.render();
    for (Item i : items)
    {
      i.render();
    }
    fill(0);
    textAlign(CORNER);
    text("Left: "+stars, 25, 50);
    text("Star: "+points, 25, 75);
  }

  void checkCollisions()
  {
    for (Item i : items)
    {
      if (!i.visible)continue;
      if (collisionItem(i))
      {
        i.visible = false;
        if (STAR == i.type)
        {
          ++points;
          correct.play();
        } else if (BOMB == i.type)
        {
          points-=3;
          error.play();
          player.getDamage();
          if (points < 0)points = 0;
        }
      }
    }
  }

  boolean collisionItem(Item i)
  {
    float newX = player.position.x + player.xOff * player.axis;
    PVector newPlayerPos = new PVector(newX, player.position.y);
    Basket b = player.basket;
    PVector worldPosition = PVector.add(newPlayerPos, b.position);
    float sumHalfx = (i.dimention.x + b.dimention.x) * 0.5;
    float sumHalfy = (i.dimention.y + b.dimention.y) * 0.5;
    float distX = abs(worldPosition.x - i.position.x);
    float distY = abs(worldPosition.y - i.position.y);

    return distX <=sumHalfx && distY <= sumHalfy;
  }

  void keyPressed()
  {
    switch(state)
    {
    case MENU_STATE:
      if (key == ' ')
      {
        state = GAME_STATE;
      }
      break;
    case GAME_STATE:
      player.keyPressed();
      break;
    case RESULTS_STATE:

      break;
    }
  }

  void keyReleased()
  {
    if (GAME_STATE == state)
    {
      player.keyReleased();
    }
  }
}

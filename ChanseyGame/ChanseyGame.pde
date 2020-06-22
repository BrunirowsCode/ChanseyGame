import processing.sound.*;
SoundFile correct, error;

GameManager gameManager;
PImage[] brunirows = new PImage[3];
PImage bomb, star;

void setup()
{
  size(600,850);
  brunirows[0] = loadImage("brunirowsLeft.png");
  brunirows[1] = loadImage("brunirowsFront.png");
  brunirows[2] = loadImage("brunirowsRight.png");
  bomb = loadImage("Bomb.png");
  star = loadImage("Star.png");
  correct = new SoundFile(this, "correct.wav");
  error = new SoundFile(this, "error.wav");
  gameManager = new GameManager();
  textAlign(CENTER);
  imageMode(CENTER);
  rectMode(CENTER);
}

void draw()
{
  gameManager.update();
  gameManager.render();
}

void keyPressed()
{
  gameManager.keyPressed();
}

void keyReleased()
{
  gameManager.keyReleased();
}

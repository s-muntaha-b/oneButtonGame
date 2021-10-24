float gravity = 0.4;
PImage bg;

float gravityDelta = 0.01;
float friction = 0.99;
float ground;

Shooter shooter;

void setup() {
  size(1200, 800, P2D);
  bg = loadImage("nightSky.png"); //image from https://savvycow.itch.io/loudypixelsky
  bg.resize(1200,800);
  ground = height;
  
  shooter = new Shooter(width/2, height - 100);
}

void draw() {
  background(bg);
    
  shooter.run();
  
  println("Number of bullets: " + shooter.bullets.size());
}

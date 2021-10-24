float gravity = 0.4;
float gravityDelta = 0.01;
float friction = 0.99;
float ground;
PImage bg;

Shooter shooter;

void setup() {
  size(800, 800, P2D);
  bg = loadImage("nightSky.png");
  bg.resize(800,00);
  ground = height;
  
  shooter = new Shooter(width/2, height - 100);
}

void draw() {
  background(bg);
    
  shooter.run();
  
  println("Number of bullets: " + shooter.bullets.size());
}

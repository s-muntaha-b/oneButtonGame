PImage bg;
PImage destroy;

float gravity = 0.4;
float GravityDel = 0.03;
float friction = 0.99;
float ground;

Shooter shooter;
ArrayList<Target> hatOff;
ArrayList<Destroy> destruction;
int interval = 1000;
int time = 0;

void setup() {
  size(1200, 800, P2D);
  bg = loadImage("nightSky.png"); //image from https://savvycow.itch.io/loudypixelsky
  bg.resize(1200,800);
  ground = height;
  
  shooter = new Shooter(width/2, height - 100);
  hatOff = new ArrayList<Target>();
  destruction = new ArrayList<Destroy>();

  destroy = loadImage("explosion.png");
  destroy.resize(300, 300);
}

void draw() {
  background(bg);
    
  shooter.run();
  
  println("Number of bullets: " + shooter.bullets.size());
}


  boolean hitDetect(PVector p1, PVector p2, PVector hit) {
  hit = hit.copy().div(2);
  
  if (p1.x >= p2.x - hit.x && p1.x <= p2.x + hit.x && p1.y >= p2.y - hit.y && p1.y <= p2.y + hit.y) {
    return true;
  } else {
    return false;
  }
}

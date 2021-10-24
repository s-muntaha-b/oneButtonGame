PImage bg;
PImage destroy;

float gravity = 0.4;
float GravityDel = 0.03;
float friction = 0.99;
float ground;

Shooter shooter;

ArrayList<Target> hatOffs;
ArrayList<Destroy> destroying;
ArrayList<targetTwo> hatOffsTwo;
ArrayList<destroyTwo> destroyingTwo;

int interval = 1000;
int time = 0;

void setup() {
  size(1200, 800, P2D);
  bg = loadImage("nightSky.png"); //image from https://savvycow.itch.io/loudypixelsky
  bg.resize(1200,800);
  ground = height;
  
  shooter = new Shooter(width/2, height - 100);
  hatOffs = new ArrayList<Target>();
  destroying = new ArrayList<Destroy>();
  destroyingTwo = new ArrayList<destroyTwo>();

  destroy = loadImage("witchHatOff.png");
  destroy.resize(300, 300);
  destroyTwo = loadImage("witchHatOff.png");
  destroyTwo.resize(300, 300);
}

void draw() {
  background(bg);
    
  int s = millis();
  
  if (s > time + interval) {
    hatOffs.add(new Target());
    time = s;
  }
  shooter.run();
  
  for (int i=hatOffs.size()-1; i>=0; i--) {
    Target hatOff = hatOffs.get(i);
    
    if (hatOff.on) {
      hatOff.run();
    } else {
      hatOffs.remove(i);
    }
  }
  
  for (int i=destroying.size()-1; i>=0; i--) {
    Destroy destruction = destroying.get(i);
    
    if (destruction.on) {
      destruction.run();
    } else {
      destroying.remove(i);
    }
  }
  
  println("Number of bullets: " + shooter.bullets.size());
  
  surface.setTitle("" + frameRate);
}



  boolean hitDetect(PVector p1, PVector p2, PVector hit) {
  hit = hit.copy().div(2);
  
  if (p1.x >= p2.x - hit.x && p1.x <= p2.x + hit.x && p1.y >= p2.y - hit.y && p1.y <= p2.y + hit.y) {
    return true;
  } else {
    return false;
  }
}

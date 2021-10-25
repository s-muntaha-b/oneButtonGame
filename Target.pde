class Target{
  
  PImage hatTarget;
  
  boolean left;
  boolean on = true;

  PVector position, target;
  PVector targetHatSize = new PVector(250, 150);

  float movementSpeed = 0.009;
  float marginX = random(100, 900);
  float marginY = random(300, 900);
 

  Target() {
    hatTarget = loadImage("witchHatOn.png");
    hatTarget.resize(hatTarget.width/3, hatTarget.height/3); 
    
    float side = random(1);
    float y = random(marginX, height-marginY*2);
    float x1, x2;
    
    if (side < 0.8) {
      left = true;
      x1 = -marginX;
      x2 = width + marginX;
    } else {
      left = false;
      x1 = width + marginX;
      x2 = -marginX;
    }
    target = new PVector(x2, y);  
    position = new PVector(x1, y);  
  }

  void update() {
    if (position.dist(target) < 4) on = false;
    
    for (Bullets bullet : shooter.bullets) {
      if (on && hitDetect(position, bullet.position, targetHatSize)) {
        on = false;
        destroying.add(new Destroy(position.x, position.y));
      }
    }
    if (on) position.lerp(target, movementSpeed);

    }
  void draw() {
    imageMode(CENTER);
    image(hatTarget, position.x, position.y, targetHatSize.x, targetHatSize.y);
  }
  
  void run() {
    update();
    draw();
  }
    
}

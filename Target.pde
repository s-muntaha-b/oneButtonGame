class Target {
  
  boolean left;
  boolean alive = true;

  PVector position, target;
  PVector targetHatSize = new PVector(150, 40);

  float movementSpeed = 0.01;
  float xMargin = 500;
  float yMargin = 150;

  Target() {
    float pickSide = random(1);
    float y = random(yMargin, height-yMargin*2);
    float x1, x2;
    if (pickSide < 0.5) {
      left = true;
      x1 = -xMargin;
      x2 = width + xMargin;
    } else {
      left = false;
      x1 = width + xMargin;
      x2 = -xMargin;
    }
    position = new PVector(x1, y);  
    target = new PVector(x2, y);  
  }
  
  
  void draw() {
    rectMode(CENTER);
    rect(position.x, position.y, targetHatSize.x, targetHatSize.y);
    
  }
  
  void run() {
    draw();
  }
    
}

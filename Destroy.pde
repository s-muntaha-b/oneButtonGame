class Destroy {
  
  PImage hatTargetKill;
  PVector pos;
  boolean on = true;
  int time;
  int life = 200;
  
  Destroy(float x, float y) {
    hatTargetKill = loadImage("witchHatOff.png");
    hatTargetKill.resize(hatTargetKill.width/3, hatTargetKill.height/3);
    imageMode(CENTER);
  
    time = millis();
    pos = new PVector(x, y);
    
    
  }
  
  void update() {
    if (on && millis() > time + life) on = false;
  }
  
  void draw() {
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(radians(random(360)));
    image(hatTargetKill, 0, 0);
    popMatrix();
    noStroke();
    fill(random(255), random(255), 0);
    float sizeVal = 100 + random(-50, 50);
    ellipse(pos.x, pos.y, sizeVal, sizeVal);
  }
  
  
}

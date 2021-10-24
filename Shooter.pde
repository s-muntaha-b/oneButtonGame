class Shooter {

  PVector position;
  PImage staff; //image from http://pixelartmaker.com/art/4a951cd3616efa8
  float rot = 0;
  float rotDelta = 2;
  ArrayList<Bullets> bullets;
  
  Shooter(float x, float y) {
    position = new PVector(x, y);
    bullets = new ArrayList<Bullets>();
    
    staff = loadImage("staff.png");
    staff.resize(staff.width/3, staff.height/3);
    imageMode(CENTER);
  }
  
  void update() {
    rot += rotDelta;    
    if (rot < -90 || rot > 90) rotDelta *= -1;  
    
    // remove all bullets that are no longer alive
    for (int i=bullets.size()-1; i>=0; i--) {
      Bullets bullet = bullets.get(i);
      if (bullet.alive) {
        bullet.run();
      } else {
        bullets.remove(i);
      }
    }
  }
  
  void fire() {
    bullets.add(new Bullets(position.x, position.y, rot));
  }
  
  void draw() {
    pushMatrix(); 
    translate(position.x, position.y);
    rotate(radians(rot));
    image(staff, 0, 0);
    popMatrix();
  }
  
  void run() {
    update();
    draw();
  }

}

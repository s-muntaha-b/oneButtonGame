class Shooter {

  PVector position;
  PImage staff; //image from http://pixelartmaker.com/art/4a951cd3616efa8
  float rot = 0;
  float rotDelta = 3;
  ArrayList<Bullets> bullets;
  
  Shooter(float x, float y) {
    position = new PVector(x, y);
    bullets = new ArrayList<Bullets>();
    
    staff = loadImage("staff.png");
    staff.resize(staff.width/2, staff.height/2);
    imageMode(CENTER);
  }
  
  void update() {
    rot += rotDelta;    
    if (rot < -150 || rot > 80) rotDelta *= -1;  
        for (int i=bullets.size()-1; i>=0; i--) {
      Bullets bullet = bullets.get(i);
      if (bullet.on) {
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

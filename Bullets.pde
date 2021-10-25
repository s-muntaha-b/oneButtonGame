class Bullets{
  
  PVector position;
  PImage starBullet;
  
  float rot;
  float velocity = 18;
  
  int timestamp;
  int life = 800;
  
  boolean on = true;
  
  Bullets(float x, float y, float _rot) {
    position = new PVector(x, y);
    timestamp = millis();
    rot = _rot;
    
    starBullet = loadImage("starBullet.png");
    starBullet.resize(starBullet.width/8, starBullet.height/8);
    imageMode(CENTER);  
  }
   
  void update() {
    // reference from https://www.emanueleferonato.com/2007/04/28/create-a-flash-artillery-game-step-1/
    position.x += velocity * sin(radians(rot));
    position.y -= velocity * cos(radians(rot));

    if (on && millis() > timestamp + life) on = false;
  }
  
  void draw() {
    image(starBullet, position.x, position.y);
  }
  
  void run() {
    update();
    draw();  
  }
  
}

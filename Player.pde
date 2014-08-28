class Player{
  int jumpcnt;
  float y, ang, distance, velocity, jumpHeight;
  
  void init(float jumpHeight){
    this.y        = 376.0;
    this.ang        = 0.0;
    this.velocity   = 0.0;
    this.distance   = 128.0;
    
    this.jumpHeight = jumpHeight;
  }
  
  void update(){
    this.distance   += 16.0;
    this.velocity   += 4.9;
    this.y += this.velocity;
    this.ang += 16.0;
    if(this.y > 376.0){
      this.ang = 0.0;
      this.y = 376.0;
      this.jumpcnt = 0;
    }
  }
  
  void show(){
    pushMatrix();
      translate(128, y);
      rotate(radians(this.ang));
      
      fill(0);
      rect(-24, -24, 48, 48);
    popMatrix();
  }
  
  void jump(){
    if(jumpcnt < 2){
      this.jumpcnt ++;
      this.velocity = -jumpHeight;
    }
  }
  
}

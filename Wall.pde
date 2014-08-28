class Wall{
  float x, y;
  boolean isExist;
  
  void init(float x, float y){
    this.x = x;
    this.y = y;
    this.isExist  = true; 
  }
  
  void show(float distance){
    fill(0);
    if(x-distance < width){
      rect(x - distance, 400-y, 32, y);
    }
  }
  
}

class Wall{
  float x, y;
  private boolean isExist;
  
  void init(float x, float y){
    this.x = x;
    this.y = y;
    this.isExist  = true; 
  }
  
  void show(float distance){
    fill(0);
    if(x - distance < width){
      rect(x - distance, 400-y, 32, y);
    }
    if(this.x < distance-64){
      this.delete();
    }
  }
  
  void delete(){
    this.isExist = false;
  }
  
  boolean getExist(){
    return this.isExist;
  }
}

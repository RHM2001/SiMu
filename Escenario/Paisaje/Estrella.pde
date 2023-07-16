class Estrella{
  
  float x, y;
  int z = 0;
  
  Estrella(){
    x = random(width);
    y = random(250);
  }
  
  void draw(){
    noStroke();
    fill(245, 228, 82, z);
    ellipse(x, y, 10, 10);
  }
  
  void setZ(int z){
   this.z = z; 
  }
  
  int getZ(){
   return this.z; 
  }
  
}

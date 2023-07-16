class Arbol {
  float x, y;
  
  Arbol(float x, float y) {
    this.x = x;
    this.y = y;
  }
  
  void draw() {
    noStroke(); 
    fill(16, 118, 8); 
    triangle(x+100, y, x+200, y+350, x, y+350);
    noFill(); 
    stroke(9, 68, 5); 
    strokeWeight(2); 
    triangle(x+100, y, x+200, y+350, x, y+350); 
    fill(175, 90, 0);
    noStroke();
    quad(x+90, y+400, x+110, y+400, x+100, y+200, x+100, y+200);
  }
}

class Luna {
  float x, y, radio;
  
  Luna(float x, float y, float radio) {
    this.x = x;
    this.y = y;
    this.radio = radio;
  }
  
  void draw() {
    noStroke();
    fill(255, 240, 200);
    ellipse(x, y, radio, radio);
    fill(0, 40);
    ellipse(x - radio/6, y - radio/6, radio/3, radio/3);
    
  }
  
  float getY() {
    return y;
  }
  
  void setY(float newY) {
    y = newY;
  }
  
}

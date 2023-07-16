class Sol {
  float x, y, radio, angulo;
  
  Sol(float x, float y, float radio) {
    this.x = x;
    this.y = y;
    this.radio = radio;
    this.angulo = 0;
  }
  
  void draw() {
    noStroke();
    fill(255, 255, 150);
    ellipse(x, y, radio, radio);
    drawLineas(20, 25, 0.01);
  }
  
  float getY() {
    return y;
  }
  
  void setY(float newY) {
    y = newY;
  }
  
  //Movimineto del sol
  void drawLineas(int cantidad, float longitud, float velocidad) {
    stroke(255, 255, 150);
    strokeWeight(4);
    float incremento = TWO_PI / cantidad;
    for (int i = 0 ; i < cantidad ; i++) {
      float a = angulo + i * incremento;
      float x1 = x + cos(a) * radio / 2;
      float y1 = y + sin(a) * radio / 2;
      float x2 = x + cos(a) * (radio / 2 + longitud);
      float y2 = y + sin(a) * (radio / 2 + longitud);
      line(x1, y1, x2, y2);
    }
    angulo += velocidad;
  }
}

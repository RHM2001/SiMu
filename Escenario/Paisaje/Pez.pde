class Pez {
  float x, y, tam, velocidad, direcion;
  color col;

  Pez(float x, float y, float tam, color col, float velocidad, float direcion) {
    this.x = x;
    this.y = y;
    this.tam = tam;
    this.col = col;
    this.velocidad = velocidad;
    this.direcion = direcion;
  }
  
  void move() {
  float dx = velocidad * cos(direcion);

  x += dx;
}


  void draw() {
    noStroke();
    fill(col);
    
    pushMatrix();
    translate(x, y);
    rotate(direcion);
    ellipse(0, 0, tam, tam/2);
    triangle(-tam/2, 0, -tam*3/4, tam/4, -tam*3/4, -tam/4);
    popMatrix();
  }
}

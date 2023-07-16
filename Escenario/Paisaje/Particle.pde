class Particle {
  float x, y, velocidad, velocidadX;
  boolean isOut;

  Particle(float x, float y) {
    this.x = x;
    this.y = y;
    this.velocidad = random(2, 4);
    this.velocidadX = 0;
    this.isOut = false;
  }

  void move() {
    y += velocidad;
    x += velocidadX;
    
    // Para saber si la particula de la lluvia esta fuera de la pantalla para poder eliminarla
    if (y > height) {
      isOut = true;
    }
  }

  void display() {
    stroke(139, 206, 214);
    strokeWeight(1);
    float angle = atan2(velocidad, velocidad*2);
    
    //Orientacion de la particula teniedo en cuenta la nube
    if(velocidadX > 0){
      line(x, y, x + sin(angle) * 4, y + cos(angle) * 4);
    }
    else{
      line(x, y, x + sin(-angle) * 4, y + cos(-angle) * 4);
    }
    
    noStroke();
  }

  boolean getOut() {
    return isOut;
  }
  
  void setSpeedX(float velocidadX){
    this.velocidadX = velocidadX;
  }
    
    
}

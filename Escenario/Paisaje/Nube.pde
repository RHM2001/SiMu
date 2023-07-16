class Nube {
  float x, y, radio;
  float velocidadX;
  int time;
  ArrayList<Particle> particles;
  boolean lluvia;
  
  Nube(float x, float y, float radio, float velocidadX) {
    this.x = x;
    this.y = y;
    this.radio = radio;
    this.velocidadX = velocidadX;
    this.time = 0;
    this.particles = new ArrayList<Particle>();
    this.lluvia = false;
  }
  
  void draw() {
    noStroke();
    fill(255);
    ellipse(x, y, radio, radio);
    ellipse(x + radio * 0.5, y - radio * 0.3, radio * 0.8, radio * 0.8);
    ellipse(x + radio * 0.8, y + radio * 0.3, radio * 0.8, radio * 0.8);
    ellipse(x - radio * 0.4, y, radio * 0.8, radio * 0.6);
    ellipse(x + radio * 0.4, y, radio * 0.8, radio * 0.6);
    ellipse(x, y - radio * 0.3, radio * 0.8, radio * 0.6);
    ellipse(x, y + radio * 0.3, radio * 0.8, radio * 0.6);
    
  }
  
  void move() {
    x += velocidadX;
    
    // Si la nube sale por la derecha de la pantalla, la ubicamos en la izquierda de la pantalla
    if (x > width + radio && velocidadX > 0) {
      x = -radio;
    }
    // Si la nube sale por la izquierda de la pantalla, la ubicamos en la derecha de la pantalla
    else if(x + radio < 0 && velocidadX < 0) {
      x = width + radio;
    }
    
  }
  
  //Actualizacion de la lluvia
  void update() {
  if (lluvia) {
    time++;
    if (time >= 80) { 
      for (int i = 0; i < 10; i++) {
        //Posición aleatoria de la gota en el eje X en función de la velocidadX de la nube
        float dropX = random(x - radio + velocidadX * time / 30, x + radio + velocidadX * time / 30);
        float dropY = y + 5;
        Particle p = new Particle(dropX, dropY);
        //Velocidad horizontal de la gota en función de la velocidadX de la nube
        p.setSpeedX(-velocidadX / 2);
        particles.add(p);
      }
      time = 0;
    }
  }
}

  
  void display() {

    for (Particle p : particles) {
      p.move();
      p.display();
    
    }
    
    //Comprobacion para eliminar las particulas que no se ven
    for (int i = particles.size()-1; i >= 0; i--) {
      if (particles.get(i).getOut() == true) {
        particles.remove(i);
      }
    }
  }
  
  void setLluvia(boolean x){
    this.lluvia = x;
  }
  
  //Cambiar direccion de la nube
  void setCambiarDireccion(){
    this.velocidadX = -velocidadX;
  }
  
}

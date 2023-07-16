class Goblin {
  PVector position;
  PVector velocidad;
  PVector aceleracion;
  float tam;
  PImage image;
  boolean isJumping;
  float saltoProbabilidad;
  float horizontalSpeed;
  int direcion;
  float y;

  Goblin(float x, float y, float tam, float saltoProbabilidad, float horizontalSpeed, int direcion) {
    position = new PVector(x, y);
    velocidad = new PVector();
    aceleracion = new PVector();
    this.tam = tam;
    image = loadImage("goblin.png");
    isJumping = false;
    this.saltoProbabilidad = saltoProbabilidad;
    this.horizontalSpeed = horizontalSpeed;
    this.direcion = direcion;
    this.y = y;
  }
  
  //Aplciar gravedad al goblin
  void aplicarGravedad() {
    aceleracion.set(0, 0.2);
  }
  
  //El goblin salta respecto al ruido
  void saltoWithNoise(float randomSeed) {
    if (!isJumping) {
      float alturaSalto = map(noise(randomSeed), 0, 1, 50, 150);
      velocidad.y = -sqrt(2 * alturaSalto * 0.2);
      isJumping = true;
    }
  }

  //Movimiento del goblin
  void move() {
    if (random(1) < saltoProbabilidad && !isJumping) {
      saltoWithNoise(random(10000));
    }
  
    if (position.x < 0 || position.x > width - tam) {
      horizontalSpeed *= -1;
    }
    
    if (position.x < 0) {
      direcion = 1;
    } else if (position.x > width - tam) {
      direcion = -1;
    }
  
    position.x += horizontalSpeed;
  }

  
   void display() {
    pushMatrix();
    translate(position.x, position.y);
    scale(tam / image.width * direcion, tam / image.height);

    if (direcion == -1) {
      translate(-image.width, 0);
    }

    if (isJumping) {
      velocidad.add(aceleracion);
      position.add(velocidad);

      if (position.y >= y) {
        position.y = y;
        velocidad.y = 0;
        isJumping = false;
      }
    }

    image(image, 0, 0);
    popMatrix();
  }
}

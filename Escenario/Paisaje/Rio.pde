class Rio {
  ArrayList<Pez> peces;
  float alturaMax = 440;
  float alturaMin = 475;

  Rio(int numPeces ) {
    peces = new ArrayList<Pez>();
  
    for (int i = 0; i < numPeces; i++) {
      float x = random(width);
      float y = random(alturaMin, alturaMax);
      float tam = random(20, 40);
      color col = color(random(255), random(255), random(255));
      float speed = random(1, 4);
      float direction = PI;
      
      Pez pez = new Pez(x, y, tam, col, speed, direction);
      peces.add(pez);
    }
  }
  
  void draw() {
    fill(18, 188, 247);
    rect(0, 430, width, 65);
    
    for (Pez pez : peces) {
      pez.move();
      pez.draw();
      
      if (pez.x < -pez.tam - 30) {
        // Si el pez sale de la pantalla, lo eliminamos del arraylist y generamos uno nuevo de forma aleatoria
        peces.remove(pez);
        float direction = PI;
        float x;
        x = width + 10;
        peces.add(new Pez(x, random(alturaMin, alturaMax), random(20, 40), color(random(255), random(255), random(255)), random(1, 4), direction));
        break;
      }
    }
  }
}

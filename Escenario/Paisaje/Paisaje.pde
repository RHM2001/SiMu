  
  //Para el cambio de color del cielo
  float r = 135;
  float g = 206;
  float b = 235;
  
  //Para el movimiento de la luna y el sol
  int step = 5;
  
  //Atributos para la puerta del castillo
  int altura_puente = 120;
  boolean puerta_levantada;

  Goblin goblin1;
  Goblin goblin2;
  Goblin goblin3;
  Goblin goblin4;
  
  Nube[] nubes;
  Sol sol;
  Arbol[] arboles;
  Rio rio;
  Luna luna;
  Estrellas estrellas;
  
  void setup() {
    
    puerta_levantada = false;
      
    size(1000, 800);
    
    goblin1 = new Goblin(500, 530, 80, 0.01, 1.5, 1);
    goblin2 = new Goblin(20, 580, 80, 0.01, 2, 1);
    goblin3 = new Goblin(200, 710, 50, 0.01, -1.5, -1);
    goblin4 = new Goblin(500, 710, 50, 0.01, -2, -1);
    
    estrellas = new Estrellas();
      
    // Crear nubes
    nubes = new Nube[13];
    nubes[0] = new Nube(100, 100, 60, 0.5);
    nubes[1] = new Nube(200, 80, 80, 0.3);
    nubes[2] = new Nube(400, 120, 50, 0.7);
    nubes[3] = new Nube(600, 50, 40, 0.2);
    nubes[4] = new Nube(300, 60, 70, 0.4);
    nubes[5] = new Nube(500, 120, 30, 0.1);
    nubes[6] = new Nube(350, 100, 90, 0.6);
    nubes[7] = new Nube(750, 100, 90, 0.7);
    nubes[8] = new Nube(350, 100, 90, 0.6);
    nubes[9] = new Nube(700, 140, 10, 0.6);
    nubes[10] = new Nube(80, 90, 50, 0.10);
    nubes[11] = new Nube(800, 120, 50, 0.9);
    nubes[12] = new Nube(900, 130, 70, 0.4);
    
    //Crear sol
    sol = new Sol(width - 80, 90, 120);
    
    //Crear rio
    rio = new Rio(8);
    
    //Crear luna
    luna = new Luna(80, 500, 120);
    
    //Crear arboles
    arboles = new Arbol[12];
    arboles[0] = new Arbol(180, 200);
    arboles[1] = new Arbol(620, 200);
    
    arboles[2] = new Arbol(50, 250);
    arboles[3] = new Arbol(750, 250);
    
    arboles[4] = new Arbol(-50, 350);
    arboles[5] = new Arbol(850, 350);
    
    arboles[6] = new Arbol(510, 600);
    arboles[7] = new Arbol(930, 700);
    arboles[8] = new Arbol(250, 700);
    arboles[9] = new Arbol(140, 640);
    arboles[10] = new Arbol(20, 620);
    arboles[11] = new Arbol(800, 590);
    
  }
 
  
  void draw() {
    
    
    background(r, g, b); // Color celeste
    
    //Se dibujan las estrellas
    estrellas.draw();
    
    //Se dibuja el sol
    sol.draw();
    
    //Se dibuja la luna
    luna.draw();
    
    //Primera montaña
    float xoff = 0;
    float incremento = 0.05;
    float yoff = 100;
    // Dibuja las montañas
    fill(113, 125, 126 );
    beginShape();
    strokeWeight(4);
    for (int i = 0; i < width + 10; i += 10) {
      float y = noise(xoff, yoff) * 100 + 150;
      vertex(i, y);
      xoff += incremento;
    }
    vertex(width, height);
    vertex(0, height);
    endShape(CLOSE);
    
    //Segunda montaña
    float xoff2 = 0;
    float incremento2 = 0.04;
    float yoff2 = 100;
    // Dibuja las montañas
    fill(129, 143, 144);
    beginShape();
    strokeWeight(4);
    for (int i = 0; i < width + 10; i += 10) {
      float y = noise(xoff2, yoff2) * 100 + 210;
      vertex(i, y);
      xoff2 += incremento2;
    }
    vertex(width, height);
    vertex(0, height);
    endShape(CLOSE);
    
    //Tercera montaña
    float xoff3 = 0;
    float incremento3 = 0.03;
    float yoff3 = 100;
    // Dibuja las montañas
    fill(148, 163, 164);
    beginShape();
    strokeWeight(4);
    for (int i = 0; i < width + 10; i += 10) {
      float y = noise(xoff3, yoff3) * 100 + 260;
      vertex(i, y);
      xoff3 += incremento3;
    }
    vertex(width, height);
    vertex(0, height);
    endShape(CLOSE);


    // Dibujar y mover nubes
    for (Nube nube : nubes) {
      nube.draw();
      nube.move();
      
    }
  
    //Terreno
    fill(118, 58, 8);
    rect(0, 400, width, 500);
    
    
    fill(101, 67, 33);
    ellipse(180, 678, 30 * 25, 30 * 10);
    ellipse(390, 678, 30 * 25, 30 * 10);
    ellipse(780, 678, 30 * 25, 30 * 10);
    
    fill(160, 82, 45);
    ellipse(180, 680, 30 * 25, 30 * 10);
    ellipse(390, 680, 30 * 25, 30 * 10);
    ellipse(780, 680, 30 * 25, 30 * 10);
    
    fill(128, 64, 0);
    ellipse(0 ,height-2, 30 * 30, 30 * 10);
    ellipse(400,height-2, 30 * 30, 30 * 10);
    ellipse(800 ,height-2, 30 * 30, 30 * 10);
    
    fill(139, 69, 69);
    ellipse(0 ,height, 30 * 30, 30 * 10);
    ellipse(400,height, 30 * 30, 30 * 10);
    ellipse(800 ,height, 30 * 30, 30 * 10);
    
    //Se dibujael rio con los peces
    rio.draw();
    
    
    
    //CASTILLO
      
    //Cuerpo castillo
    stroke(0, 0 ,0);
    strokeWeight(1); 
    fill(169,169,169);
    rect(400,200,200,200);
      
    //Bloques del castillo
    fill(169,169,169);
    rect(412,175,25,25);
    rect(462,175,25,25);
    rect(512,175,25,25);
    rect(562,175,25,25);
      
    //Torres castillo 
    fill(192,192,192);
    rect(350,150,50,250);
    rect(600,150,50,250);
    triangle(600,150,650,150,625,75);
    triangle(350,150,400,150,375,75);  
      
    //Puerta castillo
    noStroke();
    fill(105,105,105);
    ellipse(500,300,100,100);
    rect(450,300,100,100);
      
    //Puente castillo
    stroke(0);
    fill(140, 82, 31);
    rect(450, 400, 100, altura_puente);
      
    stroke(0);
    line(400, 200, 450, altura_puente + 400);
    line(600, 200, 550, altura_puente + 400);
    
    //Se dibujan los arboles y los goblins de forma que de sensacion de profundidad
    
    arboles[0].draw();
    arboles[1].draw();
      
    goblin1.aplicarGravedad();
    goblin1.move();
    goblin1.display();
    
    arboles[2].draw();
    arboles[3].draw();
      
    goblin2.aplicarGravedad();
    goblin2.move();
    goblin2.display();
    
    arboles[4].draw();
    arboles[5].draw();
      
    goblin3.aplicarGravedad();
    goblin3.move();
    goblin3.display();
    
    arboles[4].draw();
    arboles[5].draw();
    
    goblin4.aplicarGravedad();
    goblin4.move();
    goblin4.display();
    
    for(int i = 6 ; i <= 11 ; i++){
      arboles[i].draw();
    }
    
    //Acciones para la luna y el sol
    if(keyPressed) {
      if (keyCode == LEFT) {
        moveLunaUp();
        moveSolDown();
      }
      
      if (keyCode == RIGHT) {
        moveSolUp();
        moveLunaDown();
      }

    }
     
    //Accion de la lluvia de las nubes
    for (Nube nube : nubes) {
      nube.update();
      nube.display();
    }
      
  }  
  
  //Accion al tocar algunas teclas
  void keyPressed(){
    //Llover
    if(key == 'l'){
      for (Nube nube : nubes) {
        nube.setLluvia(true);
      }
    }
    
    //Dejar de llover
    if(key == 'p'){
      for (Nube nube : nubes) {
        nube.setLluvia(false);
      }
    }
    
    //Mover la direccion de las nubes
    if(key == 'm'){
      for (Nube nube : nubes) {
        nube.setCambiarDireccion();
      }
    }
  }
 
  //Funcion para subir la luna 
  void moveLunaUp() {
    if(luna.getY() >= 90){
      r -= step;
          g -= step;
          b -= step;
      luna.setY(luna.getY() - 10);
      estrellas.setZ(estrellas.getZ() + 2);
    }
  }
  
  //Funcion para bajar el sol
  void moveSolDown() {
    if(sol.getY() <= 500)
      sol.setY(sol.getY() + 10);
  }
  
  //Funcion para subir el sol
  void moveSolUp() {
    if(sol.getY() >= 90){
       r += step;
          g += step;
          b += step;
      sol.setY(sol.getY() - 10);
      estrellas.setZ(estrellas.getZ() - 2);
    }
  }
  
  //Funcion para bajar la luna
  void moveLunaDown() {
    if(luna.getY() <= 500)
      luna.setY(luna.getY() + 10);
  }
  
  //Accion al hacer click para elevar o bajar el puente del castillo
  void mousePressed() {
    if (mouseX >= 450 && mouseX <= 450 + 100 && mouseY >= 400 && mouseY <= 400 + 120 && puerta_levantada == false) { 
      puerta_levantada = true;
      altura_puente = -120;
    }
    
    if (mouseX >= 450 && mouseX <= 450 + 100 && mouseY <= 400 && mouseY >= 400 - 120 && puerta_levantada == true) { 
      puerta_levantada = false;
      altura_puente = 120;
    }
  }
  
  

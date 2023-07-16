class Estrellas {
  
  ArrayList<Estrella> estrellas;
  

  Estrellas(){
    estrellas = new ArrayList<Estrella>();
    for(int i = 0 ; i < 50 ; i++){
      Estrella e = new Estrella();
      estrellas.add(e);
    }
    
  }
  
  void draw(){
    for(Estrella e : estrellas){
      e.draw();  
    }
  }
  
  int getZ(){
   return estrellas.get(0).getZ(); 
  }
  
  void setZ(int z){
    for(Estrella e : estrellas){
      e.setZ(z);  
    }
  }
  
}

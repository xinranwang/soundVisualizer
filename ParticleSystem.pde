class ParticleSystem {
  ArrayList<Particle> particles;
  
  PShape particleShape;
  
  float psX;
  float psY;
  float psZ;

  ParticleSystem(int n, float _psX, float _psY, float _psZ) {
    particles = new ArrayList<Particle>();
    particleShape = createShape(PShape.GROUP);
    
    psX = _psX;
    psY = _psY;
    psZ = _psZ;
    
    for (int i = 0; i < n; i++) {
      Particle p = new Particle();
      particles.add(p);
      particleShape.addChild(p.getShape());
    }
  }

  void update() {
    for (Particle p : particles) {
      p.update();
    }
  }
  
  void setLocation(float _psX, float _psY, float _psZ) {
    psX = _psX;
    psY = _psY;
    psZ = _psZ;
  }
  
  void setEmitter() {
    for (Particle p : particles) {
      if (p.isDead()) {
        p.rebirth(psX, psY, psZ);
      }
    }
  }

  void display() {

    shape(particleShape);
  }
}


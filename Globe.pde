class Globe {
  float radius;
  
  float globeX;
  float globeY;
  float globeZ;

  float rotationX = 0;
  float rotationY = 0;
  float rotationZ = 0;
  
  float rScale = 1;

  float speedX = 0;
  float speedY = 0;
  float speedZ = 0;

  float rotSpeedX = 0;
  float rotSpeedY = 0;
  float rotSpeedZ = 0;

  PImage texmap;   
  
  Globe(float r, float x, float y, float z, PImage img) {
    //radius = r;
    rScale = r;
    globeX = x;
    globeY = y;
    globeZ = z;
    texmap = img;
  }

  void drawGlobe() {
    renderGlobe(radius, globeX, globeY, globeZ, rotationX, rotationY, rotationZ, texmap);
  }
  
  void setRadius(float r) {
    radius = r;
  }
  
  void setGlobeSpeed(float x, float y, float z) {
    speedX = x;
    speedY = y;
    speedZ = z;
  }
  
  void setGlobeRotSpeed(float x, float y, float z) {
    rotSpeedX = x;
    rotSpeedY = y;
    rotSpeedZ = z;
  }
  
  
  void setGlobeLocation(float x, float y, float z) {
    globeX = x;
    globeY = y;
    globeZ = z;
  }
  
  void moveGlobe() {
    radius *= rScale;
    
    globeX += speedX;
    globeY += speedY;
    globeZ += speedZ;
    
    rotationX += rotSpeedX;
    rotationY += rotSpeedY;
    rotationZ += rotSpeedZ;
    
    rotSpeedX *= 0.95;
    rotSpeedY *= 0.95;
    rotSpeedZ *= 0.95;
  }

  void setImage(PImage img) {
    texmap = img;
  }
}


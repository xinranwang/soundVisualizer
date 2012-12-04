import ddf.minim.*;
import ddf.minim.analysis.*;

import processing.video.*;

////////// AUDIO GLOBAL VARIABLES //////////
Minim minim;
AudioPlayer player;
BeatDetect beat;
BeatListener bl;
FFT fftLin;

AudioInput in;

int highestFreq = 0;
float highestAmp = 0;
int lowestFreq = 100000;
float lowestAmp = 100000;

float amplitude = 0;
int frequency = 0;
float remappedAmp;
float remappedFreq;

////////// GRAPHIC VARIABLES //////////

int sDetail = 25;  // Sphere detail setting
float[] cx, cz, sphereX, sphereY, sphereZ;
float sinLUT[];
float cosLUT[];
float SINCOS_PRECISION = 0.5;
int SINCOS_LENGTH = int(360.0 / SINCOS_PRECISION);

ArrayList<Globe> globeList = new ArrayList<Globe>();
ArrayList<PImage> imageList1 = new ArrayList<PImage>();
ArrayList<PImage> imageList2 = new ArrayList<PImage>();
ArrayList<PImage> imageList3 = new ArrayList<PImage>();
ArrayList<PImage> imageList4 = new ArrayList<PImage>();
ArrayList<PImage> imageList5 = new ArrayList<PImage>();
ArrayList<PImage> imageList6 = new ArrayList<PImage>();

int timeCounter = 0;
int timeGap = 15000;
int cameraRadius = 2000;
float cameraAngle = 0;

int timeMode = 0;
int now = 0;

/////////////

//ParticleSystem ps;
ArrayList<ParticleSystem> psList = new ArrayList<ParticleSystem>();
PImage sprite;  
//Vehicle v;
boolean debug = true;


////////// SETUP //////////
void setup() {
  size(1280, 800, P3D);
  stroke(255);
  minim = new Minim(this);

  ////////// AUDIO INPUT
  in = minim.getLineIn();
  in.enableMonitoring();

  ////////// BEAT DETECTER
  beat = new BeatDetect(in.bufferSize(), in.sampleRate());
  //beat = new BeatDetect();
  beat.setSensitivity(300);
  bl = new BeatListener(beat, in);

  ////////// FFT

  fftLin = new FFT(in.bufferSize(), in.sampleRate());
  fftLin.linAverages(10);

  ////////// GRAPHIC
  smooth();

  initializeImages();
  initializeSphere(sDetail);
  initializeGlobes();

  sprite = loadImage("pinksprite.png");
  for (int i = 0; i < 10; i++) {
    ParticleSystem ps = new ParticleSystem(5000, random(-3000, 3000), random(-3000, 3000), random(-3000, 3000));
    psList.add(ps);
  }


  // Writing to the depth buffer is disabled to avoid rendering
  // artifacts due to the fact that the particles are semi-transparent
  // but not z-sorted.
  hint(DISABLE_DEPTH_MASK);
}

////////// DRAW //////////
void draw() {
  background(0);
  lights();

  ////////// AUDIO
  fftLin.forward(in.mix);
  beat.detect(in.mix);

  //////////  GET Amplitude + Frequency
  float totalAmplitude = 0;
  frequency = 0;
  //  int frequency = 0;
  float tempAmp = 20;
  for (int i = 0; i < fftLin.specSize(); i++) {
    totalAmplitude += fftLin.getBand(i);
    if (fftLin.getBand(i) > tempAmp) {
      tempAmp = fftLin.getBand(i);
      frequency = i;
    }
  }
  amplitude = totalAmplitude / fftLin.specSize();

  remappedFreq = map(frequency, 0, 50, 1, 70);
  remappedAmp = map(amplitude, 0, 8, 300, 500);


  if (frequency > highestFreq) {
    highestFreq = frequency;
  }

  if (amplitude > highestAmp) {
    highestAmp = amplitude;
  }

  if (frequency < lowestFreq) {
    lowestFreq = frequency;
  }

  if (amplitude < lowestAmp) {
    lowestAmp = amplitude;
  }


  camera(width / 2 - cameraRadius * sin(cameraAngle), height / 2, cameraRadius * cos(cameraAngle), width / 2, height / 2, 0, 0, 1, 0);
  cameraAngle += 0.005 + amplitude / 100;

  //  monitor();

  ////////// DRAW GLOBES
  tint(255 - remappedFreq, remappedFreq, remappedFreq);

  if (timeMode == 1) {
    if (millis()  - now > timeGap * timeCounter && timeCounter < imageList1.size()) {      
      globeList.get(0).setImage(imageList1.get(timeCounter));
      globeList.get(1).setImage(imageList2.get(timeCounter));
      globeList.get(2).setImage(imageList3.get(timeCounter));
      globeList.get(3).setImage(imageList4.get(timeCounter));
      globeList.get(4).setImage(imageList5.get(timeCounter));
      globeList.get(5).setImage(imageList6.get(timeCounter));
      timeCounter++;
      //println(timeCounter);
    }
  }


  for (int i = 0; i < globeList.size(); i++) {
    //if(amplitude > 0.01) {

    if (beat.isKick() == true || beat.isSnare() == true || beat.isHat() == true) {
      globeList.get(i).setGlobeSpeed(random(-0.3, 0.3), random(-0.3, 0.3), random(-0.3, 0.3));
      globeList.get(i).setGlobeRotSpeed(random(-0.3, 0.3), random(-0.3, 0.3), random(-0.3, 0.3));
    }

    globeList.get(i).setGlobeLocation(globeList.get(i).globeX + random(-remappedFreq, remappedFreq), 
    globeList.get(i).globeY + random(-remappedFreq, remappedFreq), 
    globeList.get(i).globeZ + random(-remappedFreq, remappedFreq));

    globeList.get(i).setRadius(remappedAmp);

    globeList.get(i).moveGlobe();
    globeList.get(i).drawGlobe();
  }


  if (amplitude > 0.01) {
    for (int i = 0; i < 5000 * remappedFreq/2; i++) {
      stroke(255);
      strokeWeight(random(10));
      point(random(-5000, 5000), random(-5000, 5000), random(-5000, 5000));
    }
    for (int i = 0; i < psList.size(); i++) {
      psList.get(i).update();
      psList.get(i).display();
      psList.get(i).setLocation(psList.get(i).psX + random(-frequency, frequency), 
      psList.get(i).psY + random(-frequency, frequency), 
      psList.get(i).psZ + random(-frequency, frequency));
      psList.get(i).setEmitter();
    }
  }
}

////////// MOUSE + KEY //////////
void keyPressed() {
  timeMode = 1;
  now = millis();
}

////////// AUDIO FUNCTIONS //////////
void stop()
{
  // always close Minim audio classes when you are finished with them
  player.close();
  // always stop Minim before exiting
  minim.stop();

  super.stop();
}

void monitor() {
  //////// INFO MONITOR

  text("bufferSize: " + in.bufferSize(), 50, 50);
  text("sampleRate: " + in.sampleRate(), 50, 80);
  text("mix.get(0): " + in.mix.get(0) * 10, 50, 110);

  if (beat.isKick() == true)
    text("beat.isKick: " + beat.isKick(), 50, 140);
  else text("beat.isKick: ", 50, 140);

  if (beat.isSnare() == true)
    text("beat.isSnare: " + beat.isSnare(), 50, 170);
  else text("beat.isSnare: ", 50, 170);

  if (beat.isHat() == true)
    text("beat.isHat: " + beat.isHat(), 50, 200);
  else text("beat.isHat: ", 50, 200);


  text("fftLin.specSize():" + fftLin.specSize(), width/2, 50);
  text("amplitude: " + amplitude, width/2, 80);
  text("frequency: " + frequency, width/2, 110);
  text("remapped amplitude: " + remappedAmp, width/2, 140);
  text("remapped frequency: " + remappedFreq, width/2, 170);
  text("millis(): " + millis(), width/2, 200);
  text("highest freq: " + highestFreq, width/2, 230);
  text("highest amp: " + highestAmp, width/2, 260);
  text("lowest freq: " + lowestFreq, width/2, 290);
  text("lowest amp: " + lowestAmp, width/2, 320);

  println("highest freq: " + highestFreq);
  println("highest amp: " + highestAmp);
  println("lowest freq: " + lowestFreq);
  println("lowest amp: " + lowestAmp);
}


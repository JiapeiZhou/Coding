/*
This program is to do sound visualisation based on Minim and trigonometry.
There ara two main classes, the main one and the form one, to view the coding logically.
*/

//=======================================================================================

import controlP5.*;
import processing.opengl.*;
import processing.sound.*;
import ddf.minim.*;
import ddf.minim.analysis.*;




Minim minim;
ControlP5 cp5;
ControlGroup messageBox;
SoundFile sample;
Amplitude amp;
form f;

int messageBoxResult = -1;
String messageBoxString = "";
float t;                                     //rotating angle for 3D objects
float c1, c2, c3 = min(0,255);               //color of 3D objects
float angle = 0;                             //angle for 3D objects
float x,y,z =0.02;
float s;
float eyeX, eyeY, eyeZ;
float sum;
float smoothFactor = 0.25;
float scale =1.0;
int myColor = color(255);
int d1,d2;
float n,n1;

//===================================================================================

//===================================================================================
void setup() {
  size(800,800,P3D);
  smooth() ;
  cp5 = new ControlP5(this);
  noStroke();
  createMessageBox();
  Button b = cp5.addButton("toggleBox",1,20,20,200,20);
  b.setLabel("Loadfile");
  textFont(createFont("",30));
  f = new form();                            //the class to draw the form
  
  sample = new SoundFile(this, "The 7th Sense.mp3"); 
  sample.loop();

  amp = new Amplitude(this);
  amp.input(sample);

  
  // create a new button with name 'buttonA'
  cp5.addButton("colorA")
     .setValue(0)
     .setPosition(20,60)
     .setSize(200,19)
     ;
  
  // and add another 2 buttons
  cp5.addButton("colorB")
     .setValue(100)
     .setPosition(20,80)
     .setSize(200,19)
     ;
     
  cp5.addButton("colorC")
     .setPosition(20,100)
     .setSize(200,19)
     .setValue(0)
     ;

  PImage[] imgs = {loadImage("button_a.png"),loadImage("button_b.png"),loadImage("button_c.png")};
  cp5.addButton("play")
     .setValue(128)
     .setPosition(20,130)
     .setImages(imgs)
     .setSize(100,19)
     .updateSize()
     ;
     
  cp5.addButton("playAgain")
     .setValue(128)
     .setPosition(120,130)
     .setSize(100,19)
     .setImages(imgs)
     .updateSize()
     ;
  
}

//=====================================================

void draw() {
  lights();
  background(myColor);
  myColor = lerpColor(d1,d2,n);
  n += (1-n)* 0.1; 
  noStroke();
  
  pushMatrix();
  
  
if(messageBox.isVisible()) {
 //   background();
 }
 
  float eyeX = 10 + (sin(angle) * height/2) + height/2;
  float eyeY = 10 + (sin(angle+PI/2) * height/2) + height/2;
  float eyeZ = 10 + (sin(angle+PI) * height/2) + height/2;
  
  camera(eyeX, eyeY, eyeZ, // eyeX, eyeY, eyeZ
         x += 0.02, y += 0.02, z += 0.02, // centerX, centerY, centerZ
         x += 0.01, y += 0.01, z += 0.01); // upX, upY, upZ
         
  angle += 0.02;
  f.fdraw();
  popMatrix();
}

void toggleBox(int theValue) {
  if(messageBox.isVisible()) {
    messageBox.hide();
  } else {
    messageBox.show();
  }
}

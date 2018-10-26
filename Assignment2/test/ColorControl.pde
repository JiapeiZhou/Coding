//=====================create a color control==================================
public void controlEvent(ControlEvent theEvent) {
  println(theEvent.getController().getName());
  n = 0;
}

// function colorA will receive changes from 
// controller with name colorA
public void colorA(int theValue) {
  println("a button event from colorA: "+theValue);
  d1 = d2;
  d2 = color(0,160,100);
}

// function colorB will receive changes from 
// controller with name colorB
public void colorB(int theValue) {
  println("a button event from colorB: "+theValue);
  d1 = d2;
  d2 = color(150,0,0);
}

// function colorC will receive changes from 
// controller with name colorC
public void colorC(int theValue) {
  println("a button event from colorC: "+theValue);
  d1 = d2;
  d2 = color(255,255,0);
}

public void play(int theValue) {
  println("a button event from buttonB: "+theValue);
  d1 = d2;
  d2 = color(0,0,0);
}

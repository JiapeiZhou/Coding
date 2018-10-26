//=====================create a message box before everything else==================================

void createMessageBox() {
  // create a group to store the messageBox elements
  messageBox = cp5.addGroup("messageBox")
                  .setPosition(width/2 - 150,500)
                  .setSize(300,120)
                  .setBackgroundColor(color(0,0,255,100))
                  .hideBar();
  
  // add a TextLabel to the messageBox.
  Textlabel l = cp5.addTextlabel("messageBoxLabel","Do you want to select a new music file?",25,40)
                   .moveTo(messageBox)
                   .setFont(createFont("Arial",14));

  // add the OK button to the messageBox.
  // the name of the button corresponds to function buttonOK
  // below and will be triggered when pressing the button.
  
  Button b1 = cp5.addButton("buttonOK",0,65,80,80,24);
  b1.moveTo(messageBox);
  b1.setColorBackground(color(0,0,0,100));
  b1.setColorActive(color(20));
  // by default setValue would trigger function buttonOK, 
  // therefore we disable the broadcasting before setting
  // the value and enable broadcasting again afterwards.
  // same applies to the cancel button below.
  b1.setBroadcast(false); 
  b1.setValue(1);
  b1.setBroadcast(true);
  b1.setCaptionLabel("Select");
  // centering of a label needs to be done manually 
  // with marginTop and marginLeft
  //b1.captionLabel().style().marginTop = -2;
  //b1.captionLabel().style().marginLeft = 26;
  
  // add the Cancel button to the messageBox. 
  // the name of the button corresponds to function buttonCancel
  // below and will be triggered when pressing the button.
  Button b2 = cp5.addButton("buttonCancel",0,155,80,80,24);
  b2.moveTo(messageBox);
  b2.setBroadcast(false);
  b2.setValue(0);
  b2.setBroadcast(true);
  b2.setCaptionLabel("Cancel");
  b2.setColorBackground(color(0));
  b2.setColorActive(color(20));
  //b2.captionLabel().toUpperCase(false);
  // centering of a label needs to be done manually 
  // with marginTop and marginLeft
  //b2.captionLabel().style().marginTop = -2;
  //b2.captionLabel().style().marginLeft = 16;
}

// function buttonOK will be triggered when pressing
// the OK button of the messageBox.
void buttonOK(int theValue) {
  println("a button event from button OK.");
  sample.stop();
  selectInput("Select a file to process:", "fileSelected"); // when button is clicked, new file loads

  messageBoxResult = theValue;
  messageBox.hide();
}


// function buttonCancel will be triggered when pressing
// the Cancel button of the messageBox.
void buttonCancel(int theValue) {
  println("a button event from button Cancel.");
  messageBoxResult = theValue;
  messageBox.hide();
}

// inputbox is called whenever RETURN has been pressed 
// in textfield-controller inputbox 
void inputbox(String theString) {
  println("got something from the inputbox : "+theString);
  messageBoxString = theString;
  messageBox.hide();


}
// open file to select music to play
void fileSelected(File selection){
  if (selection == null){
    println("Window was closed or the user hit cancel.");
    } else {
    println("User selected " + selection.getAbsolutePath());
  sample = new SoundFile(this, "An Island.mp3"); 
  sample.loop();
    
  }
}

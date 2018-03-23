import org.gamecontrolplus.*;
import net.java.games.input.*;


float xPerso1=0, yPerso1=0;
PFont font;
ControlDevice gpad;
ControlIO control;

void setup(){
  size(800,800);  
  frameRate(60);
  font=createFont("Arial Black",1);
  gpad = control.getMatchedDevice("gamepad_eyes");
}

void draw(){
  xPerso1=gpad.getSlider("EYELID").getValue();
  
  rect(xPerso1,50,30,30);
}

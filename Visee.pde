void viseeGamepad(){
  rollXGamePad=gpad.getSlider("XAim").getValue();
  rollYGamePad=gpad.getSlider("YAim").getValue();
  
  double angleTemp =Math.acos(rollXGamePad);
  if(rollYGamePad>=0){
      angleAim = (float)(-(angleTemp));
  }
  else angleAim = (float)(angleTemp);
  strokeWeight(5);
  line(xS2-17,yS2, xS2-17+100*cos(angleAim),yS2-100*sin(angleAim));
  
}

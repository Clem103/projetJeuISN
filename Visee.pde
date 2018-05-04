void viseeGamepad(){
  rollXGamePad=gpad.getSlider("XAim").getValue();
  rollYGamePad=gpad.getSlider("YAim").getValue();
  
  double angleTemp =Math.acos((double)rollXGamePad);
  if(rollYGamePad<=0){
      angleAim = (float)(-(angleTemp));
  }

  line(xS2-17,yS2, xS2-17,ys2-100);
  
}

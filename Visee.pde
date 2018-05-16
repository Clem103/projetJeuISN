void viseeSouris(){
  xC=mouseX;
  yC=mouseY;
  xP=xs2-16.2;
  yP=ys2;
  xCP=xC-xP;
  yCP=yC-yP;
  angleCurseur = atan2(yCP,xCP);
  line(xP,yP,xP+weaponLength*cos(angleCurseur),yP+weaponLength*sin(angleCurseur));
}

void viseeGamepad(){
  rollXGamePad=gpad.getSlider("XAim").getValue();
  rollYGamePad=gpad.getSlider("YAim").getValue();
  
  double angleTemp =Math.acos(rollXGamePad);
  if(rollYGamePad>0){
      angleAim = (float)(-(angleTemp));
  }
  else angleAim = (float)(angleTemp);
  strokeWeight(5);
  line(xS2-17,yS2, xS2-17+weaponLength*cos(angleAim),yS2-weaponLength*sin(angleAim));
}

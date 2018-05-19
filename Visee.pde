void viseeSouris(){
  xC=mouseX;
  yC=mouseY;
  xP=xs2-16.2;
  yP=ys2;
  xCP=xC-xP;
  yCP=yC-yP;
  angleCurseur = atan2(yCP,xCP);
  strokeWeight(5);
  xEndOfWeapon1 = xP+weaponLength*cos(angleCurseur);
  yEndOfWeapon1 = yP+weaponLength*sin(angleCurseur);
  line(xP,yP,xEndOfWeapon1,yEndOfWeapon1);
  strokeWeight(1);
}

void viseeGamepad(){
  rollXGamePad=gpad.getSlider(XAim).getValue();
  rollYGamePad=gpad.getSlider(YAim).getValue();
  
  double angleTemp =Math.acos(rollXGamePad);
  if(rollYGamePad>0){
      angleAim = (float)(-(angleTemp));
  }
  else angleAim = (float)(angleTemp);
  strokeWeight(5);
  xEndOfWeapon2 = xS2-17+weaponLength*cos(angleAim);
  yEndOfWeapon2 = yS2-weaponLength*sin(angleAim);
  line(xS2-17,yS2,xEndOfWeapon2,yEndOfWeapon2);
  strokeWeight(1);
}

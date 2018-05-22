void viseeSouris(){
  xC=mouseX;
  yC=mouseY;
  xP=xs2-16.2;
  yP=ys2;
  xCP=xC-xP;
  yCP=yC-yP;
  angleCurseur = atan2(yCP,xCP);
  xEndOfWeapon1 = xP+weaponLength*cos(angleCurseur);
  yEndOfWeapon1 = yP+weaponLength*sin(angleCurseur);
  strokeWeight(5);
  stroke(#FF0000);
  line(xP,yP,xEndOfWeapon1,yEndOfWeapon1);
  strokeWeight(1);
}

void viseeGamepad(){
  rollXGamePad=gpad.getSlider(XAim).getValue();    //On récupère les valeurs du stick de visee de la manette
  rollYGamePad=gpad.getSlider(YAim).getValue();
  
  double angleTemp = Math.acos(rollXGamePad);      //On en deduit l'angle par rapport à l'axe x
  if(rollYGamePad>0){
      angleAim = (float)(-(angleTemp));            //Si la valeur trouvée sur l'axe Y du stick est négatif, l'angle l'est aussi
  }
  else angleAim = (float)(angleTemp);
  strokeWeight(5);
  xEndOfWeapon2 = xS2-17+weaponLength*cos(angleAim);
  yEndOfWeapon2 = yS2-weaponLength*sin(angleAim);
  stroke(#00FF00);
  line(xS2-17,yS2,xEndOfWeapon2,yEndOfWeapon2);    //On dessine le laser
  strokeWeight(1);
}

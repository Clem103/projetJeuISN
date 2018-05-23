void viseeSouris(){
  xC=mouseX;                                              //On récupère la coordonnée sur X du curseur
  yC=mouseY;                                              //On récupère la coordonnée sur Y du curseur
  xP=xs2-16.2;                                            //On récupère la coordonnée sur X du sabre
  yP=ys2;                                                 //On récupère la coordonnée sur Y du sabre
  xCP=xC-xP;                                              //On calcule la coordonnée sur X du vecteur représentant la direction du laser
  yCP=yC-yP;                                              //On calcule la coordonnée sur Y du vecteur représentant la direction du laser
  angleCurseur = atan2(yCP,xCP);                          //On récupère l'angle entre l'abcisse et le vecteur(laser) 
  xEndOfWeapon1 = xP+weaponLength*cos(angleCurseur);      //On définit la coordonnée sur X de la fin du laser
  yEndOfWeapon1 = yP+weaponLength*sin(angleCurseur);      //On définit la coordonnée sur Y de la fin du laser
  strokeWeight(5);                                        //On définit l'épaisseur du laser
  stroke(#FF0000);                                        //On définit la couleur du laser
  line(xP,yP,xEndOfWeapon1,yEndOfWeapon1);                //On fait apparaître le alser
  strokeWeight(1);                                        //On remet l'épaisseur des traits à 1 pour les cases
  noStroke();
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

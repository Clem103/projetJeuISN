void bougerPersonnageClavier(){
  if(up && (yPersonnage1>=0))                    yPersonnage1-=pSpeed1;  //Mouvement vers le haut (on soustrait la vitesse (en pixel) sur y) ssi le personnage n'est pas sur le bord haut et que la touche "up" est enfoncée
  if(down && (yPersonnage1<height-tPersonnage))  yPersonnage1+=pSpeed1;  //Mouvement vers le bas (on additionne la vitesse (en pixel) sur y) ssi le personnage n'est pas sur le bord bas et que la touche "down" est enfoncée
  if(left && (xPersonnage1>=0))                  xPersonnage1-=pSpeed1;  //Mouvement vers la gauche (on soustrait la vitesse (en pixel) sur x) ssi le personnage n'est pas sur le bord gauche et que la touche "left" est enfoncée
  if(right && (xPersonnage1<width-tPersonnage))  xPersonnage1+=pSpeed1;  //Mouvement vers la droite (on additionne la vitesse (en pixel) sur x) ssi le personnage n'est pas sur le bord droit et que la touche "right" est enfoncée
}  



void bougerPersonnageGamepad(int pSpeed2){  //Mouvement du personnage à la manette
  
  pSpeedX2 = pSpeed2;
  pSpeedY2 = pSpeed2;
  
  posXGamePad = gpad.getSlider(RightLeft).getValue();    //Récupération des valeurs des axes X et Y de la manette
  posYGamePad = gpad.getSlider(UpDown).getValue();
  
  pSpeedX2=pSpeedX2*abs(posXGamePad);                    //Si le stick est décalé complétement dans une direction la vitesse dans cette direction est maximale
  if(posXGamePad >=0.93 || posXGamePad <=-0.93) pSpeedX2 = pSpeed2;
  pSpeedY2=pSpeedY2*abs(posYGamePad);
  if(posYGamePad >=0.93 || posYGamePad <=-0.93) pSpeedY2 = pSpeed2;
  
  if(posXGamePad <= 0 && (xPersonnage2>=0))                       xPersonnage2-=pSpeedX2;  //en fonction de la position du stick, on augmente (ou diminue) la vitesse dans une direction
  if(posXGamePad >= 0 && (xPersonnage2<=width-tPersonnage))       xPersonnage2+=pSpeedX2;
  if(posYGamePad <= 0 && yPersonnage2>=0)                         yPersonnage2-=pSpeedY2;
  if(posYGamePad >= 0 && (yPersonnage2<=height-tPersonnage))      yPersonnage2+=pSpeedY2;  
}
  
  

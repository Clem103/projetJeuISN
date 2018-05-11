void bougerPersonnageClavier(){
  if(up && (yPersonnage1>=0))        yPersonnage1-=pSpeed1;  //Mouvement vers le haut (on soustrait la vitesse (en pixel) sur y) ssi le personnage n'est pas sur le bord haut et que la touche "up" est enfoncée
  if(down && (yPersonnage1<height-tPersonnage-30)) yPersonnage1+=pSpeed1;  //Mouvement vers le bas (on additionne la vitesse (en pixel) sur y) ssi le personnage n'est pas sur le bord bas et que la touche "down" est enfoncée
  if(left && (xPersonnage1>=20))      xPersonnage1-=pSpeed1;  //Mouvement vers la gauche (on soustrait la vitesse (en pixel) sur x) ssi le personnage n'est pas sur le bord gauche et que la touche "left" est enfoncée
  if(right && (xPersonnage1<width-tPersonnage-15)) xPersonnage1+=pSpeed1;  //Mouvement vers la droite (on additionne la vitesse (en pixel) sur x) ssi le personnage n'est pas sur le bord droit et que la touche "right" est enfoncée
  
  xs1=xPersonnage1;        //Calcul des nouvelles coordonnées des sommets de l'image
  ys1=yPersonnage1;        //s1 = sommet haut gauche, s2 = sommet haut droit, s3 = sommet bas droit, s4 = sommet bas gauche
  xs2=xPersonnage1+tPersonnage;
  ys2=yPersonnage1;
  xs3=xPersonnage1+tPersonnage;
  ys3=yPersonnage1+tPersonnage;
  xs4=xPersonnage1;
  ys4=yPersonnage1+tPersonnage;
}  



void bougerPersonnageGamepad(int pSpeed2){
  
  pSpeedX2 = pSpeed2;
  pSpeedY2 = pSpeed2;
  
  
  posXGamePad = gpad.getSlider("Right & Left").getValue();
  posYGamePad = gpad.getSlider("Up & Down").getValue();
  
  pSpeedX2=pSpeedX2*abs(posXGamePad);
  pSpeedY2=pSpeedY2*abs(posYGamePad);
  
  if(posXGamePad <= 0 && (xPersonnage2>=20))                      xPersonnage2-=pSpeedX2;
  if(posXGamePad >= 0 && (xPersonnage2<=width-tPersonnage-15))    xPersonnage2+=pSpeedX2;
  if(posYGamePad <= 0 && yPersonnage2>=0)                         yPersonnage2-=pSpeedY2;
  if(posYGamePad >= 0 && (yPersonnage2<=height-tPersonnage-30))   yPersonnage2+=pSpeedY2;
   
  xS1=xPersonnage2;        //Calcul des nouvelles coordonnées des sommets de l'image
  yS1=yPersonnage2;        //s1 = sommet haut gauche, s2 = sommet haut droit, s3 = sommet bas droit, s4 = sommet bas gauche
  xS2=xPersonnage2+tPersonnage;
  yS2=yPersonnage2;
  xS3=xPersonnage2+tPersonnage;
  yS3=yPersonnage2+tPersonnage;
  xS4=xPersonnage2;
  yS4=yPersonnage2+tPersonnage;
}
  
  
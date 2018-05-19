void debugHitboxPerso(){
  
  xS1=xPersonnage2;        //Calcul des nouvelles coordonnées des sommets de l'image
  yS1=yPersonnage2;        //s1 = sommet haut gauche, s2 = sommet haut droit, s3 = sommet bas droit, s4 = sommet bas gauche
  xS2=xPersonnage2+tPersonnage;
  yS2=yPersonnage2;
  xS3=xPersonnage2+tPersonnage;
  yS3=yPersonnage2+tPersonnage;
  xS4=xPersonnage2;
  yS4=yPersonnage2+tPersonnage;
  
  if(distancePerso<=(weaponLength*3)){
   stroke(0,255,0); 
  }
  
  line(xS1,yS1,xS2,yS2);
  line(xS2,yS2,xS3,yS3);
  line(xS3,yS3,xS4,yS4);
  line(xS4,yS4,xS1,yS1);
  
  textSize(20);
  text(distancePerso,width>>1,height>>1);
  line(xGp1,yGp1,xGp2,yGp2);
  
}

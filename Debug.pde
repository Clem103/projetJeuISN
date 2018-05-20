void debugHitboxPerso(){
  
  xS1=xPersonnage2;        //Calcul des nouvelles coordonnées des sommets de l'image
  yS1=yPersonnage2;        //s1 = sommet haut gauche, s2 = sommet haut droit, s3 = sommet bas droit, s4 = sommet bas gauche
  xS2=xPersonnage2+tPersonnage;
  yS2=yPersonnage2;
  xS3=xPersonnage2+tPersonnage;
  yS3=yPersonnage2+tPersonnage;
  xS4=xPersonnage2;
  yS4=yPersonnage2+tPersonnage;
  
  xs1=xPersonnage1;        //Personnage 1
  ys1=yPersonnage1;        
  xs2=xPersonnage1+tPersonnage;
  ys2=yPersonnage1;
  xs3=xPersonnage1+tPersonnage;
  ys3=yPersonnage1+tPersonnage;
  xs4=xPersonnage1;
  ys4=yPersonnage1+tPersonnage;
  
  if(distancePerso<=(weaponLength*3)){
   stroke(0,255,0); 
  }
  rectMode(CORNER);
  noFill();
  rect(xs1,ys1,tPersonnage,tPersonnage);
  rect(xS1,yS1,tPersonnage,tPersonnage);
  
  textSize(20);
  text(distancePerso,width>>1,height>>1);
  line(xGp1,yGp1,xGp2,yGp2);
  
}

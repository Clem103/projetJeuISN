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
  
  line(xs1,ys1,xs2,ys2);
  line(xs2,ys2,xs3,ys3);
  line(xs3,ys3,xs4,ys4);
  line(xs4,ys4,xs1,ys1);
  
  line(xS1,yS1,xS2,yS2);
  line(xS2,yS2,xS3,yS3);
  line(xS3,yS3,xS4,yS4);
  line(xS4,yS4,xS1,yS1);
  
  textSize(20);
  text(distancePerso,width>>1,height>>1);
  line(xGp1,yGp1,xGp2,yGp2);
  
}

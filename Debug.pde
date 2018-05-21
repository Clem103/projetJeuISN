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
  else stroke(255,0,0);
  noFill();
  ellipseMode(CENTER);
  ellipse(xGp1,yGp1,10,10);
  ellipse(xGp2,yGp2,10,10);
  ellipse(xGp1,yGp1,tPersonnage*46/50,tPersonnage*46/50);
  ellipse(xGp2,yGp2,tPersonnage*46/50,tPersonnage*46/50);
  
  textSize(20);
  text(distancePerso,width>>1,height>>1);
  line(xGp1,yGp1,xGp2,yGp2);
}

void debugHitboxMap(){
  if(isP1InBackground()) stroke(#0057FF);
  else if (isP2InBackground()) stroke(#5EFF03);
  else stroke(#030303);
  rectMode(CENTER);
  rect(width>>1,height>>1,width-width*0.0390,height-height*0.0651);
  
  ellipseMode(CENTER);
  ellipse(width*0.414,height*0.260,width*0.06,width*0.06);  //ellipse top
  ellipse(width*0.688,height*0.635,width*0.06,width*0.06);  //ellipse right
  ellipse(width*0.1875,height*0.76,width*0.06,width*0.06);  //ellipse left
  noStroke();  
}

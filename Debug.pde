void debugHitboxPerso(){    //Affichage d'informations supplémentaires à propos de la hitbox des personnages
  sommetsPerso();
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

void debugHitboxMap(){      //De même pour les hitbox des éléments du décor
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

void debugRespawn(){    //Affichage des zones de respawn
  rectMode(CORNER);
  stroke(#FFFFFF);
  rect(width>>5,height>>4,width*0.32,height*0.62);
  rect(width*0.25,height/3,width*0.4,height*0.55);
  rect(width*0.6,height>>4,width*0.36,height*0.49);
  noStroke();
}

/* Zones blanches = Zones de spawn
*  Contours noir = hitbox du décor
*  Points numérotés = points de hitbox du sabre laser
*  Cercle autour des personnages = hitbox des personnages
*  Valeurs affichées à gauche, au milieu et à droite = distance entre chaque point de hitbox et le personnage adverse(à gauche et à droite)
*  distance entre les 2 personnages (au mileur)
*/ 

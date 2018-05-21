void debugHitboxPerso(){
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

void debugRespawn(){
  rectMode(CORNER);
  stroke(#FFFFFF);
  rect(width>>5,height>>4,width*0.32,height*0.62);
  rect(width*0.25,height/3,width*0.4,height*0.55);
  rect(width*0.6,height>>4,width*0.36,height*0.49);
  noStroke();
}

void checkHitbox(int numberOfPoints){
  if(hasP1WeaponCollided(numberOfPoints)){
    p2Death();
    laser1.play();
  }
  else if(hasP2WeaponCollided(numberOfPoints)){
    p1Death();
    laser2.play();
  }
  else if(isP1InBackground()){
   //p1LavaDeath(); 
  }
  else if(isP2InBackground()){
   //p2LavaDeath(); 
  }
}

int numberOfHitboxPoints(){
  distanceBetweenPoints = weaponLength;
  while(distanceBetweenPoints >= tPersonnage){
    numberOfPoints++; 
    distanceBetweenPoints = weaponLength/numberOfPoints;
  }
  return numberOfPoints;
}

boolean hasP1WeaponCollided(int numberOfPoints){
  
  xGp1 = (xs1 + xs2 + xs3 + xs4)/4;
  yGp1 = (ys1 + ys2 + ys3 + ys4)/4;
  xGp2 = (xS1 + xS2 + xS3 + xS4)/4;
  yGp2 = (yS1 + yS2 + yS3 + yS4)/4;
  
  distancePerso = sqrt(pow((xGp1 - xGp2),2) + pow((yGp1 - yGp2),2));
  
  if(distancePerso<weaponLength*3){
    for (int i=1;i<=numberOfPoints;i++){
       float xHitboxPoint = xP+weaponLength*cos(angleCurseur)*i/numberOfPoints;
       float yHitboxPoint = yP+weaponLength*sin(angleCurseur)*i/numberOfPoints;
       float distancePointPerso = sqrt(pow((xGp2 - xHitboxPoint),2) + pow((yGp2 - yHitboxPoint),2));
       
       if(debugMode){ 
       stroke(#00FF00);
       ellipse(xHitboxPoint,yHitboxPoint,10,10);
       fill(#00FF00);
       text(i,xHitboxPoint,yHitboxPoint);
       text(i+" : " + distancePointPerso, (width>>3), (height>>2)+i*20);
       noFill();
       }
       
       if(distancePointPerso <= tPersonnage*27/50){
         if(debugMode){
           fill(#FF0000);
           text(i,xHitboxPoint,yHitboxPoint);
           text(i+" : " + distancePointPerso, (width>>3), (height>>2)+i*20);
           noFill();
         }
         return true;
       }
    }
  }
  return false; 
}

boolean hasP2WeaponCollided(int numberOfPoints){
  
  xGp1 = (xs1 + xs2 + xs3 + xs4)/4;
  yGp1 = (ys1 + ys2 + ys3 + ys4)/4;
  xGp2 = (xS1 + xS2 + xS3 + xS4)/4;
  yGp2 = (yS1 + yS2 + yS3 + yS4)/4;
  
  distancePerso = sqrt(pow((xGp1 - xGp2),2) + pow((yGp1 - yGp2),2));
  
  if(distancePerso<weaponLength*3){
    for (int i=1;i<=numberOfPoints;i++){
       float xHitboxPoint = xS2-17+weaponLength*cos(angleAim)*i/numberOfPoints;
       float yHitboxPoint = yS2-weaponLength*sin(angleAim)*i/numberOfPoints;
       float distancePointPerso = sqrt(pow((xGp1 - xHitboxPoint),2) + pow((yGp1 - yHitboxPoint),2));
       
       if(debugMode){
         stroke(#FF0000);
         ellipse(xHitboxPoint,yHitboxPoint,10,10);
         fill(#FF0000);
         text(i,xHitboxPoint,yHitboxPoint);
         text(i+" : " + distancePointPerso, (width*0.875), (height>>2)+i*20);
         noFill();
         noStroke();
       }
       
       if(distancePointPerso <= tPersonnage*27/50){
         if(debugMode){
           fill(#00FF00);
           text(i,xHitboxPoint,yHitboxPoint);
           text(i+" : " + distancePointPerso, (width*0.875), (height>>2)+i*20);
           noFill();
         }
         return true;
       }
    }
  }
  return false; 
}

boolean isP1InBackground(){
 
  if(xGp1+tPersonnage*23/50 >= width-width*0.0195 || xGp1-tPersonnage*23/50 <= width*0.0195){
    return true;
  }
  else if(yGp1+tPersonnage*23/50 >= height-height*0.0325 || yGp1-tPersonnage*23/50<=height*0.0325){
   return true; 
  }
  distanceP1ellipseTop = sqrt(pow(xGp1 - width*0.414,2) + pow(yGp1 - height*0.260,2));
  distanceP1ellipseRight = sqrt(pow(xGp1 - width*0.688,2) + pow(yGp1 - height*0.635,2));
  distanceP1ellipseLeft = sqrt(pow(xGp1 - width*0.1875,2) + pow(yGp1 - height*0.76,2));
  
  if(distanceP1ellipseTop <= (width*0.06)/2){
    return true;
  }
  else if(distanceP1ellipseRight <= (width*0.06)/2){
    return true;
  }
  else if(distanceP1ellipseLeft <= (width*0.06)/2){
    return true;
  }
  else return false; 
}

boolean isP2InBackground(){
  if(xGp2+tPersonnage*23/50 >= width-width*0.0195 || xGp2-tPersonnage*23/50 <= width*0.0195){
    return true;
  }
  else if(yGp2+tPersonnage*23/50 >= height-height*0.0325 || yGp2-tPersonnage*23/50<=height*0.0325){
   return true; 
  }
  distanceP2ellipseTop = sqrt(pow(xGp2 - width*0.414,2) + pow(yGp2 - height*0.260,2));
  distanceP2ellipseRight = sqrt(pow(xGp2 - width*0.688,2) + pow(yGp2 - height*0.635,2));
  distanceP2ellipseLeft = sqrt(pow(xGp2 - width*0.1875,2) + pow(yGp2 - height*0.76,2));
  
  if(distanceP2ellipseTop <= (width*0.06)/2){
    return true;
  }
  else if(distanceP2ellipseRight <= (width*0.06)/2){
    return true;
  }
  else if(distanceP2ellipseLeft <= (width*0.06)/2){
    return true;
  }
  else return false; 
}

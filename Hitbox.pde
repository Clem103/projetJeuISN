void checkHitbox(){
  if(hasP1WeaponCollided(numberOfPoints)){
    //p2Death();
  }
  else if(hasP2WeaponCollided(numberOfPoints)){
    //p1Death();
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
       ellipse(xHitboxPoint,yHitboxPoint,10,10);
       fill(#00FF00);
       text(i,xHitboxPoint,yHitboxPoint);
       text(i+" : " + distancePointPerso, (width*0.875), (height>>2)+i*20);
       noFill();
       }
       
       if(distancePointPerso <= tPersonnage*27/50){
         if(debugMode){
           fill(#FF0000);
           text(i,xHitboxPoint,yHitboxPoint);
           text(i+" : " + distancePointPerso, (width*0.875), (height>>2)+i*20);
         }
         return true;
       }
    }
  }
  return false; 
}

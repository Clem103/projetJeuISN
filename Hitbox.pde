boolean checkHitbox(){
  xGp1 = (xs1 + xs2 + xs3 + xs4)/4;
  yGp1 = (ys1 + ys2 + ys3 + ys4)/4;
  xGp2 = (xS1 + xS2 + xS3 + xS4)/4;
  yGp2 = (yS1 + yS2 + yS3 + yS4)/4;
  
  distancePerso = sqrt(pow((xGp1 - xGp2),2) + pow((yGp1 - yGp2),2));
  return false;
  
}

int numberOfHitboxPoints(){
  distanceBetweenPoints = weaponLength;
  while(distanceBetweenPoints >= tPersonnage){
    numberOfPoints++; 
    distanceBetweenPoints = weaponLength/numberOfPoints;
  }
  return numberOfPoints;
}

boolean hasCollided(int numberOfPoints){
  
  for (int i=1;i<=numberOfPoints;i++){
     float xHitboxPoint = xP+weaponLength*cos(angleCurseur)*i/numberOfPoints;
     float yHitboxPoint = yP+weaponLength*sin(angleCurseur)*i/numberOfPoints;
     ellipse(xHitboxPoint,yHitboxPoint,10,10);
     float distancePointPerso = sqrt(pow((xGp2 - xHitboxPoint),2) + pow((yGp2 - yHitboxPoint),2));
     text(distancePointPerso, (width>>2), (height>>2)+i*20);
     if(distancePointPerso <= tPersonnage){
       return true;
     }
  }
  return false; 
}

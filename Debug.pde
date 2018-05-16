void debugHitboxPerso(){
 
  line(xS1,yS1,xS2,yS2);
  line(xS2,yS2,xS3,yS3);
  line(xS3,yS3,xS4,yS4);
  line(xS4,yS4,xS1,yS1);
  
  textSize(20);
  text(distancePerso,width>>1,height>>1);
  if(distancePerso<=(weaponLength*3)){
   color(0,255,0); 
  }
  line(xGp1,yGp1,xGp2,yGp2);
  
}

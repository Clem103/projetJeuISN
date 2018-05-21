void updateTimer(){
  timer = tpsDeJeu - ((millis())/1000 - tpsInit);
}

void initTimer(){
  tpsInit = millis()/1000;
}

void dispTimer(){
  int dispTimer = timer;
  fill(#FFFFFF);
  text("Temps restant : "+dispTimer+"s",width>>1,height>>5);
  noFill();
}

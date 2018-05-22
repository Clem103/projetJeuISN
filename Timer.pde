void updateTimer(){      //Le compte à rebours est mis à jour chaque frame
  timer = tpsDeJeu - ((millis())/1000 - tpsInit);  //Temps de jeu = temps écoulé depuis le début, mis à jour lorsque le jeu est mis en pause
}

void initTimer(){
  tpsInit = millis()/1000;  //appelé 1 seul fois lorsque le mode 1v1 commence
}

void dispTimer(){  //Affiche en haut de l'écran le temps restant
  int dispTimer = timer;
  fill(#FFFFFF);
  text("Temps restant : "+dispTimer+"s",width>>1,height>>5);
  noFill();
}

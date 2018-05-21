//
// Définition de l'écran d'accueil
//

void ecranAccueil(){
  if(isMusiqueOptionsPlaying){
    MusiqueOptions.stop();
    isMusiqueOptionsPlaying = false;
  }
  if(isMusiqueCreditsPlaying){
    MusiqueCredits.stop();
    isMusiqueCreditsPlaying = false;
  }
  cursor();
  background(fondAccueil);
  if(!isMusiqueAJEPlaying){
    MusiqueAJE.loop();
    isMusiqueAJEPlaying=true;
  }
  noFill();
  stroke(0,0,0);
  rectMode(CENTER);
  textFont(titre,75);
  textAlign(CENTER);
  fill(gameTitleColor);
  text("FightSabers",width>>1,height/5);
  textFont(titre,28);
  noFill();
  
  affichageIconesAccueil();
  
  if(debugMode) text("Debug mode activated",width>>1,28);
  else if(noGamepadMode) text("No suitable device found, no gamepad mode activated",width>>1,28);
  
  if((mouseX<(width>>1)+100 && mouseX>(width>>1)-100 && mouseY<(height/3)+40 && mouseY>(height/3)-40)){       //Souris sur PLAY / JOUER
    fill(255,50); }                                                                                           //Remplissage (ou non) de la case avec blanc un peu transparent 
  else noFill();
  rect(width>>1,height/3,200,80);                                                                             //Réalisation de la case
   
  if (mouseX<(width>>1)+100 && mouseX>(width>>1)-100 && mouseY<(height>>1)+40 && mouseY>(height>>1)-40) {     //Souris sur Options
    fill(255,50); }                                                                                           //Remplissage (ou non) de la case avec blanc un peu transparent
  else noFill();
  rect(width>>1,height>>1,200,80);                                                                            //Réalisation de la case
  
  if (mouseX<(width>>1)+100 && mouseX>(width>>1)-100 && mouseY<(height*0.67)+40 && mouseY>(height*0.67)-40) { //Souris sur Copyrights
    fill(255,50); }                                                                                           //Remplissage (ou non) de la case avec blanc un peu transparent
  else noFill();
  rect(width>>1,height*0.67,200,80);                                                                          //Réalisation de la case
  
  if (mouseX<(width>>1)+100 && mouseX>(width>>1)-100 && mouseY<(height*0.84)+40 && mouseY>(height*0.84)-40) { //Souris sur Fin
    fill(255,50); }                                                                                           //Remplissage (ou non) de la case avec blanc un peu transparent
  else noFill();
  rect(width>>1,height*0.84,200,80);                                                                          //Réalisation de la case
  
  fill(homeTextColor);                                                                                        //Coloration du texte
  text("Play",width>>1,(height/3)+10);                                                                        //Ecriture du texte aux bons emplacements
  text("Options",width>>1,(height>>1)+10);
  text("Credits",width>>1,height*0.67+10);
  text("Exit",width>>1,height*0.84+10);
  noFill();
}

//
//Définition de l'écran de Jeu 1 contre 1
//

void ecranJeu1vs1(){
  background(fondJeu);                   //Apparition de la carte de jeu
  if(!isMusiqueAJEPlaying){              //
    MusiqueAJE.loop();
    isMusiqueAJEPlaying=true;
  }
  
  if(!noGamepadMode){
    bougerPersonnageGamepad(pSpeed2);
    viseeGamepad();
  }
  bougerPersonnageClavier();            //Imports des fonctionnalités de jeu
  viseeSouris();
  affichagePersonnages();
  affichageIconeJeu1vs1();
  checkHitbox(numberOfPoints);
  
  if(debugMode){
    debugHitboxPerso();
    debugHitboxMap();
  }
  
  fill(gameTextColor);                                  //Création des informations pour le retour accueil
  stroke(255,0,0);
  textFont(texte,20);                                  
  text("Space/Espace : Pause",width>>1,height-5,20);
  textFont(texte,25);
  noFill();
  System.out.print(isP1InBackground()+" ");
  
  if(espace){                                          //Si on appuie sur espace, l'écran d'accueil est ouvert (mise en pause du jeu)
    screen=0;
  }
}

//
//Définition de l'écran des options
//

void ecranOptions(){
  if(isMusiqueAJEPlaying){
    MusiqueAJE.stop();
    isMusiqueAJEPlaying=false;
  }
  background(fondOptions);                          //Apparition du fond 
  if(!isMusiqueOptionsPlaying){ 
    MusiqueOptions.loop();
    isMusiqueOptionsPlaying=true;
  }
  cp5.getController("Vitesse Personnage 1").setVisible(true);            //On affiche les barres définies dans le setup{}
  cp5.getController("Vitesse Personnage 2").setVisible(true);
  cp5.getController("Volume musique").setVisible(true);
  cp5.getController("Volume lasers").setVisible(true);
  
  updateOptions();
  affichageIconesOptions();                        //Affichage des icones des options
  
  fill(optionsTextsColor);                         //Création bouton retour accueil
  fill(optionsBackButtonColor);
  textFont(texte,22);
  text("Back / Retour",width>>1,height*0.915);
  if(debugMode){
    fill(#58FF00);
    text("Debug ON",width>>3,height*0.862);
  }
  else{
    fill(#FF001E);
    text("Debug OFF",width>>3,height*0.862);
  }
  if(mouseX<(width>>1)+100 && mouseX>(width>>1)-100 && mouseY<(height*0.9)+40 && mouseY>(height*0.9)-40) {  //Bouton retour à l'écran d'accueil (avec un remplissange semi-transparent au mouse-over)
    fill(255,50);
  }
  else noFill();
  rect(width>>1,height*0.9,200,80);
  
  if(mouseX<(width>>3)+100 && mouseX>(width>>3)-100 && mouseY<(height*0.85)+40 && mouseY>(height*0.85)-40) {  
    fill(255,50);
  }
  else noFill();
  rect(width>>3,height*0.85,200,80);                                                                          //Case "debug"
}

//
//Définition de l'actualisaiton dynamique du menu des options
//

void updateOptions(){   //Ces paramètres sont mis à jour à chaque image tant que l'on est sur l'écran des options
  
  volumeM=(cp5.getController("Volume musique").getValue())/100;    //Réglage des volumes
  MusiqueAJE.amp(0.125*volumeM);
  MusiqueOptions.amp(0.125*volumeM);
  MusiqueCredits.amp(0.125*volumeM);
  
  volumeL=(cp5.getController("Volume lasers").getValue())/100;
  laser1.amp(0.05*volumeL);
  laser2.amp(0.05*volumeL);
}

//
//Définition de l'écran des crédits
//

void ecranCredits(){
  if(isMusiqueAJEPlaying){
    MusiqueAJE.stop();
    isMusiqueAJEPlaying=false;
  }
  background(fondCredits);
  if(!isMusiqueCreditsPlaying){
    MusiqueCredits.loop();
    isMusiqueCreditsPlaying=true;
  }
  textAlign(CENTER);                                                                                          //Création bouton retour accueil
  textFont(texte,22);
  fill(creditsBackButtonColor);
  text("Back / Retour",width>>1,height*0.9+10);
  if (mouseX<(width>>1)+100 && mouseX>(width>>1)-100 && mouseY<(height*0.9)+40 && mouseY>(height*0.9)-40) {   
    fill(255,50);
  }
  else noFill();
  rect(width>>1,height*0.9,200,80);
}

//
//Définition de l'écran de sortie
//

void ecranSortie(){
  background(fondExit);                      //Affichage du fond écran fermer jeu
  affichageIconesExit();                     //Affichage des icones écran fermer jeu
  if(!isMusiqueAJEPlaying){
    MusiqueAJE.loop();
    isMusiqueAJEPlaying=true;
  }
  textAlign(CENTER);                                                  //Affichage question validation
  fill(exitTextColor);
  textFont(texte,30);
  text("Êtes-vous sûr de vouloir quitter ?",width>>1,height/3);                                   
  
  if (mouseX<(width>>2)+100 && mouseX>(width>>2)-100 && mouseY<(height>>1)+40 && mouseY>(height>>1)-40) {  //Bouton Yes
    fill(255,50); }
  else noFill();
  rect(width>>2,height>>1,200,80);
  textFont(texte,30);
  fill(exitYesButtonColor);
  text("Yes",width>>2,(height>>1)+10);
  
  if (mouseX<(width*0.75)+100 && mouseX>(width*0.75)-100 && mouseY<(height>>1)+40 && mouseY>(height>>1)-40) { //Bouton No
    fill(255,50); }
  else noFill();
  rect(width*0.75,height>>1,200,80);
  fill(exitNoButtonColor);
  text("No",width*0.75,(height>>1)+10);
}

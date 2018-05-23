//
// Définition de l'écran d'accueil
//

void ecranAccueil(){
  if(isMusicOptionsPlaying){
    MusiqueOptions.stop();
    isMusicOptionsPlaying = false;
  }
  if(isMusicCreditsPlaying){
    MusiqueCredits.stop();
    isMusicCreditsPlaying = false;
  }
  if(isVictoryMusicPlaying){
    darkSideVMusic.stop();
    brightSideVMusic.stop();
    isVictoryMusicPlaying = false;
  }
  if(isDrawMusicPlaying){
    drawMusic.stop();
    isDrawMusicPlaying = false;
  }
  
  cursor();
  background(fondAccueil);
  
  if(!isMusicAJEPlaying){
    MusiqueAJE.loop();
    isMusicAJEPlaying=true;
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
    fill(255,50);
  }                                                                                           //Remplissage (ou non) de la case avec blanc un peu transparent 
  else noFill();
  rect(width>>1,height/3,200,80);                                                                             //Réalisation de la case
   
  if (mouseX<(width>>1)+100 && mouseX>(width>>1)-100 && mouseY<(height>>1)+40 && mouseY>(height>>1)-40) {     //Souris sur Options
    fill(255,50);
  }                                                                                           //Remplissage (ou non) de la case avec blanc un peu transparent
  else noFill();
  rect(width>>1,height>>1,200,80);                                                                            //Réalisation de la case
  
  if (mouseX<(width>>1)+100 && mouseX>(width>>1)-100 && mouseY<(height*0.67)+40 && mouseY>(height*0.67)-40) { //Souris sur Copyrights
    fill(255,50);
  }                                                                                           //Remplissage (ou non) de la case avec blanc un peu transparent
  else noFill();
  rect(width>>1,height*0.67,200,80);                                                                          //Réalisation de la case
  
  if (mouseX<(width>>1)+100 && mouseX>(width>>1)-100 && mouseY<(height*0.84)+40 && mouseY>(height*0.84)-40) { //Souris sur Fin
    fill(255,50);
  }                                                                                           //Remplissage (ou non) de la case avec blanc un peu transparent
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
  if(!inGame){
    initTimer();
    inGame = true;
    lightSaberOn.play();
    deathmatchAnnouncer.play();
  }
  if(isVictoryMusicPlaying){
    darkSideVMusic.stop();
    brightSideVMusic.stop();
    isVictoryMusicPlaying = false;
  }
  
  if(isDrawMusicPlaying){
    drawMusic.stop();
    isDrawMusicPlaying = false;
  }
  background(fondJeu);                   //Apparition de la carte de jeu
  if(!isMusicAJEPlaying){              
    MusiqueAJE.loop();
    isMusicAJEPlaying=true;
  }
  
  if(!noGamepadMode){
    bougerPersonnageGamepad(pSpeed2);
    viseeGamepad();
  }
  bougerPersonnageClavier();            //Imports des fonctionnalités de jeu
  viseeSouris();
  sommetsPerso();
  affichagePersonnages();
  affichageIconeJeu1vs1();
  checkHitbox(numberOfPoints);
  updateTimer();
  dispTimer();
  
  if(debugMode){
    debugHitboxPerso();
    debugHitboxMap();
    debugRespawn();
  }
  fill(gameTextColor);                                              //Affichage des scores
  stroke(255,0,0);
  textFont(texte,20); 
  fill(#890000);
  text("DarkSide points : " + scoreP1,width>>2,height-15,20); 
  fill(#00FF00);
  text("BrightSide points : " + scoreP2,(width>>2)*3,height-15,20);
  noFill();
  fill(#FFFFFF);                    
  text("Space/Espace : Pause",width>>1,height-15,20);                //Création des informations pour le retour accueil
  textFont(texte,25);
  noFill();
  
  if(espace){                                          //Si on appuie sur espace, l'écran d'accueil est ouvert (mise en pause du jeu)
    screen=0;
    tpsDeJeu = timer;
    inGame=false;
    lightSaberOff.play();
  }
  
  if(timer<=0){
    screen=5;
    inGame = false;
    lightSaberOff.play();
  }
}

//
// Définition de l'écran de fin de partie
// 

void ecranFinPartie(){
 MusiqueAJE.stop();
 isMusicAJEPlaying = false;
 background(fondJeu);
 affichagePersonnages();
 textFont(titre,50);
 fill(gameTitleColor);
 textAlign(CENTER);
 stroke(0,0,0);
 
 if(scoreP1==scoreP2){
   text("It's a draw !\n The scores are " + scoreP1 + " point(s)!",width>>1,height>>2);
   if(!isDrawMusicPlaying){
      drawMusic.play();
      isDrawMusicPlaying=true;
   }
 }
 if(scoreP1<scoreP2){
   text("The BrightSide won\n Its score is " + scoreP2 + " point(s)",width>>1,height>>2);
   if(!isVictoryMusicPlaying){
      brightSideVMusic.play();
      isVictoryMusicPlaying=true;
   }
 }
 if(scoreP1>scoreP2){
   text("The DarkSide won\n Its score is " + scoreP1 + " point(s)",width>>1,height>>2);
   if(!isVictoryMusicPlaying){
      darkSideVMusic.play();
      isVictoryMusicPlaying=true;
   }
 }
 
 fill(gameTextColor);
 text("Do you want to play again?",width>>1,height*0.4);
 noFill();
 rectMode(CENTER);
 if(mouseX<(width>>2)+100 && mouseX>(width>>2)-100 && mouseY<(height>>2)*3+40 && mouseY>(height>>2)*3-40) {
   fill(255,50);
 }
 else noFill();
 rect(width>>2,(height>>2)*3,200,80);
 
 if(mouseX<(width>>2)*3+100 && mouseX>(width>>2)*3-100 && mouseY<(height>>2)*3+40 && mouseY>(height>>2)*3-40){
   fill(255,50);
 }
 else noFill();
 rect((width>>2)*3,(height>>2)*3,200,80);
 
 textFont(texte,22);
 fill(exitYesButtonColor);
 text("Yes",width>>2,(height>>2)*3+10);
 text("No",(width>>2)*3,(height>>2)*3+10);
}

//
//Définition de l'écran des options
//

void ecranOptions(){
  if(isMusicAJEPlaying){
    MusiqueAJE.stop();
    isMusicAJEPlaying=false;
  }
  background(fondOptions);                          //Apparition du fond 
  if(!isMusicOptionsPlaying){ 
    MusiqueOptions.loop();
    isMusicOptionsPlaying=true;
  }
  cp5.getController("Vitesse Personnage 1").setVisible(true);            //On affiche les barres définies dans le setup{}
  cp5.getController("Vitesse Personnage 2").setVisible(true);
  cp5.getController("Volume musique").setVisible(true);
  cp5.getController("Volume lasers").setVisible(true);
  cp5.getController("Volume bruits").setVisible(true);
  cp5.getController("Temps de Jeu").setVisible(true);
  
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
  lightSaber1.amp(0.05*volumeL);
  lightSaber2.amp(0.05*volumeL);
  lightSaberOn.amp(0.25*volumeL);
  lightSaberOff.amp(0.25*volumeL);
  
  volumeB=(cp5.getController("Volume bruits").getValue())/100;
  clicSound.amp(0.25*volumeB);
  deathmatchAnnouncer.amp(0.3*volumeB);
  fellInLava.amp(0.125*volumeB);
}

//
//Définition de l'écran des crédits
//

void ecranCredits(){
  if(isMusicAJEPlaying){
    MusiqueAJE.stop();
    isMusicAJEPlaying=false;
  }
  background(fondCredits);
  if(!isMusicCreditsPlaying){
    MusiqueCredits.loop();
    isMusicCreditsPlaying=true;
  }
  textAlign(CENTER);                                                                                         
  textFont(titre,50);
  fill(gameTitleColor);
  text("Credits",width>>1,height*0.1);
  textFont(texte,30);                                                                                                          //Création bouton retour accueil
  fill(0);                                                                                                                     //Couleurs en DEYGRADEY
  text("Graphism Management : MARSOT Vincent",width>>1,height*0.25);
  fill(51);
  text("Sound Management : MARSOT Vincent & VELLU Clément",width>>1,height*0.35);
  fill(102);
  text("Keyboard + Mouse Support : MARSOT Vincent",width>>1,height*0.45);
  fill(153);
  text("Gamepad Support : VELLU Clément",width>>1,height*0.55);
  fill(204);
  text("Hitbox Algorithm : VELLU Clément",width>>1,height*0.65);
  fill(255);
  text("Gameplay : VELLU Clément & MARSOT Vincent",width>>1,height*0.75);
  
  fill(creditsBackButtonColor);
  textFont(texte,22);
  text("Back / Retour",width>>1,height*0.9+10);
  if (mouseX<(width>>1)+100 && mouseX>(width>>1)-100 && mouseY<(height*0.9)+40 && mouseY>(height*0.9)-40) fill(255,50);
  else noFill();
  rect(width>>1,height*0.9,200,80);
}

//
//Définition de l'écran de sortie
//

void ecranSortie(){
  background(fondExit);                      //Affichage du fond écran fermer jeu
  affichageIconesExit();                     //Affichage des icones écran fermer jeu
  if(!isMusicAJEPlaying){
    MusiqueAJE.loop();
    isMusicAJEPlaying=true;
  }
  textAlign(CENTER);                                                  //Affichage question validation
  fill(exitTextColor);
  textFont(texte,30);
  text("Êtes-vous sûr de vouloir quitter ?",width>>1,height/3);                                   
  
  if (mouseX<(width>>2)+100 && mouseX>(width>>2)-100 && mouseY<(height>>1)+40 && mouseY>(height>>1)-40) {  //Bouton Yes
    fill(255,50);
  }
  else noFill();
  rect(width>>2,height>>1,200,80);
  textFont(texte,30);
  fill(exitYesButtonColor);
  text("Yes",width>>2,(height>>1)+10);
  
  if (mouseX<(width*0.75)+100 && mouseX>(width*0.75)-100 && mouseY<(height>>1)+40 && mouseY>(height>>1)-40) { //Bouton No
    fill(255,50);
  }
  else noFill();
  rect(width*0.75,height>>1,200,80);
  fill(exitNoButtonColor);
  text("No",width*0.75,(height>>1)+10);
}

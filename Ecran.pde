//
// Définition de l'écran d'accueil
//

void ecranAccueil(){
  
  cursor();
  background(fondAccueil);
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
}

//
//Définition de l'écran de Jeu 1 contre 1
//

void ecranJeu1vs1(){
  background(fondJeu);
  if(!noGamepadMode) bougerPersonnageGamepad(pSpeed2);
  bougerPersonnageClavier();
  viseeSouris();
  if(!noGamepadMode)viseeGamepad();
  affichagePersonnages();
  checkHitbox();
  if(debugMode)debugHitboxPerso();
  affichageIconeJeu1vs1();
  
  fill(gameTextColor);
  stroke(255,0,0);
  textFont(texte,20);                                  //Ecriture des différents éléments
  text("Space/Espace : Pause",width>>1,height-5,20);
  textFont(texte,25);
  
  if(espace){                                          //Si on appuie sur espace, l'écran d'accueil est ouvert (mise en pause du jeu)
    screen=0;
  }
}

//
//Définition de l'écran des options
//

void ecranOptions(){
  background(fondAccueil);
  cp5.getController("Vitesse Personnage 1").setVisible(true);            //On affiche les barres définies dans le setup{}
  cp5.getController("Vitesse Personnage 2").setVisible(true);
  cp5.getController("Volume musique").setVisible(true);
  cp5.getController("Volume lasers").setVisible(true);
  
  updateOptions();
  affichageIconesOptions();
  
  fill(optionsTextsColor); 
  text("Résolution",width>>2,(height/5)+10);
  rect(width/2.5,height/5,60,40);
  fill(fleches);
  triangle((width/2.5)-10,(height/5),(width/2.5)+10,(height/5)-10,(width/2.5)+10,(height/5)+10);
  fill(optionsTextsColor);
  rect(width/1.635,height/5,250,40);
  rect(width/1.22,height/5,60,40);
  fill(fleches);
  triangle((width/1.22)+10,(height/5),(width/1.22)-10,(height/5)-10,(width/1.22)-10,(height/5)+10);
  fill(optionsTextsColor);
  rect(width/1.1,height/5,60,40);
  fill(fleches);
  text("OK",width/1.1,height/4.7);
  fill(optionsBackButtonColor);
  textFont(texte,25);
  text("Back / Retour",width>>1,height*0.9+10);
  if(debugMode){
    fill(#58FF00);
    text("Debug ON",width>>3,height*0.85+10);
  }
  else{
    fill(#FF001E);
    text("Debug OFF",width>>3,height*0.85+10);
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
  
  volumeM=(cp5.getController("Volume musique").getValue())/100;    //Réglage du volume
  music.amp(0.125*volumeM);
  
  volumeL=(cp5.getController("Volume lasers").getValue())/100;
  laser.amp(0.05*volumeL);
}

//
//Définition de l'écran des crédits
//

void ecranCredits(){
  background(fondCredits);
  textAlign(CENTER);
  textFont(texte,30);
  fill(creditsBackButtonColor);
  text("Back / Retour",width>>1,height*0.9+10);
  affichageIconeCredits();
  if (mouseX<(width>>1)+100 && mouseX>(width>>1)-100 && mouseY<(height*0.9)+40 && mouseY>(height*0.9)-40) {   //Bouton Retour
    fill(255,50);
  }
  else noFill();
  rect(width>>1,height*0.9,200,80);
}

//
//Définition de l'écran de sortie
//

void ecranSortie(){
  background(fondAccueil);
  textAlign(CENTER);
  fill(exitTextColor);
  textFont(texte,30);
  text("Êtes-vous sûr de vouloir quitter ?",width>>1,height/3);
  affichageIconesExit();
  
  if (mouseX<(width>>2)+100 && mouseX>(width>>2)-100 && mouseY<(height>>1)+40 && mouseY>(height>>1)-40) { //Case Yes
    fill(255,50); }
  else noFill();
  rect(width>>2,height>>1,200,80);
  
  if (mouseX<(width*0.75)+100 && mouseX>(width*0.75)-100 && mouseY<(height>>1)+40 && mouseY>(height>>1)-40) { //Case No
    fill(255,50); }
  else noFill();
  rect(width*0.75,height>>1,200,80);
  
  textFont(texte,30);
  fill(exitYesButtonColor);
  text("Yes",width>>2,(height>>1)+10);
  fill(exitNoButtonColor);
  text("No",width*0.75,(height>>1)+10);
}

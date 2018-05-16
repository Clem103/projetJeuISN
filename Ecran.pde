//
// Définition de l'écran d'accueil
//

void ecranAccueil(){
  
  cursor();
  image(fondAccueil,0,0,width,height);
  noFill();
  stroke(0,0,0);
  rectMode(CENTER);
  textFont(titre,75);
  textAlign(CENTER);
  fill(gameTitleColor);
  text("Titre à trouver",width>>1,height/5);
  textFont(titre,28);
  noFill();
  
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
  image(fondJeu,0,0,width,height);
  bougerPersonnageGamepad(pSpeed2);
  bougerPersonnageClavier();
  affichage();
  viseeSouris();
  viseeGamepad();
 
  
  fill(gameTextColor);
  stroke(255,0,0);
  textFont(texte,20);                                  //Ecriture des différents éléments
  text("Space/Espace : Pause",width>>1,height,20);
  textFont(texte,25);
  
  if(espace){                                          //Si on appuie sur espace, l'écran d'accueil est ouvert (mise en pause du jeu)
    screen=0;
    strokeWeight(1);
  }
}

//
//Définition de l'écran des options
//

void ecranOptions(){
  image(fondAccueil,0,0,width,height);
  cp5.getController("Vitesse Personnage 1").setVisible(true);            //On affiche les barres définies dans le setup{}
  cp5.getController("Vitesse Personnage 2").setVisible(true);
  cp5.getController("Volume musique").setVisible(true);
  cp5.getController("Volume lasers").setVisible(true);
  
  updateOptions();
  
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
  if (mouseX<(width>>1)+100 && mouseX>(width>>1)-100 && mouseY<(height*0.9)+40 && mouseY>(height*0.9)-40) {  //Bouton retour à l'écran d'accueil (avec un remplissange semi-transparent au mouse-over)
    fill(255,50);
  }
  else noFill();
  rect(width>>1,height*0.9,200,80);
}

//
//Définition de l'actualisaiton dynamique du menu des options
//

void updateOptions(){   //Ces paramètres sont mis à jour à chaque image tant que l'on est sur l'écran des options
  
  volumeM=(cp5.getController("Volume musique").getValue())/100;    //Réglage du volume
  music.amp(0.125*volumeM);
  
  volumeE=(cp5.getController("Volume lasers").getValue())/100;
  explode.amp(0.05*volumeE);
}

//
//Définition de l'écran des crédits
//

void ecranCredits(){
  image(fondCredits,0,0,width,height);
  textAlign(CENTER);
  textFont(texte,30);  
  text("Back / Retour",width>>1,height*0.9+10);
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
  image(fondAccueil,0,0,width,height);
  textAlign(CENTER);
  fill(exitTextColor);
  textFont(texte,30);
  text("Êtes-vous sûr de vouloir quitter ?",width>>1,height/3);
  
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

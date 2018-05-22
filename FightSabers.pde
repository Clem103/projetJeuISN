void setup(){
  //fullScreen();                               //La taille de la fenêtre remplie tout l'écran
  size(1280,720);
  frameRate(60);
  titre = createFont("PoliceTitre.ttf",1);    //Initialisation de la police utilisée pour les titres
  texte = createFont("PoliceTexte.ttf",1);    //Initialisation de la police utilisée pour le texte
  smooth();                                   //Rend les contours plus lisses
  
  xPersonnage1 = width>>2;                    //En binaire : décalage à droite des chiffres de 1 (0101 -> 0010). Revient ici à diviser par 2^1  ==> Fludification des calculs
  yPersonnage1 = height>>1;                   //Autre ex: 11010001>>2  -> 00110100 : division par 2^2=4. "left shift" & "right shift"  
 
  xPersonnage2 = (width>>2)*3;                //Positionnement des personnages
  yPersonnage2 = height>>1;
  
    
  screen = 0;                                 //Initialisation de l'écran initial à l'écran d'accueil
  
  lightSaber1 = new SoundFile(this, "LightSaberHit1.mp3");                 //Variables qui correspondent à un fichier son placé dans /data du dossier projet (son du laser)
  lightSaber2 = new SoundFile(this, "LightSaberHit2.mp3");
  MusiqueAJE = new SoundFile(this, "MusiqueAJE.mp3");                      //Musique Accueil+Jeu+ Menu Exit
  MusiqueOptions = new SoundFile(this, "MusiqueOptions.mp3");              //Musique Menu Options
  MusiqueCredits = new SoundFile(this, "MusiqueCredits.mp3");              //Musique Menu Credits
  fellInLava = new SoundFile(this, "splashInLava.mp3");                    //Bruit tomber dans la lave
  lightSaberOn = new SoundFile(this, "lightSaberON.mp3");                  //Bruit allumage sabre laser
  lightSaberOff = new SoundFile(this, "lightSaberOFF.mp3");                //Bruit eteignage sabre laser
  clicSound = new SoundFile(this, "clicSound.mp3");                        //Bruit de clic sur case
  deathmatchAnnouncer = new SoundFile(this, "deathmatchAnnouncer.mp3");    //Voix annoncant mode jeu
  drawMusic= new SoundFile(this, "DrawMusic.mp3");                         //Musique égalité
  brightSideVMusic= new SoundFile(this, "BrightSideVMusic.mp3");           //Musique victoire coté lumineux
  darkSideVMusic= new SoundFile(this, "DarkSideVMusic.mp3");               //Musique victoire coté obscur
  MusiqueAJE.amp((0.125*volumeM));                                         //Volume initial des musiques de fond (Volume max = 0.125, Volume initial = 0.125*0.5)
  MusiqueOptions.amp(0.125*volumeM);
  MusiqueCredits.amp(0.125*volumeM);
  drawMusic.amp(0.125*volumeM);
  darkSideVMusic.amp(0.125*volumeM);
  brightSideVMusic.amp((0.125*volumeM));
  lightSaber1.amp(0.1*volumeL);                                            //Volume initial des lasers (Volume max = 0.05, Volume initial = 0.05*0.5)
  lightSaber2.amp(0.1*volumeL);
  lightSaberOn.amp(0.25*volumeL);
  lightSaberOff.amp(0.25*volumeL);
  deathmatchAnnouncer.amp(0.3*volumeB);
  clicSound.amp(0.25*volumeB);
  fellInLava.amp(0.125*volumeB);
  
  gameIcon = loadImage("gameIcon.png");                                    //Chargement des images dans des variables
  fondAccueil = loadImage("fondAccueil.png");                      
  fondJeu = loadImage("fondJeu.png");
  fondOptions = loadImage("fondOptions.png");
  fondCredits = loadImage("fondCredits.png");
  fondExit = loadImage("fondExit.png");
  Personnage = loadImage("PersonnageWhite.png");
  playIcon = loadImage("PlayIcon.png");
  pauseIcon = loadImage("PauseIcon.png");
  optionsIcon = loadImage("OptionsIcon.png");
  creditsIcon = loadImage("CreditsIcon.png");
  returnIcon = loadImage("ReturnIcon.png");
  exitIcon = loadImage("ExitIcon.png");
  speedDownIcon = loadImage("SpeedDownIcon.png");
  speedUpIcon = loadImage ("SpeedUpIcon.png");
  volumeDownIcon = loadImage("VolumeDownIcon.png");
  volumeUpIcon = loadImage("VolumeUpIcon.png");
  timePlusIcon = loadImage("TimePlusIcon.png");
  timeLessIcon = loadImage("TimeLessIcon.png");
  
  gameIcon.resize(50,50);                                                //Changement de la taille des images
  fondAccueil.resize(width,height);                              
  fondJeu.resize(width,height);
  fondOptions.resize(width,height);
  fondCredits.resize(width,height);
  fondExit.resize(width,height);

  
  surface.setIcon(gameIcon);                                            //Définition de l'icone du jeu
  surface.setTitle("FightSabers");                                      //Définiton du titre du jeu dans la barre de la fenêtre
  
   cp5 = new ControlP5(this);                                                          //Initialisation du controleur de paramètres
   cp5.setColorActive(sliderActiveColor).setColorForeground(sliderForegroundColor);    //Réglage de la couleur lors du mouse-over et couleur en règle générale des barres
                                                                                        
   cp5.addSlider("Vitesse Personnage 1")                                               //Initialisation des différentes barres avec leurs paramètres (Position, taille, valeurMin/Max, valeur initiale, visibilité)
      .setPosition(width>>2,height*0.2)
      .setSize((int)(width*0.5),40)
      .setRange(1,20)
      .setValue(pSpeed1)
      .setVisible(false)
      .setColorLabel(#FFFFFF)
      .getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER);
      
   cp5.addSlider("Vitesse Personnage 2")                                               
      .setPosition(width>>2,height*0.3)
      .setSize((int)(width*0.5),40)
      .setRange(1,20)
      .setValue(pSpeed2)
      .setVisible(false)
      .setColorLabel(#FFFFFF)
      .getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER);
      
   cp5.addSlider("Volume musique")
      .setPosition(width>>2,height*0.4)
      .setSize((int)(width*0.5),40)
      .setRange(0,100)
      .setValue(50)
      .setVisible(false)
      .setColorLabel(#FFFFFF)
      .getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER);
      
   cp5.addSlider("Volume lasers")
      .setPosition(width>>2,height>>1)
      .setSize((int)(width*0.5),40)
      .setRange(0,100)
      .setValue(50) 
      .setVisible(false)
      .setColorLabel(#FFFFFF)
      .getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER);
      
   cp5.addSlider("Volume bruits")
      .setPosition(width>>2,height*0.6)
      .setSize((int)(width*0.5),40)
      .setRange(0,100)
      .setValue(50) 
      .setVisible(false)
      .setColorLabel(#FFFFFF)
      .getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER);   
      
   cp5.addSlider("Temps de Jeu")
      .setPosition(width>>2,height*0.7)
      .setSize((int)(width*0.5),40)
      .setRange(10,180)
      .setValue(120)
      .setNumberOfTickMarks(18)
      .showTickMarks(false)
      .setVisible(false)
      .setColorLabel(#FFFFFF)
      .getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER);
      
      
  control = ControlIO.getInstance(this);
  List<ControlDevice> inputs = control.getDevices();                          //On récupère les périphériques disponible dans une liste
  for(int i=0;i<inputs.size();i++){                                           //Pour chaque élément de la liste
     if(inputs.get(i).getTypeName()=="Gamepad") gpad=control.getDevice(i);    //Si le périphérique est du type Gamepad, alors on l'utilise comme manette
  }
  
  if(gpad== null){                                                            //Si aucun périphérique branché n'est compatible, on entre en mode débug
    noGamepadMode=true;
  }
  
  if(!noGamepadMode){
    gpad.getSlider(UpDown).setTolerance(0.1);
    gpad.getSlider(RightLeft).setTolerance(0.12);
    gpad.getSlider(XAim).setTolerance(0.05);
    gpad.getSlider(YAim).setTolerance(0.15);
  }
  sommetsPerso();
  numberOfPoints=numberOfHitboxPoints();
}



void draw(){
  switch(screen) {
   case 0: ecranAccueil();        break;    //Affichage de l'écran d'accueil
   case 1: ecranJeu1vs1();        break;    //Affichage de l'écran de jeu (1 contre 1)
   case 2: ecranOptions();        break;    //Affichage de l'écran des options   
   case 3: ecranCredits();        break;    //Affichage de l'écran des crédits 
   case 4: ecranSortie();         break;    //Affichage de l'écran de sortie
   case 5: ecranFinPartie();      break;    //Affichage de l'écran de fin de partie
  }
}


//
// Utilisation de la souris
//

void mousePressed(){    //Au moment où le click souris est enfoncé
  if (screen == 0){     //Dans l'écran d'accueil
    if (mouseX<(width>>1)+100 && mouseX>(width>>1)-100 && mouseY<(height/3)+40 && mouseY>(height/3)-40){
      screen=1;         // Click Souris sur Play/Jouer
      clicSound.play();
    }
    if (mouseX<(width>>1)+100 && mouseX>(width>>1)-100 && mouseY<(height>>1)+40 && mouseY>(height>>1)-40){
      screen=2;         // Click Souris sur Options
      clicSound.play();
    }
    if (mouseX<(width>>1)+100 && mouseX>(width>>1)-100 && mouseY<(height*0.67)+40 && mouseY>(height*0.67)-40){
      screen=3;         // Click Souris sur Credits
      clicSound.play();
    }
    if (mouseX<(width>>1)+100 && mouseX>(width>>1)-100 && mouseY<(height*0.84)+40 && mouseY>(height*0.84)-40){
      screen=4;         // Click Souris sur Sortie
      clicSound.play();
    }
  }
  
  if(screen == 2){      //Dans l'écran des options
    if (mouseX<(width>>1)+100 && mouseX>(width>>1)-100 && mouseY<(height*0.9)+40 && mouseY>(height*0.9)-40){      //Click sur le bouton retour -> masquage des barres
      clicSound.play();
      
      cp5.getController("Vitesse Personnage 1").setVisible(false);
      cp5.getController("Vitesse Personnage 2").setVisible(false);
      cp5.getController("Volume musique").setVisible(false);
      cp5.getController("Volume lasers").setVisible(false);
      cp5.getController("Volume bruits").setVisible(false);
      cp5.getController("Temps de Jeu").setVisible(false);
      
      
      pSpeed1 =(int) cp5.getController("Vitesse Personnage 1").getValue();                                        //On récupère les valeurs, non mises à jour à chaque image, à la sortie du menu
      pSpeed2 =(int) cp5.getController("Vitesse Personnage 2").getValue();
      tpsDeJeu =(int) cp5.getController("Temps de Jeu").getValue();
      scoreP1=0;
      scoreP2=0;

      screen=0;   //Retour à l'accueil
    }
      
    if((mouseX<(width>>3)+100 && mouseX>(width>>3)-100 && mouseY<(height*0.85)+40 && mouseY>(height*0.85)-40) && (debugMode==true)){
      debugMode = false;
      clicSound.play();
    }
    
    else if((mouseX<(width>>3)+100 && mouseX>(width>>3)-100 && mouseY<(height*0.85)+40 && mouseY>(height*0.85)-40) && (debugMode==false)){
      debugMode = true;
      clicSound.play();
    }

  }
  
  if (screen == 3){ //Dans l'écran des crédits
    if (mouseX<(width>>1)+100 && mouseX>(width>>1)-100 && mouseY<(height*0.9)+40 && mouseY>(height*0.9)-40){
      screen=0;               //Retour à l'accueil lors du click sur Retour
      clicSound.play();  
    }
  }  
  
  if (screen == 4){ //Dans l'écran de sortie
    if (mouseX<(width*0.75)+100 && mouseX>(width*0.75)-100 && mouseY<(height>>1)+40 && mouseY>(height>>1)-40){
      screen=0;               //Retour à l'accueil lors du click sur No/Non
      clicSound.play();
    }
    if (mouseX<(width>>2)+100 && mouseX>(width>>2)-100 && mouseY<(height>>1)+40 && mouseY>(height>>1)-40){
      exit();                 //Fermeture de la fenêtre lors du click sur Yes/Oui
      clicSound.play();
    }
  }

  if(screen == 5){
    if (mouseX<(width>>2)+100 && mouseX>(width>>2)-100 && mouseY<(height>>2)*3+40 && mouseY>(height>>2)*3-40){
      clicSound.play();
      screen=1;               //Joueurs veulent rejouer, jeu relancé
      p1Death();
      p2Death();
      scoreP1 = 0;
      scoreP2 = 0;
    }
    if (mouseX<(width>>2)*3+100 && mouseX>(width>>2)*3-100 && mouseY<(height>>2)*3+40 && mouseY>(height>>2)*3-40){
      clicSound.play();
      screen=0;               //Joueurs ne veulent pas rejouer, retour à l'accueil
      p1Death();
      p2Death();
      scoreP1 = 0;
      scoreP2 = 0;
    }
  }
}

//
//Utilisation du clavier
//
void keyPressed(){  //Lorsque l'on appuie sur la touche, la variable correspondante passe à true
  switch(keyCode){
    case 32 : espace =   true; break;  //Espace
    case UP: up =        true; break;  //Flèches clavier
    case DOWN : down =   true; break;
    case LEFT : left =   true; break;
    case RIGHT : right = true; break;
    case 90: up=         true; break;  //z
    case 81: left=       true; break;  //q
    case 83: down=       true; break;  //s
    case 68: right=      true; break;  //d
 }
 if (key == ESC) {
    key = 0;                           //On supprime la possibilité de quitter le jeu en utilisant ESC
  }
}
void keyReleased(){  //Lorsque l'on relâche la touche, la variable correspondante passe à false
   switch(keyCode){
    case 32 : espace =   false; break; //Espace
    case UP : up =       false; break; //Flèches clavier
    case DOWN : down =   false; break;
    case LEFT : left =   false; break;
    case RIGHT : right = false; break;
    case 90: up=         false; break; //z
    case 81: left=       false; break; //q
    case 83: down=       false; break; //s
    case 68: right=      false; break; //d
  }  
}

void affichagePersonnages(){                                        //Affichage des personnages
  image(Personnage,xs1,ys1,tPersonnage,tPersonnage);  
  image(Personnage,xS1,yS1,tPersonnage,tPersonnage);
}
void affichageIconesAccueil(){                                      //Affichage des icones dans l'accueil
  image(playIcon,(width>>1)-175,(height/3)-30,60,60);
  image(optionsIcon,(width>>1)-175,(height>>1)-30,60,60);
  image(creditsIcon,(width>>1)-175,(height*0.67)-30,60,60);
  image(exitIcon,(width>>1)-175,(height*0.84)-30,60,60);
}
void affichageIconeJeu1vs1(){                                       //Affichage des icones en jeu
  image(pauseIcon,(width>>1)-150,height-33,25,25);
}
void affichageIconesOptions(){                                      //Affichage des icones dans les options
  image(speedDownIcon,(width>>2)-50,height*0.2,40,40);
  image(speedDownIcon,(width>>2)-50,height*0.3,40,40);
  image(speedUpIcon,(width/1.3),height*0.2,40,40);
  image(speedUpIcon,(width/1.3),height*0.3,40,40);
  image(volumeDownIcon,(width>>2)-40,height*0.4,40,40);
  image(volumeDownIcon,(width>>2)-40,height>>1,40,40);
  image(volumeDownIcon,(width>>2)-40,height*0.6,40,40);
  image(volumeUpIcon,(width/1.3)-10,height*0.4,40,40);
  image(volumeUpIcon,(width/1.3)-10,height>>1,40,40);
  image(volumeUpIcon,(width/1.3)-10,height*0.6,40,40);
  image(timeLessIcon,(width>>2)-40,height*0.7,40,40);
  image(timePlusIcon,(width/1.3)-10,height*0.7,40,40);
  
}
void affichageIconesExit(){                                         //Affiche des icones dans le menu de sortie
  image(exitIcon,(width>>2)+100,(height>>1)-40,80,80);
  image(returnIcon,(width*0.75)-180,(height>>1)-40,80,80);
}

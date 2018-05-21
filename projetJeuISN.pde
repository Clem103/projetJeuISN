void setup(){
  fullScreen();                               //La taille de la fenêtre remplie tout l'écran
  //size(1280,720);
  frameRate(60);
  titre = createFont("PoliceTitre.ttf",1);    //Initialisation de la police utilisée pour les titres
  texte = createFont("PoliceTexte.ttf",1);    //Initialisation de la police utilisée pour le texte
  smooth();                                   //Rend les contours plus lisses
  
  xPersonnage1 = width>>2;                    //En binaire : décalage à droite des chiffres de 1 (0101 -> 0010). Revient ici à diviser par 2^1  ==> Fludification des calculs
  yPersonnage1 = height>>1;                   //Autre ex: 11010001>>2  -> 00110100 : division par 2^2=4. "left shift" & "right shift"  
 
  xPersonnage2 = (width>>2)*3;                //Positionnement des personnages
  yPersonnage2 = height>>1;
  
    
  screen = 0;                                                      //Initialisation de l'écran initial à l'écran d'accueil
  
  laser1 = new SoundFile(this, "LightSaberHit1.mp3");              //Variable qui correspond à un fichier son placé dans /data du dossier projet (son du laser)
  laser2 = new SoundFile(this, "LightSaberHit2.mp3");
  MusiqueAJE = new SoundFile(this, "MusiqueAJE.mp3");              //Musique Accueil+Jeu+ Menu Exit
  MusiqueOptions = new SoundFile(this, "MusiqueOptions.mp3");      //Musique Menu Options
  MusiqueCredits = new SoundFile(this, "MusiqueCredits.mp3");      //Musique Menu Credits
  fellInLava = new SoundFile(this, "splashInLava.mp3");
  MusiqueAJE.amp((0.125*volumeM));                                 //Volume initial de la musique de fond (Volume max = 0.125, Volume initial = 0.125*0.5)
  laser1.amp(0.1*volumeL);                                        //Volume initial du laser (Volume max = 0.05, Volume initial = 0.05*0.5)
  laser2.amp(0.1*volumeL);
  fellInLava.amp(0.1);
  
  fondAccueil = loadImage("fondAccueil.png");                      //Chargement des images dans des variables
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
  
  fondAccueil.resize(width,height);                              //Changement de la taille des images
  fondJeu.resize(width,height);
  fondOptions.resize(width,height);
  fondCredits.resize(width,height);
  fondExit.resize(width,height);
  
  
   cp5 = new ControlP5(this);                                                          //Initialisation du controleur de paramètres
   cp5.setColorActive(sliderActiveColor).setColorForeground(sliderForegroundColor);    //Réglage de la couleur lors du mouse-over et couleur en règle générale des barres
                                                                                        
   cp5.addSlider("Vitesse Personnage 1")                                               //Initialisation des différentes barres avec leurs paramètres (Position, taille, valeurMin/Max, valeur initiale, visibilité)
      .setPosition(width>>2,height*0.3333)
      .setSize((int)(width*0.5),40)
      .setRange(1,20)
      .setValue(pSpeed1)
      .setVisible(false)
      .setColorLabel(#FFFFFF)
      .getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER);
      
   cp5.addSlider("Vitesse Personnage 2")                                               
      .setPosition(width>>2,height*0.4166)
      .setSize((int)(width*0.5),40)
      .setRange(1,20)
      .setValue(pSpeed2)
      .setVisible(false)
      .setColorLabel(#FFFFFF)
      .getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER);
      
   cp5.addSlider("Volume musique")
      .setPosition(width>>2,height>>1)
      .setSize((int)(width*0.5),40)
      .setRange(0,100)
      .setValue(50)
      .setVisible(false)
      .setColorLabel(#FFFFFF)
      .getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER);
      
   cp5.addSlider("Volume lasers")
      .setPosition(width>>2,height*0.5833)
      .setSize((int)(width*0.5),40)
      .setRange(0,100)
      .setValue(50) 
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
    if (mouseX<(width>>1)+100 && mouseX>(width>>1)-100 && mouseY<(height/3)+40 && mouseY>(height/3)-40)       screen=1;   // Click Souris sur Play/Jouer
    if (mouseX<(width>>1)+100 && mouseX>(width>>1)-100 && mouseY<(height>>1)+40 && mouseY>(height>>1)-40)     screen=2;   // Click Souris sur Options
    if (mouseX<(width>>1)+100 && mouseX>(width>>1)-100 && mouseY<(height*0.67)+40 && mouseY>(height*0.67)-40) screen=3;   // Click Souris sur Credits
    if (mouseX<(width>>1)+100 && mouseX>(width>>1)-100 && mouseY<(height*0.84)+40 && mouseY>(height*0.84)-40) screen=4;   // Click Souris sur Sortie
  }
  
  if(screen == 2){      //Dans l'écran des options
    if (mouseX<(width>>1)+100 && mouseX>(width>>1)-100 && mouseY<(height*0.9)+40 && mouseY>(height*0.9)-40){      //Click sur le bouton retour -> masquage des barres
      cp5.getController("Vitesse Personnage 1").setVisible(false);
      cp5.getController("Vitesse Personnage 2").setVisible(false);
      cp5.getController("Volume musique").setVisible(false);
      cp5.getController("Volume lasers").setVisible(false);
      
      
      pSpeed1 =(int) cp5.getController("Vitesse Personnage 1").getValue();                                        //On récupère les valeurs, non mises à jour à chaque image, à la sortie du menu
      pSpeed2 =(int) cp5.getController("Vitesse Personnage 2").getValue();
    
      screen=0;   //Retour à l'accueil
    }
      
    if((mouseX<(width>>3)+100 && mouseX>(width>>3)-100 && mouseY<(height*0.85)+40 && mouseY>(height*0.85)-40) && (debugMode==true)) debugMode = false;
      
    else if((mouseX<(width>>3)+100 && mouseX>(width>>3)-100 && mouseY<(height*0.85)+40 && mouseY>(height*0.85)-40) && (debugMode==false)) debugMode = true;
    

  }
  
  if (screen == 3){ //Dans l'écran des crédits
    if (mouseX<(width>>1)+100 && mouseX>(width>>1)-100 && mouseY<(height*0.9)+40 && mouseY>(height*0.9)-40) screen=0;     //Retour à l'accueil lors du click sur Retour
  }
  
  if (screen == 4){ //Dans l'écran de sortie
    if (mouseX<(width*0.75)+100 && mouseX>(width*0.75)-100 && mouseY<(height>>1)+40 && mouseY>(height>>1)-40) screen=0;   //Retour à l'accueil lors du click sur No/Non
    if (mouseX<(width>>2)+100 && mouseX>(width>>2)-100 && mouseY<(height>>1)+40 && mouseY>(height>>1)-40) exit();         //Fermeture de la fenêtre lors du click sur Yes/Oui
  }

  if(screen == 5){
    if (mouseX<(width>>2)+200 && mouseX>(width>>2) && mouseY<(height>>2)*3+40 && mouseY>(height>>2)*3) screen=1;          //Joueurs veulent rejouer, jeu relancé
    if (mouseX<(width>>2)+200 && mouseX>(width>>2) && mouseY<(height>>2) && mouseY>(height>>2)) exit();                   //Joueurs ne veulent pas rejouer, fermeture du jeu 
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
}
void keyReleased(){  //Lorsque l'on relâche la touche, la variable correspondante passe à false
   switch(keyCode){
    case 32 : espace =      false; break;  //Espace
    case UP : up =          false; break;  //Flèches clavier
    case DOWN : down =      false; break;
    case LEFT : left =      false; break;
    case RIGHT : right =    false; break;
    case 90: up=            false; break;  //z
    case 81: left=          false; break;  //q
    case 83: down=          false; break;  //s
    case 68: right=         false; break;  //d
  }  
}

void affichagePersonnages(){                                        //Affichage des personnages
  image(Personnage,xs1,ys1,tPersonnage,tPersonnage);  
  image(Personnage,xS1,yS2,tPersonnage,tPersonnage);
}
void affichageIconesAccueil(){                                      //Affichage des icones dans l'accueil
  image(playIcon,(width>>1)-175,(height/3)-30,60,60);
  image(optionsIcon,(width>>1)-175,(height>>1)-30,60,60);
  image(creditsIcon,(width>>1)-175,(height*0.67)-30,60,60);
  image(exitIcon,(width>>1)-175,(height*0.84)-30,60,60);
}
void affichageIconeJeu1vs1(){                                       //Affichage des icones en jeu
  image(pauseIcon,(width>>1)-150,height-24,25,25);
}
void affichageIconesOptions(){                                      //Affichage des icones dans les options
  image(speedDownIcon,(width>>2)-50,height*0.3333,40,40);
  image(speedDownIcon,(width>>2)-50,height*0.4166,40,40);
  image(speedUpIcon,(width/1.3),height*0.3333,40,40);
  image(speedUpIcon,(width/1.3),height*0.4166,40,40);
  image(volumeDownIcon,(width>>2)-40,height>>1,40,40);
  image(volumeDownIcon,(width>>2)-40,height*0.5833,40,40);
  image(volumeUpIcon,(width/1.3)-10,height>>1,40,40);
  image(volumeUpIcon,(width/1.3)-10,height*0.5833,40,40);
}
void affichageIconesExit(){                                         //Affiche des icones dans le menu de sortie
  image(exitIcon,(width>>2)+100,(height>>1)-40,80,80);
  image(returnIcon,(width*0.75)-180,(height>>1)-40,80,80);
}

void setup(){
  size(1280,720);
  frameRate(60);
  titre = createFont("PoliceTitre.ttf",1);    //Initialisation de la police utilisée pour les titres
  texte = createFont("PoliceTexte.ttf",1);    //Initialisation de la police utilisée pour le texte
  smooth();                                   //Rend les contours plus lisses
  
  xPersonnage1 = (int)(width*0.75);      //En binaire : décalage à droite des chiffres de 1 (0101 -> 0010). Revient ici à diviser par 2^1  ==> Fludification des calculs                                                                                                          //Autre ex: 11010001>>2  -> 00110100 : division par 2^2=4. "left shift" & "right shift"
  yPersonnage1 = height>>2;
  
  xPersonnage2 = width>>2;
  yPersonnage2 = (int)(height*0.75);
  
  
  screen = 0;                                 //Initialisation de l'écran initial à l'écran d'accueil
  
  explode = new SoundFile(this, "8BitExplosion.mp3");           //Variable qui correspond à un fichier son placé dans /data du dossier projet (son d'explosion)
  music = new SoundFile(this , "BackgroundMusic.mp3");          //Musique de fond
  music.amp((0.125*volumeM));                                   //Volume initial de la musique de fond (Volume max = 0.125, Volume initial = 0.125*0.5)
  music.loop();                                                 //Répétition en boucle de la musique
  explode.amp(0.05*volumeE);                                    //Volume initial d'explosion (Volume max = 0.05, Volume initial = 0.05*0.5)
  
  fondAccueil = loadImage("fondAccueil.png");                   //Chargement des images dans des variables
  fondJeu = loadImage("fondJeu.png");
  fondCredits = loadImage("fondCredits.png");
  Personnage = loadImage("PersonnageWhite.png");
  /*PlayIcon = loadImage("");
  OptionsIcon = loadImage("");
  CreditsIcon = loadImage("");
  ReturnIcon = loadImage("");
  ExitIcon = loadImage("");
  ExitYesIcon = loadImage("");
  SpeedDownIcon = loadImage("");
  SpeedUpIcon = loadImage ("");
  VolumeDownIcon = loadImage("");
  VolumeUpIcon = loadImage("");*/
  
  fondAccueil.resize(width,height);
  fondJeu.resize(width,height);
  fondCredits.resize(width,height);
  
  
   cp5 = new ControlP5(this);                                                        //Initialisation du controlleur
   cp5.setColorActive(sliderActiveColor).setColorForeground(sliderForegroundColor);  //Réglage de la couleur lors du mouse-over et couleur en règle générale des barres
                                                                                        
   cp5.addSlider("Vitesse Personnage 1")                                               //Initialisation des différentes barres avec leurs paramètres (Position, taille, valeurMin/Max, valeur initiale, visibilité)
      .setPosition(10,300)
      .setSize(550,40)
      .setRange(1,20)
      .setValue(pSpeed1)
      .setVisible(false);
      
   cp5.addSlider("Vitesse Personnage 2")                                               
      .setPosition(10,250)
      .setSize(550,40)
      .setRange(1,20)
      .setValue(pSpeed2)
      .setVisible(false);
      
   cp5.addSlider("Volume musique")
      .setPosition(10,350)
      .setSize(550,40)
      .setRange(0,100)
      .setValue(50)
      .setVisible(false);
      
   cp5.addSlider("Volume lasers")
      .setPosition(10,400)
      .setSize(550,40)
      .setRange(0,100)
      .setValue(50) 
      .setVisible(false);  
      
  control = ControlIO.getInstance(this);
  gpad=control.getMatchedDevice("XboxGamePadConfig");
  if(gpad== null) System.exit(-1);

}



void draw(){
  switch(screen) {
   case 0: ecranAccueil();        break;    //Affichage de l'écran d'accueil
   case 1: ecranJeu1vs1();        break;    //Affichage de l'écran de jeu (1 contre 1)
   case 2: ecranOptions();        break;    //Affichage de l'écran des options   
   case 3: ecranCredits();        break;    //Affichage de l'écran des crédits 
   case 4: ecranSortie();         break;    //Affichage de l'écran de sortie
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
    if (mouseX<(width>>1)+100 && mouseX>(width>>1)-100 && mouseY<(height*0.84)+40 && mouseY>(height*0.84)-40) screen=4;   // Click Souris sur Fin
  }
  
  
  if(screen == 2){      //Dans l'écran des options
    if (mouseX<(width>>1)+100 && mouseX>(width>>1)-100 && mouseY<(height*0.9)+40 && mouseY>(height*0.9)-40){      //Click sur le bouton retour -> masquage des barres
      cp5.getController("Vitesse Personnage 1").setVisible(false);
      cp5.getController("Vitesse Personnage 2").setVisible(false);
      cp5.getController("Volume musique").setVisible(false);
      cp5.getController("Volume lasers").setVisible(false);
      
      
      pSpeed1 =(int) cp5.getController("Vitesse Personnage 1").getValue();                                          //On récupère les valeurs, non mises à jour à chaque image, à la sortie du menu
      pSpeed2 =(int) cp5.getController("Vitesse Personnage 2").getValue();
    
      screen=0;   //Retour à l'accueil
    }
  if (mouseX<(width/1.1)+60 && mouseX>(width>>1) && mouseY<(height/5)+40 && mouseY>(height/5)){
    launch("C://Users//PCSI//Downloads//projetJeuISN//projetJeuISN.pde");
      
    
    }
  }
  if (screen == 3){ //Dans l'écran des crédits
    if (mouseX<(width>>1)+100 && mouseX>(width>>1)-100 && mouseY<(height*0.9)+40 && mouseY>(height*0.9)-40) screen=0;     //Retour à l'accueil lors du click sur Retour
  }
  if (screen == 4){ //Dans l'écran de sortie
    if (mouseX<(width*0.75)+100 && mouseX>(width*0.75)-100 && mouseY<(height>>1)+40 && mouseY>(height>>1)-40) screen=0;   //Retour à l'accueil lors du click sur No/Non
    if (mouseX<(width>>2)+100 && mouseX>(width>>2)-100 && mouseY<(height>>1)+40 && mouseY>(height>>1)-40) exit();         //Fermeture de la fenêtre lors du click sur Yes/Oui
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
    case UP : up =          false; break;  //Flèche clavier
    case DOWN : down =      false; break;
    case LEFT : left =      false; break;
    case RIGHT : right =    false; break;
    case 90: up=            false; break;  //z
    case 81: left=          false; break;  //q
    case 83: down=          false; break;  //s
    case 68: right=         false; break;  //d
  }  
}

void affichage(){                                                           //Affichage des personnages
  image(Personnage,xs1,ys1,tPersonnage,tPersonnage);  
  image(Personnage,xS1,yS2,tPersonnage,tPersonnage);
}

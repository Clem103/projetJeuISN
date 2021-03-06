void p1Death(){          //fonction appelée lorsque le personnage 1 meurt
  int[] personnage1 = respawn(xPersonnage1,yPersonnage1);  //Assignation des coordonées au personnage 1
  xPersonnage1 = personnage1[0];
  yPersonnage1 = personnage1[1];
  scoreP2++;                                               //Le score du joueur 2 augmente
}

void p2Death(){          //fonction appelée lorsque le personnage 2 meurt
  int[] personnage2 = respawn(xPersonnage2,yPersonnage2);   //Assignation des coordonées au personnage 2
  xPersonnage2 = personnage2[0];
  yPersonnage2 = personnage2[1];
  scoreP1++;                                                //Le score du joueur 1 augmente
}

void p1LavaDeath(){                                         //Fonction appelé lors de la chute dans la lave
  fellInLava.play();
  p1Death();
}

void p2LavaDeath(){                                         //Fonction appelé lors de la chute dans la lave
  fellInLava.play();
  p2Death();
}

int[] respawn(int xPersonnage,int yPersonnage){             //Fonction appelé lorsque qu'un joueur meurt
  spawn = (int)random(3);                                   //On randomise la zone de spawn
  switch(spawn){
    case 0 : {                                              //Au sein de la zone de spawn, on randomise la pos du personnage à la réapparition
      xPersonnage=(int)random(width>>5,width*0.35125);
      yPersonnage=(int)random(height>>4,height*0.6825);
      int[]personnage={xPersonnage,yPersonnage};
      return personnage;
    }
    case 1 : {
      xPersonnage=(int)random(width*0.25,width*0.65);
      yPersonnage=(int)random(height/3,height*0.88);
      int[]personnage={xPersonnage,yPersonnage};
      return personnage;
    }
    case 2 : {
      xPersonnage=(int)random(width*0.6,width*0.96);
      yPersonnage=(int)random(height>>4,height*0.5525);
      int[]personnage={xPersonnage,yPersonnage};
      return personnage;
    }
    default : {
    int[] personnage={width>>1,height>>1};                //Si la valeur aléatoire ne fontionne le cas par défaut place les personnages au centre
    return personnage;
    }
  }
}

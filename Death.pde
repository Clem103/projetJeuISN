void p1Death(){
  int[] personnage1 = respawn(xPersonnage1,yPersonnage1);
  xPersonnage1 = personnage1[0];
  yPersonnage1 = personnage1[1];
  scoreP2++;
}

void p2Death(){
  int[] personnage2 = respawn(xPersonnage2,yPersonnage2);
  xPersonnage2 = personnage2[0];
  yPersonnage2 = personnage2[1];
  scoreP1++;
}

void p1LavaDeath(){
  fellInLava.play();
  p1Death();
}

void p2LavaDeath(){
  fellInLava.play();
  p2Death();
}

int[] respawn(int xPersonnage,int yPersonnage){
  spawn = (int)random(3);
  switch(spawn){
    case 0 : {
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
    int[] personnage={width>>1,height>>1};
    return personnage;
    }
  }
}

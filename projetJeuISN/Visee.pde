void viseeSouris(){
  xC=mouseX;
  yC=mouseY;
  xP=xs2-16.2;
  yP=ys2;
  xCP=xC-xP;
  yCP=yC-yP;
  angleCurseur = atan2(yCP,xCP);
  line(xP,yP,xP+80*cos(angleCurseur),yP+80*sin(angleCurseur));
}
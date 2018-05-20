import processing.sound.*;          //Librairie permettant de jouer des sons
import controlP5.*;                 //Librairie permettant l'ajout de barres glissantes
import org.gamecontrolplus.gui.*;   //Librairies permettant de controler des perosnnages à la manette
import org.gamecontrolplus.*;
import net.java.games.input.*;
import java.util.List;

SoundFile laser;              //Déclaration des variables de son (Laser)
SoundFile music;              //Musique de fond
            
int pSpeed1 = 6;              //Vitesses des personnages
int pSpeed2 = 6;
float pSpeedX2;
float pSpeedY2;

int tPersonnage=50;


int xPersonnage1;                //Coordonnées du personnage1
int yPersonnage1; 
int xs1,ys1,xs2,ys2,xs3,ys3,xs4,ys4;  //Coordonnées des sommets du personnage1 (en carré) s1 = sommet haut gauche, s2 = sommet haut droit, s3 = sommet bas droit, s4 = sommet bas gauche

int xPersonnage2, yPersonnage2;
int xS1,yS1,xS2,yS2,xS3,yS3,xS4,yS4;
float xP,yP,xC,yC,xCP,yCP,angleCurseur;

float distancePerso;
int xGp1, yGp1, xGp2, yGp2; //Centre de gravité des personnages

boolean espace =  false;      //initialisation des touches du jeu (false = touche non appuyée)
boolean up=       false;
boolean down=     false;
boolean left=     false;
boolean right=    false;

int screen;                   //Ecran à afficher

PFont titre, texte;           //Déclaration des polices d'écriture

PImage fondAccueil,fondJeu, fondOptions, fondCredits, fondExit, Personnage;    //Déclaration des images
PImage playIcon, pauseIcon, optionsIcon, creditsIcon, returnIcon, exitIcon, speedDownIcon, speedUpIcon, volumeDownIcon, volumeUpIcon;  //Déclaration des icones

ControlP5 cp5;                //Déclaration du controlleur (permetant la création d'une SlideBar)

float volumeM = 0.50;         //Valeur initiale en % du volume de la musique
float volumeL = 0.50;         //Valeur initiale en % du volume du laser

color sliderActiveColor = #FF0000, sliderForegroundColor=#AA0000;         //Couleurs liées au sliderBar
color gameTitleColor = #FF0000, homeTextColor=#FF0000, gameTextColor=#FF0000, creditsTextColor=#FF0000, exitTextColor=#FF7800;    //Couleurs liées au texte dans les différents menus
color optionsBackButtonColor = #007FFF, creditsBackButtonColor=#FF0000, exitYesButtonColor=#FF0000, exitNoButtonColor=#FF0000, gameModeBackButtonColor=#007FFF;    //Couleurs liées au texte dans différents "boutons"
color optionsTextsColor = #FF0000;
color fleches = #FFFFFF;
color sliderLabelColor = #AA0000;

ControlIO control;                  //Definition des variables associées à l'utilisation d'une manette
Configuration config;
ControlDevice gpad;
int UpDown = 0;
int RightLeft = 1;
int YAim = 2;
int XAim = 3;


float posXGamePad, posYGamePad;
float rollXGamePad, rollYGamePad;
float angleAim;
float xEndOfWeapon1, yEndOfWeapon1, xEndOfWeapon2, yEndOfWeapon2;
int weaponLength = 600;
int distanceBetweenPoints;
int numberOfPoints=1;

boolean debugMode;
boolean noGamepadMode;

int widthResolution = 800;
int heightResolution = 600;
String affichageResolution = widthResolution + "x" + heightResolution;

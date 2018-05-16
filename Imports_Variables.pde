import processing.sound.*;          //Librairie permettant de jouer des sons
import controlP5.*;                 //Librairie permettant l'ajout de barres glissantes
import org.gamecontrolplus.gui.*;   //Librairies permettant de controler des perosnnages à la manette
import org.gamecontrolplus.*;
import net.java.games.input.*;

SoundFile explode;            //Déclaration des variables de son (Explosion)
SoundFile music;              //Musique de fond

int eSpeed = 4;               //Vitesses ennemis et vaisseau
int pSpeed1 = 6;
int pSpeed2 = 6;
float pSpeedX2;
float pSpeedY2;

int tPersonnage=50;


int xPersonnage1;                //Coordonnées du personnage
int yPersonnage1; 
int xs1,ys1,xs2,ys2,xs3,ys3,xs4,ys4;  //Coordonnées des sommets du personnage1 (en carré) s1 = sommet haut gauche, s2 = sommet haut droit, s3 = sommet bas droit, s4 = sommet bas gauche

int xPersonnage2, yPersonnage2;
int xS1,yS1,xS2,yS2,xS3,yS3,xS4,yS4;
float xP,yP,xC,yC,angleCurseur,xCP,yCP;

ArrayList<Integer> xE = new ArrayList();  //Liste des coordonnées des ennemis
ArrayList<Integer> yE = new ArrayList();

boolean espace =  false;      //initialisation des touches du jeu (false = touche non appuyée)
boolean up=       false;
boolean down=     false;
boolean left=     false;
boolean right=    false;

int screen;                   //Ecran à afficher

PFont titre, texte;           //Déclaration des polices d'écriture

PImage fondAccueil,fondJeu, fondCredits, Personnage;    //Déclaration des images

ControlP5 cp5;                //Déclaration du controlleur (permetant la création d'une SlideBar)

float volumeM = 0.50;         //Valeur initiale en % du volume de la musique
float volumeE = 0.50;         //Valeur initiale en % du volume de l'explosion

int spawnRate = 5;            //Valeur initiale en % taux d'apparition maximum

color sliderActiveColor = #FF0000, sliderForegroundColor=#AA0000;         //Couleurs liées au sliderBar
color gameTitleColor = #FF0000, homeTextColor=#FF0000, gameTextColor=#FF0000, creditsTextColor=#FF0000, exitTextColor=#FF7800;    //Couleurs liées au texte dans les différents menus
color optionsBackButtonColor = #007FFF, creditsBackButtonColor=#FF0000, exitYesButtonColor=#FF0000, exitNoButtonColor=#FF0000, gameModeBackButtonColor=#007FFF;    //Couleurs liées au texte dans différents "boutons"
color optionsTextsColor = #FF0000;
color fleches = #FFFFFF;

ControlIO control;                  //Definition des variables associées à l'utilisation d'une manette
Configuration config;
ControlDevice gpad;
float posXGamePad, posYGamePad;
float rollXGamePad, rollYGamePad;
float angleAim;
int weaponLength = 100;

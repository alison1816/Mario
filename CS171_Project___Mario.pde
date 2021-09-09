//Credit to HowComputersTalk youtube channel for code for start menu (https://www.youtube.com/watch?v=TjcXcGJihyQ)

import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
Minim    minim;
AudioPlayer    theme;
AudioPlayer    coinSound;
AudioPlayer    gameOverSound;
AudioPlayer    bombSound;

//////////////////////////////////////

PImage startscreen;
PImage background, coin, bomb, mario;
PImage heart1, heart2, heart3;
PImage coin1, coin2, coin3, coin4, coin5, coin6, coin7, coin8;

/////////////////////////////////////////////////////////////

int coin_x,coin_y,coin_count;

int coin1_x = 150, coin1_y = 530;
int coin2_x = 300, coin2_y = 530;
int coin3_x = 450, coin3_y = 530;
int coin4_x = 600, coin4_y = 530;
int coin5_x = 750, coin5_y = 530;
int coin6_x = 900, coin6_y = 530;
int coin7_x = 1050, coin7_y = 530;
int coin8_x = 1200, coin8_y = 530;

int bomb_x, bomb_y;

int mario_x = 400;
int mario_y = 640;

int heart1_x = 920, heart1_y = 45;
int heart2_x = 980, heart2_y = 45;
int heart3_x = 1040, heart3_y = 45;

int coins_collected = 0, lives = 3;
int quit = 0;

int stage;

////////////////////////////////////////////////////

void setup()
{
  size(1382,808,P2D);
  background = loadImage("background2.bmp");
 
 //////////////////////////////////////////////////
 
 stage = 1;
 startscreen = loadImage("background2.bmp");
 
 
 //////////////////////////////////////////////////
 
  //audio
  minim = new Minim(this);
  theme = minim.loadFile("MarioTheme.wav");
  theme.loop();

  coinSound = minim.loadFile("coinSound.wav");
 
  gameOverSound = minim.loadFile("gameOverSound.mp3");
 
  bombSound = minim.loadFile("bombSound.wav");
 
  /////////////////////////////////////////////////////////////
 
  //coin
  coin = loadImage("coin.png");
  textureMode(NORMAL);
  noStroke();
 
  coin_x = 100+(int)random(1100);
  coin_y = 30;
 
  //coins on the ground
  coin1 = loadImage("coin.png");
  textureMode(NORMAL);
  noStroke();
 
  coin2 = loadImage("coin.png");
  textureMode(NORMAL);
  noStroke();
 
  coin3 = loadImage("coin.png");
  textureMode(NORMAL);
  noStroke();
 
  coin4 = loadImage("coin.png");
  textureMode(NORMAL);
  noStroke();
 
  coin5 = loadImage("coin.png");
  textureMode(NORMAL);
  noStroke();
 
  coin6 = loadImage("coin.png");
  textureMode(NORMAL);
  noStroke();
 
  coin7 = loadImage("coin.png");
  textureMode(NORMAL);
  noStroke();
 
  coin8 = loadImage("coin.png");
  textureMode(NORMAL);
  noStroke();
 
  //bomb
  bomb = loadImage("bomb2.png");
 
  textureMode(NORMAL);
  noStroke();
 
  bomb_x = 100+(int)random(1100);
  bomb_y = 90;
  
  //hearts
  heart1 = loadImage("heart.png");
  textureMode(NORMAL);
  noStroke();
  
  heart2 = loadImage("heart.png");
  textureMode(NORMAL);
  noStroke();
  
  heart3 = loadImage("heart.png");
  textureMode(NORMAL);
  noStroke();
 
  //mario
  mario = loadImage("Mario.png");
}

////////////////////////////////////////////////////

void draw()
{
  //background
  background(background);
  
  ///////////////////////////////////////////////
  
  if(stage == 1)
  {
    textAlign(CENTER);
    textSize(200);
    fill(255, 0, 0);
    text("Mario", 640, 200);
    textSize(50);
    fill(255, 255, 255);
    text("Use the left, right and up arrow keys to move", 640,300);
    textSize(50);
    fill(255, 255, 255);
    text("Collect the coins and avoid the bombs", 640,400);
    textSize(50);
    fill(255, 255, 255);
    text("Press any key to start", 640,500);
    
    if(keyPressed == true)
    {
      stage = 2;
    }
  }
  
  ///////////////////////////////////////////////
 
 if(stage == 2)
 {
  //coin
  pushMatrix();
  translate(coin_x,coin_y);
 
  beginShape();
  texture(coin);
  vertex(-30, -30, 0, 0);
  vertex(30, -30, 1, 0);
  vertex(30, 30, 1, 1);
  vertex(-30, 30, 0, 1);
  endShape(CLOSE);
  popMatrix();
 
  coin_y+=5;
  if(coin_y>680)
  {
    coin_x=100+(int)random(1100);
    coin_y=90;
    lives--;
  }
  if ((coin_y>500)&&(coin_y<675))
  {
    if(abs((coin_x)-(mario_x))<10)
    {
      coins_collected++;
      coin_x = 100+(int)random(1100);
      coin_y = 90;
      coinSound.play();
      coinSound.rewind();
    }
  }
  
  //////////////////////////////////////////////////////
 
  //coins on the ground
  //coin1
  pushMatrix();
  translate(coin1_x,coin1_y);
 
  beginShape();
  texture(coin1);
  vertex(-30, -30, 0, 0);
  vertex(30, -30, 1, 0);
  vertex(30, 30, 1, 1);
  vertex(-30, 30, 0, 1);
  endShape(CLOSE);
  popMatrix();
 
  //coin2
  pushMatrix();
  translate(coin2_x,coin2_y);
 
  beginShape();
  texture(coin2);
  vertex(-30, -30, 0, 0);
  vertex(30, -30, 1, 0);
  vertex(30, 30, 1, 1);
  vertex(-30, 30, 0, 1);
  endShape(CLOSE);
  popMatrix();
 
  //coin3
  pushMatrix();
  translate(coin3_x,coin3_y);
 
  beginShape();
  texture(coin3);
  vertex(-30, -30, 0, 0);
  vertex(30, -30, 1, 0);
  vertex(30, 30, 1, 1);
  vertex(-30, 30, 0, 1);
  endShape(CLOSE);
  popMatrix();
 
  //coin4
  pushMatrix();
  translate(coin4_x,coin4_y);
 
  beginShape();
  texture(coin4);
  vertex(-30, -30, 0, 0);
  vertex(30, -30, 1, 0);
  vertex(30, 30, 1, 1);
  vertex(-30, 30, 0, 1);
  endShape(CLOSE);
  popMatrix();
 
  //coin5
  pushMatrix();
  translate(coin5_x,coin5_y);
 
  beginShape();
  texture(coin5);
  vertex(-30, -30, 0, 0);
  vertex(30, -30, 1, 0);
  vertex(30, 30, 1, 1);
  vertex(-30, 30, 0, 1);
  endShape(CLOSE);
  popMatrix();
 
  //coin6
  pushMatrix();
  translate(coin6_x,coin6_y);
 
  beginShape();
  texture(coin6);
  vertex(-30, -30, 0, 0);
  vertex(30, -30, 1, 0);
  vertex(30, 30, 1, 1);
  vertex(-30, 30, 0, 1);
  endShape(CLOSE);
  popMatrix();
 
  //coin7
  pushMatrix();
  translate(coin7_x,coin7_y);
 
  beginShape();
  texture(coin7);
  vertex(-30, -30, 0, 0);
  vertex(30, -30, 1, 0);
  vertex(30, 30, 1, 1);
  vertex(-30, 30, 0, 1);
  endShape(CLOSE);
  popMatrix();
 
  //coin8
  pushMatrix();
  translate(coin8_x,coin8_y);
 
  beginShape();
  texture(coin8);
  vertex(-30, -30, 0, 0);
  vertex(30, -30, 1, 0);
  vertex(30, 30, 1, 1);
  vertex(-30, 30, 0, 1);
  endShape(CLOSE);
  popMatrix();
 
 ////////////////////////////////////////////////////
 
  //bomb
  pushMatrix();
  translate(bomb_x,bomb_y);
 
  beginShape();
  texture(bomb);
  vertex(-40, -40, 0, 0);
  vertex(40, -40, 1, 0);
  vertex(40, 40, 1, 1);
  vertex(-40, 40, 0, 1);
  endShape(CLOSE);
  popMatrix();
  
  ///////////////////////////////////////////////////////
  
  //hearts
  
  //heart1
  pushMatrix();
  translate(heart1_x,heart1_y);
 
  beginShape();
  texture(heart1);
  vertex(-30, -30, 0, 0);
  vertex(30, -30, 1, 0);
  vertex(30, 30, 1, 1);
  vertex(-30, 30, 0, 1);
  endShape(CLOSE);
  popMatrix();
  
  //heart2
  pushMatrix();
  translate(heart2_x,heart2_y);
 
  beginShape();
  texture(heart2);
  vertex(-30, -30, 0, 0);
  vertex(30, -30, 1, 0);
  vertex(30, 30, 1, 1);
  vertex(-30, 30, 0, 1);
  endShape(CLOSE);
  popMatrix();
  
  //heart3
  pushMatrix();
  translate(heart3_x,heart3_y);
 
  beginShape();
  texture(heart3);
  vertex(-30, -30, 0, 0);
  vertex(30, -30, 1, 0);
  vertex(30, 30, 1, 1);
  vertex(-30, 30, 0, 1);
  endShape(CLOSE);
  popMatrix();
  
  ///////////////////////////////////////////////////////
 
  //coins on the ground
  if ((coin1_y>200)&&(coin1_y<550))                  
  {
    if(abs((coin1_x)-(mario_x))<5)
    {
      if(abs((coin1_y)-(mario_y))<11)
    {
      coins_collected++;
      coin1_x = -20;
      coin1_y = -20;
      coinSound.play();
      coinSound.rewind();
    }
    }
  }
  
  if ((coin2_y>200)&&(coin2_y<550))                  
  { 
    if(abs((coin2_x)-(mario_x))<5)
    {
      if(abs((coin2_y)-(mario_y))<11)
    {
      coins_collected++;
      coin2_x = -20;
      coin2_y = -20;
      coinSound.play();
      coinSound.rewind();
    }
    }
  }
  
  if ((coin3_y>200)&&(coin3_y<550))                  
  { 
    if(abs((coin3_x)-(mario_x))<5)
    {
      if(abs((coin3_y)-(mario_y))<11)
    {
      coins_collected++;
      coin3_x = -20;
      coin3_y = -20;
      coinSound.play();
      coinSound.rewind();
    }
    }
  }
  
  if ((coin4_y>200)&&(coin4_y<550))                  
  { 
    if(abs((coin4_x)-(mario_x))<5)
    {
      if(abs((coin4_y)-(mario_y))<11)
    {
      coins_collected++;
      coin4_x = -20;
      coin4_y = -20;
      coinSound.play();
      coinSound.rewind();
    }
    }
  }
  
  if ((coin5_y>200)&&(coin5_y<550))                 
  { 
    if(abs((coin5_x)-(mario_x))<5)
    {
      if(abs((coin5_y)-(mario_y))<11)
    {
      coins_collected++;
      coin5_x = -20;
      coin5_y = -20;
      coinSound.play();
      coinSound.rewind();
    }
    }
  }
 
  if ((coin6_y>200)&&(coin6_y<550))                  
  {
    if(abs((coin6_x)-(mario_x))<5)
    {
      if(abs((coin6_y)-(mario_y))<11)
    {
      coins_collected++;
      coin6_x = -20;
      coin6_y = -20;
      coinSound.play();
      coinSound.rewind();
    }
    }
  }
  
  if ((coin7_y>200)&&(coin7_y<550))                 
  { 
    if(abs((coin7_x)-(mario_x))<5)
    {
      if(abs((coin7_y)-(mario_y))<11)
    {
      coins_collected++;
      coin7_x = -20;
      coin7_y = -20;
      coinSound.play();
      coinSound.rewind();
    }
    }
  }
  
  if ((coin8_y>200)&&(coin8_y<550))                 
  {
    if(abs((coin8_x)-(mario_x))<5)
    {
      if(abs((coin8_y)-(mario_y))<11)
    {
      coins_collected++;
      coin8_x = -20;
      coin8_y = -20;
      coinSound.play();
      coinSound.rewind();
    }
    }
  }
  ///////////////////////////////////////////////////////////

  bomb_y+=4;
  if(bomb_y>680)
  {
    bomb_x=100+(int)random(1100);
    bomb_y=90;
  }
  if ((bomb_y>500)&&(bomb_y<680))
  {
    if(abs((bomb_x)-(mario_x))<10)
    {
      lives--;
      bomb_x = 100+(int)random(1100);
      bomb_y = 90;
      bombSound.play();
      bombSound.rewind();
    }
  }
  
  //////////////////////////////////////////////////////////////
 
  //mario
  pushMatrix();
  translate(mario_x,mario_y);
  beginShape();
  texture(mario);
  vertex(-70, -70, 0, 0);
  vertex(70, -70, 1, 0);
  vertex(70, 70, 1, 1);
  vertex(-70, 70, 0, 1);
  endShape(CLOSE);
  popMatrix();
  
  ////////////////////////////////////////////////////////////
 
  if(keyPressed == true)
  {
    if(keyCode == RIGHT)
    {
      mario_x+=8;
    }
    if(keyCode == LEFT)
    {
      mario_x-=8;
    }
    if(keyCode == UP)
    {
       if(mario_y == 640)
      {
        mario_y -= 100;
      }
    }
  }
  
  //////////////////////////////////////////////////////////////
 
  //text
  textSize(40);
  fill(255,255,0);
  text("Coins Collected: " + coins_collected, 200, 50);
 
  fill(255, 255, 0);
  text("Lives: " , 830, 50);
 
 ///////////////////////////////////////////////////////////////
 
  textSize(200);
  fill(255, 0, 0);
  if(lives<1) text("Game Over", 640, 400);
  if(lives<1) theme.pause();
  if(lives<1) gameOverSound.play();
  coin_count++;
 
 /////////////////////////////////////////////////////////////
    
  if(lives == 2)
  {
    heart3_x = -20; heart3_y = -20;
  }
    
  if(lives == 1)
  {
    heart2_x = -20; heart2_y = -20;
  }
    
  if(lives == 0)
  {
    heart1_x = -20; heart1_y = -20;
  }
 
  if(quit == 1)
  {
    delay(5000);
    exit();
  }
 
  if(lives<1)
    {
      quit = 1;
    }
}
}
/////////////////////////////////////////////////////////////////


void keyReleased()
{
  if(keyCode == UP)
  {
    mario_y += 100;
  }
}

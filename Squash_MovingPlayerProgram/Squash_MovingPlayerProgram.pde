color wallColor = color(122, 122, 122);
int wallWidthSide = 100;
int wallWidthTop = 100;

color playgroundColor = #EAD795;
int playgroundWidth = 600;
int playgroundHeight = 500;


color playerColor = #1683F5;
int playerWidth = 100;
int playerHeight = 10;
int playerPositionX;
int playerPositionY;
int playerSpeed = 10;
int playerDistanceFromBottom = 50;

void setup() {
  size(800, 600);
  background(wallColor);
  playerPositionX = width/2  - playerWidth/2;
  playerPositionY = height - playerDistanceFromBottom;
}

void draw() {
  drawPlayground();
  drawPlayer();
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == LEFT) {
      movePlayerLeft();
    } else if (keyCode == RIGHT) {
      movePlayerRight();
    }
  }
}

void drawPlayground() {
  fill(playgroundColor);
  rect(wallWidthSide, wallWidthTop, playgroundWidth, playgroundHeight);
}

void drawPlayer() {
  fill(playerColor);
  rect(playerPositionX, playerPositionY, playerWidth, playerHeight);
}

void movePlayerLeft(){
  if(playerPositionX > wallWidthSide + playerSpeed)
        playerPositionX -= playerSpeed;
}

void movePlayerRight(){
    if(playerPositionX < wallWidthSide + playgroundWidth - playerSpeed - playerWidth)
        playerPositionX += playerSpeed;
}

color wallColor = color(122, 122, 122);
int wallWidthSide = 100;
int wallWidthTop = 100;

color playgroundColor = #EAD795;
int playgroundWidth = 600;
int playgroundHeight = 500;

color ballColor = #AA0C17;
float ballDiameter = 10;
float ballRadius = ballDiameter/2;
int ballPositionX;
int ballPositionY;
int ballSpeed = 5;
int ballSpeedX = ballSpeed;
int ballSpeedY = - ballSpeed;

color playerColor = #1683F5;
int playerWidth = 100;
int playerHeight = 10;
int playerPositionX;
int playerPositionY;
int playerSpeed = 3 * ballSpeed;
int playerDistanceFromBottom = 50;

int points = 0;


void setup() {
  size(800, 600);
  ballPositionX = width/2;
  ballPositionY = height/2;
  playerPositionX = width/2  - playerWidth/2;
  playerPositionY = height - playerDistanceFromBottom;
}


void draw() {
  background(wallColor);
  drawPlayground();
  drawBall();
  drawPlayer();
  drawPoints();
  if (ballPositionY >= wallWidthTop + playgroundHeight - ballRadius) {
    endGame();
    noLoop(); // draw Loop will be stopped
  }
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


void endGame() {
  fill(0);
  rect(0, 0, width, height);
  fill(255);
  textSize(20);
  textAlign(CENTER);
  text("Deine Punktzahl: " + points, width/2, height/2);
}


void drawPlayground() {
  fill(playgroundColor);
  rect(wallWidthSide, wallWidthTop, playgroundWidth, playgroundHeight);
}


void drawBall() {
  fill(ballColor);
  ellipse(ballPositionX, ballPositionY, ballDiameter, ballDiameter);
  if (ballPositionX <= wallWidthSide + ballRadius || ballPositionX >= wallWidthSide + playgroundWidth - ballRadius) {
    ballSpeedX = -ballSpeedX;
  }
  if (ballPositionY <= wallWidthTop + ballRadius || ballPositionY >= wallWidthTop + playgroundHeight - ballRadius || isCollision()) {
    ballSpeedY = -ballSpeedY;
  }

  ballPositionX += ballSpeedX;
  ballPositionY += ballSpeedY;
}


boolean isCollision() {
  boolean isXCollision = false;
  boolean isYCollision = false;
  boolean isCollision = false;
  if (ballPositionX >= playerPositionX && ballPositionX <= playerPositionX + playerWidth) {
    isXCollision = true;
  }
  if (ballPositionY >= playerPositionY - ballRadius && ballPositionY < playerPositionY - ballRadius + ballSpeedY) {
    isYCollision = true;
  }
  isCollision = isXCollision && isYCollision;
  if (isCollision) {
    points++;
  }
  return isCollision;
}

void drawPoints() {
  fill(255);
  textSize(20);
  text("Punkte: " + points, 40, 40);
}

void drawPlayer() {
  fill(playerColor);
  rect(playerPositionX, playerPositionY, playerWidth, playerHeight);
}


void movePlayerLeft() {
  if (playerPositionX > wallWidthSide + playerSpeed)
    playerPositionX -= playerSpeed;
}


void movePlayerRight() {
  if (playerPositionX < wallWidthSide + playgroundWidth - playerSpeed - playerWidth)
    playerPositionX += playerSpeed;
}

color wallColor = color(122, 122, 122);
int wallWidthSide = 100;
int wallWidthTop = 100;

color playgroundColor = #EAD795;
int playgroundWidth = 600;
int playgroundHeight = 400;

color ballColor = #AA0C17;
float ballDiameter = 10;
float ballRadius = ballDiameter/2;
int xPosition;
int yPosition;
int speedX = 5;
int speedY = -5;

void setup() {
  size(800, 600);
  xPosition = width/2;
  yPosition = height/2;
  background(wallColor);
}

void draw() {
  drawPlayground();
  drawBall();
}

void drawPlayground() {
  fill(playgroundColor);
  rect(wallWidthSide, wallWidthTop, playgroundWidth, playgroundHeight);
}

void drawBall() {
  fill(ballColor);
  ellipse(xPosition, yPosition, ballDiameter, ballDiameter);
  if (xPosition <= wallWidthSide + ballRadius || xPosition >= wallWidthSide + playgroundWidth - ballRadius) {
    speedX = -speedX;
  }
  if (yPosition <= wallWidthTop + ballRadius || yPosition >= wallWidthTop + playgroundHeight - ballRadius) {
    speedY = -speedY;
  }

  xPosition += speedX;
  yPosition += speedY;
}

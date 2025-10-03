int total = 0; 
void setup()
{
  size(500, 340); 
   textAlign(CENTER, CENTER);
   textSize(20);
  noLoop(); 
  background(0);
}
void draw()
{
  background(0); // Clear screen
  total = 0;     

  // dice grid
  for (int y = 30; y <= 280; y += 50) {
    for (int x = 25; x <= 465; x += 55) {
      Coin bob = new Coin(x, y);
      bob.flip();
      bob.show();
      total += bob.value;
    }
  }

  // 
  fill(total,total+100, total+60);
  rect(0, height - 30, width, 40, 10); 
  fill(0);
  text("Your Total: " + total, width / 2, height - 14);
}
void mousePressed()
{
  redraw();
}
class Coin {
  int value;     // Dice value (1 to 6)
  int myX, myY;  

  Coin(int x, int y) {
    myX = x;
    myY = y;
    value = 1;
  }

  void flip() {
    value = (int)(Math.random() * 6) + 1;
  }

  void show() {
  fill(255);
  stroke(0); 
  rect(myX - 25, myY - 25, 50, 50, 10);

  fill(0); 
  float r = 5; 

  // Coordinates for dot positions based on first int and second int
  float[][] positions = {
    {myX, myY}, // center
    {myX - 15, myY - 15}, // top-left
    {myX + 15, myY + 15}, // bottom-right
    {myX + 15, myY - 15}, // top-right
    {myX - 15, myY + 15}, // bottom-left
    {myX - 15, myY},      // middle-left
    {myX + 15, myY}       // middle-right
  };

  // Draw dots based on value
  switch (value) {
    case 1:
      ellipse(positions[0][0], positions[0][1], r, r); // r is radius
      break;
    case 2:
      ellipse(positions[1][0], positions[1][1], r, r);
      ellipse(positions[2][0], positions[2][1], r, r);
      break;
    case 3:
      ellipse(positions[0][0], positions[0][1], r, r);
      ellipse(positions[1][0], positions[1][1], r, r);
      ellipse(positions[2][0], positions[2][1], r, r);
      break;
    case 4:
      ellipse(positions[1][0], positions[1][1], r, r);
      ellipse(positions[2][0], positions[2][1], r, r);
      ellipse(positions[3][0], positions[3][1], r, r);
      ellipse(positions[4][0], positions[4][1], r, r);
      break;
    case 5:
      ellipse(positions[0][0], positions[0][1], r, r);
      ellipse(positions[1][0], positions[1][1], r, r);
      ellipse(positions[2][0], positions[2][1], r, r);
      ellipse(positions[3][0], positions[3][1], r, r);
      ellipse(positions[4][0], positions[4][1], r, r);
      break;
    case 6:
      ellipse(positions[1][0], positions[1][1], r, r);
      ellipse(positions[2][0], positions[2][1], r, r);
      ellipse(positions[3][0], positions[3][1], r, r);
      ellipse(positions[4][0], positions[4][1], r, r);
      ellipse(positions[5][0], positions[5][1], r, r);
      ellipse(positions[6][0], positions[6][1], r, r);
      break;
     }
  }
}

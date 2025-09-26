void setup()
{
	int total = 0; // Total of all dice rolls
	size(500, 340); // Extra height for total box
 	textAlign(CENTER, CENTER);
 	textSize(20);
	noLoop(); // Only redraw when mouse is pressed
	background(0);
}
void draw()
{
	background(0); // Clear screen
  total = 0;     // Reset total

  // Draw dice grid
  for (int y = 30; y <= 280; y += 50) {
    for (int x = 25; x <= 465; x += 55) {
      Coin bob = new Coin(x, y);
      bob.flip();
      bob.show();
      total += bob.value;
    }
  }

  // Draw total box at bottom
  fill(total,total+100, total+60);
  rect(0, height - 30, width, 40, 10); // Rounded box
  fill(0);
  text("Your Total: " + total, width / 2, height - 14);
}
void mousePressed()
{
	redraw();
}
class Coin {
  int value;     // Dice value (1 to 6)
  int myX, myY;  // Position of the dice

  Coin(int x, int y) {
    myX = x;
    myY = y;
    value = 1;
  }

  void flip() {
    value = (int)(Math.random() * 6) + 1;
  }

  void show() {
    fill(255); // White dice
    stroke(0); // Black border
    rect(myX - 25, myY - 25, 50, 50, 10); // Rounded corners
    fill(0); // Black text
    text(value, myX, myY);
  }
}

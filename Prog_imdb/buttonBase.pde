class ButtonBase {
  float x, y, w, h;
  String label;

  ButtonBase(float xPos, float yPos, float width, float height, String labelText) {
    x = xPos;
    y = yPos;
    w = width;
    h = height;
    label = labelText;
  }

  void display() {
    stroke(0);
    fill(255);
    rect(x, y, w, h);
    fill(0);
    textAlign(CENTER, CENTER);
    text(label, x + w / 2, y + h / 2);
  }

  boolean isClicked() {
    return mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h && mousePressed;
  }
}

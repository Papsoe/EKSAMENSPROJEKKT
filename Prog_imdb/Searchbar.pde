// Søgebjælkeklasse
class SearchBar {
  float x, y, w, h;
  String inputText = "";
  boolean coded = false;

 SearchBar(float xPos, float yPos, float width, float height) {
    x = xPos;
    y = yPos;
    w = width;
    h = height;
  }

  String getSearchTerm() {
    return inputText;
  }

  void display() {
    // Tegn søgebjælken
    stroke(0);
    fill(255);
    rect(x, y, w, h);

    // Tegn teksten i søgebjælken
    fill(0);
    textAlign(LEFT, CENTER);
    text(inputText, x + 10, y + h/2);
  }

  void keyPressed() {
    if (coded) {
      if (key == BACKSPACE && inputText.length() > 0) {
        inputText = inputText.substring(0, inputText.length() - 1);
      } else if (key != ENTER && key != BACKSPACE) {
        inputText += key;
      }
    }
  }

  void mousePressed() {
    if (mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h) {
      coded = !coded;
    } else {
      coded = false;
    }
  }
}

class Debug {

  void draw(String[] lines, int x, int y){

    color boardColor = color(0, 0, 0);
    color textColor = color(80, 20, 200);

    draw(lines, x, y, boardColor, textColor);

  }

  void draw(String[] lines, int x, int y, color boardColor, color textColor) {

    int lineHeight = 9;
    int charWidth = 5;
    int textSize = 16;

    int longest = 0;
    for (int i = 0; i < lines.length; i++){
      if (lines[i].length() > longest){
        longest = lines[i]. length();
      }
    }

    fill(boardColor);
    rect(x, y, longest * charWidth, lines.length * lineHeight);
    fill(textColor);
    for (int i = 0; i < lines.length; i++){
      text(lines[i], x, y + (i + 1) * lineHeight);
    }
  }

}

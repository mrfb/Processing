class Stanza {
  float x, y;
  boolean leftAligned;
  String text;
  int numLines;
  int revealed; // number of revealed characters
  
  Stanza(String p_text, boolean p_leftAligned){
    text = p_text;
    numLines = split(text, "\n").length;
    
    leftAligned = p_leftAligned;
    if(leftAligned){
      x = margin;
    } else {
      x = width - margin;
    }
    
    revealed = 0;
  }
}
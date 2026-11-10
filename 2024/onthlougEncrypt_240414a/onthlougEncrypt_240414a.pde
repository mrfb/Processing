// substitute every vowel for a different vowel
// substitute every consonant for a random consonant

// this should be a file in the data folder
String[] lines = loadStrings("session19day51.txt");

// below here you shouldn't need to fuss with
// (but you are welcome to)
// praise onthloug
String[] linesOut = new String[lines.length];
for(int i = 0; i < linesOut.length; i++){
  linesOut[i] = "";
}

String lowerConsonants = "qwrtpsdfghjklzxcvbnm";
String upperConsonants = lowerConsonants.toUpperCase();

for (int i = 0 ; i < lines.length; i++) {
  for (int j = 0; j < lines[i].length(); j++){
    char input = lines[i].charAt(j);
    char output;
    switch(input){
      case 'a':
        output = "eiouy".charAt((int)random(5));
        break;
      case 'e':
        output = "aiouy".charAt((int)random(5));
        break;
      case 'i':
        output = "aeouy".charAt((int)random(5));
        break;
      case 'o':
        output = "aeiuy".charAt((int)random(5));
        break;
      case 'u':
        output = "aeioy".charAt((int)random(5));
        break;
      case 'y':
        output = "aeiou".charAt((int)random(5));
        break;
      case 'A':
        output = "eiouy".toUpperCase().charAt((int)random(5));
        break;
      case 'E':
        output = "aiouy".toUpperCase().charAt((int)random(5));
        break;
      case 'I':
        output = "aeouy".toUpperCase().charAt((int)random(5));
        break;
      case 'O':
        output = "aeiuy".toUpperCase().charAt((int)random(5));
        break;
      case 'U':
        output = "aeioy".toUpperCase().charAt((int)random(5));
        break;
      case 'Y':
        output = "aeiou".toUpperCase().charAt((int)random(5));
        break;
      case ' ':
        output = ' ';
        break;
      case '-':
        output = '-';
        break;
      case '.':
        output = '.';
        break;
      case '?':
        output = '?';
        break;
      case '=':
        output = '=';
        break;
      case ':':
        output = ':';
        break;
      case '/':
        output = '/';
        break;
      case '_':
        output = '_';
        break;
      case '\t':
        output = '\t';
        break;
      default:
        if(int(input) <= int('Z')){
          output = upperConsonants.charAt((int)random(upperConsonants.length()));
        } else if(int(input) <= int('z')){
          output = lowerConsonants.charAt((int)random(lowerConsonants.length()));
        } else {
          output = input;
        }
        break;
    }
    linesOut[i] += output;
    println(input + "->" + output + "\t(" + int(input) + "->" + int(output)+")");
  }
}

saveStrings("output.txt", linesOut);

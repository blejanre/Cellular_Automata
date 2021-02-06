class Automaton {
  
  int hoodSize;
  int base;
  int rule;
  int displaySize;
  int gridSize;
  int[][] grid;
  
  
  Automaton() {
    
    hoodSize = 1;
    base = 2;
    rule = 110;
    displaySize = 100;
    gridSize = displaySize + (2*hoodSize*(displaySize - 1));
    grid = new int[gridSize][gridSize];
    
    //get the first row of the grid
    for (int j=0; j<gridSize; j++) {
      grid[0][j] = int(random(base));
    }
    
    // obtain the rule in its native base with each digit its own element in an array
    String wordRule = str(fromDecimal(rule, base));
    int zeros = int(pow(base, (1 + 2*hoodSize))) - wordRule.length();
    for (int i=0; i < zeros; i++) {
      wordRule = "0" + wordRule;
    }
    int[] trueRule = new int[wordRule.length()];
    trueRule = reverse(trueRule); //because Wolfram's convention (so I can convert the neighborhood to an index)
  }
 
  void update() {
    int rowLen = gridSize;
    
    for(int i=0; i<gridSize; i++) {
      for (int j=0; j<gridSize; j++) {
        
      }
    }
  }
  
  void display() {
    
  }
  int toDecimal(int num, int base) {
    
    String numString = str(num);
    int columns = numString.length() - 1;
    int result = 0;
    
    for(int i=columns; i>=0; i--) {
      int digit = Integer.parseInt(str(numString.charAt(columns - i)));
      println(digit, base, i);
      result += digit * pow(base, i);
    }
    return result;
  }
  
  int fromDecimal(int num, int base) {
    
    int quotient = num;
    String stringResult = "";
    
    while (quotient != 0) {   
      String digit = str(quotient % base);
      stringResult = digit + stringResult; 
      quotient = floor(quotient / base);    
    }
    int result = Integer.parseInt(stringResult);
    return result; 
  }
}

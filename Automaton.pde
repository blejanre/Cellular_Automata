class Automaton {
  
  int hoodSize;
  int base;
  int rule;
  int[] trueRule;
  int displaySize;
  int gridSize;
  int[][] grid;
  int scalar;
  
  Automaton() {
    
    hoodSize = 2;
    base = 2;
    rule = 1023;
    scalar = 2;
    displaySize = 1000/scalar;
    gridSize = displaySize + hoodSize*2;
    grid = new int[displaySize][gridSize];
    
    //get the first row of the grid
    for (int j=0; j<gridSize; j++) {
      grid[0][j] = int(random(base));
    }
    
    // obtain the rule in its native base with each digit its own element in an array
    String wordRule = fromDecimal(rule, base);
    int zeros = int(pow(base, (1 + 2*hoodSize))) - wordRule.length();
    for (int i=0; i < zeros; i++) {
      wordRule = "0" + wordRule;
    }
    println(wordRule);
    trueRule = new int[wordRule.length()];
    for (int i=0; i < wordRule.length(); i++) {
      trueRule[i] = Integer.parseInt(str(wordRule.charAt(i)));
    }
    trueRule = reverse(trueRule); //because Wolfram's convention (so I can convert the neighborhood to an index)
    
    //populate the sidelines with random values
    for(int i=1; i<displaySize; i++) {
      for (int j=0; j<hoodSize; j++) {  //left side
        grid[i][j] = 0;//int(random(base));
      }
      for (int j=gridSize - hoodSize; j<gridSize; j++) { //right side
        grid[i][j] = 0;//int(random(base));
      }
    }
  }
  
 
  void update() {

    //The Bread and Butter
    for(int i=1; i<displaySize; i++) {
      for (int j=hoodSize; j<displaySize+1; j++) {
        int output = nextGen(hoodSize, trueRule, grid[i-1], j, base);
        grid[i][j] = output;
      }
    }
    textSize(60);
    fill(0);
    text(str(rule), 1100, 80);
  }
  
  
  void display() {
    for(int i=0; i<displaySize; i++) {
      for (int j=0; j<gridSize; j++) {
        if (grid[i][j] == 1) {
          fill(0);
          rect(20+scalar*j, 20+scalar*i, scalar, scalar);
        }
      }
    }
  }
  
  void next() {
    
    fill(255);
    noStroke();
    rect(0, 0, width, height);
    grid = new int[displaySize][gridSize];
    rule += 1;
    
    //get the first row of the grid
    for (int j=0; j<gridSize; j++) {
      grid[0][j] = int(random(base));
    }
    
    // obtain the rule in its native base with each digit its own element in an array
    String wordRule = fromDecimal(rule, base);
    int zeros = int(pow(base, (1 + 2*hoodSize))) - wordRule.length();
    for (int i=0; i < zeros; i++) {
      wordRule = "0" + wordRule;
    }
    println(wordRule);
    trueRule = new int[wordRule.length()];
    for (int i=0; i < wordRule.length(); i++) {
      trueRule[i] = Integer.parseInt(str(wordRule.charAt(i)));
    }
    trueRule = reverse(trueRule); //because Wolfram's convention (so I can convert the neighborhood to an index)
    
    //populate the sidelines with random values
    for(int i=1; i<displaySize; i++) {
      for (int j=0; j<hoodSize; j++) {  //left side
        grid[i][j] = 0;//int(random(base));
      }
      for (int j=gridSize - hoodSize; j<gridSize; j++) { //right side
        grid[i][j] = 0;//int(random(base));
      }
    }
  }

  int toDecimal(int num, int base) {
    
    String numString = str(num);
    int columns = numString.length() - 1;
    int result = 0;
    
    for(int i=columns; i>=0; i--) {
      int digit = Integer.parseInt(str(numString.charAt(columns - i)));
      //println(digit, base, i);
      result += digit * pow(base, i);
    }
    return result;
  }
  
  String fromDecimal(int num, int base) {
    
    int quotient = num;
    String result = "";
    
    while (quotient != 0) {   
      String digit = str(quotient % base);
      result = digit + result; 
      quotient = floor(quotient / base);    
    }
    
    return result; 
  }
  
  int nextGen(int hood_size, int[] true_rule, int[] last_gen, int j, int base) {
    String hood = ""; //code in string form
    for (int n = -hoodSize; n < hoodSize+1; n++) {  //go through the previous row to the left and right r=hoodSize to get code in String form
      hood += str(last_gen[j + n]);
    }
    int index = toDecimal(Integer.parseInt(hood), base);
    int result = true_rule[index];
    return result;
  }

}

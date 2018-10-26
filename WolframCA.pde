

public class WolframCA {
  int cellSize = 5; // size of each square cell
  int bitCount = 3; // how many bits to record to take the average
  int col = width/cellSize; // how many columns of cells based on size
  int row = height/cellSize; // how many rows of cells based on size;
  PFont arial = createFont("SansSerif",36,true);  // Arial text font
  int[] ruleset; // the ruleset described earlier
  int[] cells; // keep track of current generation of cells
  ArrayList<int[]> historyMatrix; // ArrayList of generations of cells
  String binaryString; // string of binary numbers taken from center of each generation
  String randNumString; // record numbers from binaryString based on bitcount many bits
  int generation; // keep track of how many generations passed
  int totalAdded; // keep track of total of added numbers from randNumString
  float average; // average value from totalAdded/generation

  WolframCA(int[] ruleset) {
    this.ruleset= ruleset; 
    cells = new int[col]; // col many cells for current generation
    cells[col/2] = 1; // add one cell to center
    historyMatrix = new ArrayList<int[]>();
    for (int i = 0; i < col - 1; i++) { // add generations of empty arrays
      historyMatrix.add(new int[col]);
    }
    historyMatrix.add(cells); // add our current generation
    binaryString = "1"; // current center value is 1 (alive cell in the center)
    randNumString = ""; 
    generation = 1;
    totalAdded = 0;
    average = 0;
  }
  
  WolframCA(int[] ruleset, int[] seed) {
    this(ruleset);
    if (seed.length == cells.length) {
      cells = seed.clone();
    }
    
  }
  
  int[] nextGenCells(int[] cells) {
    int[] newGeneration = new int[col];

    int left, middle, right;
    for (int i = 1; i < cells.length - 1; i++) {
      left = cells[i - 1];
      middle = cells[i];
      right = cells[i + 1];
      int decValue = binaryToDecimal(left, middle, right);
      newGeneration[i] = ruleset[decValue];
    }

    newGeneration[0] = ruleset[binaryToDecimal(cells[col - 1], cells[0], cells[0 + 1])];
    newGeneration[col - 1] = ruleset[binaryToDecimal(cells[col - 2], cells[col - 1], cells[0])];
    
    return newGeneration;
  }
  
  
  void nextGeneration() {
    
    cells = nextGenCells(cells);
    historyMatrix.add(cells);
    while (historyMatrix.size() > row) {
      historyMatrix.remove(0);
    }
    generation += 1;
    
    binaryString += str(cells[col/2]);
    if (binaryString.length() > 52) {
      binaryString = binaryString.substring(1, binaryString.length());
    }
    
    if (generation % bitCount == 0) {
      randNumString += " ";
      int num = Integer.parseInt(binaryString.substring(binaryString.length() - bitCount, binaryString.length()), 2);
      randNumString += num;
      totalAdded += num;
      average = float(totalAdded) / (generation / bitCount);
      
    }
    
    if (randNumString.length() > 52) {
      randNumString = randNumString.substring(1, randNumString.length());
    }
    
    
  }

  int binaryToDecimal(int left, int middle, int right) {
    return left * 4 + middle * 2 + right * 1;
  }

  public void display() {
    noStroke();
    fill(0);
    for (int i = 0; i < row; i++) {
      int[] currCells = historyMatrix.get(i);
      for (int j = 0; j < col; j++) {
        if (currCells[j] == 1) {
          rect(j * cellSize, i * cellSize, cellSize, cellSize);
        }
      }
    }
    
    drawRandomBinary();
    drawRandomNumberString();
    drawAverage();
  }
  
  void drawRandomBinary() {
    fill(#A2FDFF, 155);
    rect((col/2) * cellSize, 0, cellSize, row * cellSize);
    
    fill(255);
    rect(0, 0, width, 48);
    fill(70);
    textFont(arial);
    textAlign(RIGHT);
    
    text(binaryString, width - 20 , 40);
  }
  
  void drawRandomNumberString() {
    fill(255);
    rect(0, 48, width, 48);
    fill(70);
    textFont(arial);
    textAlign(RIGHT);
    text(randNumString, width - 20, 80);
  }
  
  void drawAverage() {
    fill(255);
    rect(0, 48, 150, 48);
    fill(70);
    text(String.format("%.2f", average), 140, 80);
  }
}
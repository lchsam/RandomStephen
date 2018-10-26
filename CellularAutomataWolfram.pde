
int[] ruleset; // Wolfram cellular automata ruleset
WolframCA ca; // Responsible for managing cells and displaying them
boolean play; // determines if next generation should be created

void setup() {
  //orientation(LANDSCAPE);
  size(1200, 700);
  ruleset = new int[]{0, 1, 1, 1, 1, 0, 0, 0}; 
  // ruleset corresponding binary value of the index to cell
  int[] seed = new int[240];
  for (int i = 0; i < seed.length; i++) {
    seed[i] = int(random(2));
  }
  ca = new WolframCA(ruleset, seed);
  play = true;
}

void draw() {
  background(255);
  //white background
  ca.display();
  //display cells and numbers.
  if (play) { // if play is true
    ca.nextGeneration();
    //generate next generation
  }
}

void keyPressed() {
  if (key == ' ') { // space to stop/resume next generation.
    play = !play;
  }
}
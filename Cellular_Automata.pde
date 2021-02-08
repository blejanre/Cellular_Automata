

Automaton ben = new Automaton();

void setup() {
  size(1440, 800);
  background(255);

}

void draw() {
  ben.update();
  ben.display();
  fill(255);
  noStroke();
  rect(0, height-20, width, height);
}

void keyPressed() {
  ben.next();
}

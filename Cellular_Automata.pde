//functions... maybe they don't belong here

Automaton ben = new Automaton();

void setup() {
  size(720, 800);
  String word = "1234";
  int[] x = new int[4];
  for (int i=0; i<word.length(); i++) {
    x[i] = Integer.parseInt(str(word.charAt(i)));
  }
  println(x);
  
}

void draw() {

}

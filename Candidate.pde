public class Candidate {
  PApplet p;
  String name;
  int party;
  ArrayList<Event> events = new ArrayList<Event>();
  Candidate(PApplet parent, String n) {
    p = parent;
    name = n;
  }
  public void addEvent(String d, String t, String a) {
    events.add(new Event(d, t, a));
  }
  
  
}

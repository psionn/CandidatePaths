public class Event {
  Date datetime;
  String address, dateString, timeString;
  Event(String d, String t, String a) {
    dateString = d;
    timeString = t;
    address = a;
    SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd hh:mm aa");
    
    try {
      datetime = df.parse(d + " " + t);
    } catch (Exception e) {
      datetime = new Date();
      System.out.println("Parse Error : " + d + " " + t + " @ " + a); 
    }
  }
  
  
}


import org.jsoup.*;
import org.jsoup.nodes.*;
import org.jsoup.select.Elements;
import java.util.ArrayList;
import java.util.Date;
import java.text.*;


String[] dates = {
  "10-01", "10-02", "10-03", "10-04", "10-05", 
  "10-06", "10-07", "10-08", "10-09", "10-10", 
  "10-11", "10-12", "10-13", "10-15", //10-14
  "10-16", "10-17", "10-18", "10-19", "10-20", 
  "10-21", "10-22", "10-23", "10-24", "10-25", 
  "10-26", "10-27", "10-28", "10-29", "10-30", "10-31", 
  "11-01", "11-02", "11-03", "11-04", "11-05"
};
HashMap<String, Candidate> candidates = new HashMap<String, Candidate>();

void setup() {
  size(400, 400, P3D);
  background(0);
  Elements names, places, times;
  boolean success = true;
  for (int i = 0; i < dates.length; i++) {
    println("date " + dates[i]);
    try {
      Document doc = Jsoup.connect("http://www.politico.com/2012-election/calendar/2012-"+dates[i]+"-FULL.html").get();
      names = doc.select("li.vevent > h5");
      places = doc.select("div.event-location");
      times = doc.select("th[scope=row]");
      for (int j = 0 ; j < places.size() ; j ++ ) {
        if (candidates.containsKey(names.get(j).text())) {
          candidates.get(names.get(j).text()).addEvent("2012-"+dates[i], times.get(j).text(), places.get(j).text());
        } 
        else {
          candidates.put(names.get(j).text(), new Candidate(this, names.get(j).text()));
          candidates.get(names.get(j).text()).addEvent("2012-"+dates[i], times.get(j).text(), places.get(j).text());
        }
      }
    } 
    catch (Exception e) {
      // TODO Auto-generated catch block
      success = false;
      println(dates[i] + " error.");
      e.printStackTrace();
    }
  }
  
  println("Barack Obama has been to " + candidates.get("Barack Obama").events.size() + "events since October 1st");
  println("Mitt Romney has been to " + candidates.get("Mitt Romney").events.size() + "events since October 1st");

}

void draw() {
}

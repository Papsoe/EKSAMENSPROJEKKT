
class tabManager {
  HashMap<String,  skiftTab>  skiftTabs;
  skiftTab currentGameState = null;

  tabManager() {
     skiftTabs = new HashMap<String,  skiftTab>();
  }

  void tilFoejGameState(String name,  skiftTab state) {
     skiftTabs.put(name, state);
  }

  void skiftMovie(String name) {
    currentGameState =  skiftTabs.get(name);
  }

  void draw() {
    currentGameState.draw();
  }
}
  

JSONArray c; 
ArrayList<PShape> cities;
ArrayList<State> states;
ArrayList<PVector> vertices;
Table table;
import java.util.*;
Case[] cases;


void setup(){
  size(900, 600);
  states = new ArrayList<State>();
  //cities = new ArrayList<PShape>();
  loadData();
}


void draw(){
  background(255);
  //pushMatrix();
  //translate(-50, -200);
  //scale(3.0);
  
  
  
  for(int z = 0; z < states.size(); z++){
    if(states.get(z) != null){
      states.get(z).display();
    }
  }
  
  for(Case c:cases){
    c.display();
  }
  
  
  //for(int z = 0; z < cities.size(); z++){
  //  if(cities.get(z) != null){
  //    shape(cities.get(z), 0,0);
  //  }
  //}
  //popMatrix();
}

void loadData(){
  
  //data obtained from https://mapzen.com/data/borders/ 
  
  //increase memory size to 2048MB for level 8
  //JSONObject state = loadJSONObject("regions.geojson");
  JSONObject state = loadJSONObject("admin_level_4.geojson");
  //JSONObject city = loadJSONObject("admin_level_8.geojson");
  
  JSONArray f = state.getJSONArray("features");
    
  for(int i = 0; i < f.size(); i++){
    JSONArray a = f.getJSONObject(i).getJSONObject("geometry").getJSONArray("coordinates");
    states.add(new State(a));
  }
  table = loadTable("CleanMPVDataset1.csv", "header");
  cases = new Case[table.getRowCount()];
  for(int i = 0; i < table.getRowCount(); i++){
    TableRow r = table.getRow(i);
    cases[i] = new Case(convertLat(r.getFloat("latitude")), convertLon(r.getFloat("longitude"))); 
  }
  
  
}

void mouseMoved(){
  
  for(int i = 0; i<states.size(); i++){
    states.get(i).cursorIn(mouseX, mouseY); 
  }
}
float convertLon(float lon){
    return width*(lon + 175)/120;
  }
float convertLat(float lat){
  return (height*(1 - (lat+ 105)/180))*(180/60);
}
  
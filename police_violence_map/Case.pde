class Case{
  
  String name;
  String date;
  float latitude;
  float longitude;
  
  Case(String n, String d, float lat, float lon){
    name = n;
    date = d;
    latitude = lat;
    longitude = lon;
    
  }
   
  void display(){
    ellipse(latitude, longitude, 50, 50);
    fill(0);
  }
  
  //convert latitude and longitude to x,y coordinates  
  //float[] to_XY(){
    //return 
  //}
}
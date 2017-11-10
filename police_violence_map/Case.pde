class Case{
  
  String name;
  String date;
  float latitude;
  float longitude;
  
  Case(float lon, float lat){
    //name = n;
    //date = d;
    latitude = lat;
    longitude = lon;
    
  }
   
  void display(){
    ellipse(latitude, longitude, 2, 2);
    fill(255,0,0);
  }
  
  //convert latitude and longitude to x,y coordinates  
  //float[] to_XY(){
    //return 
  //}
  
}
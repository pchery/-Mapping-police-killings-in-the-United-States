Case[] cases;

void setup(){
  size(900, 600); 
  loadData();
}


void draw(){
  background(255);
  Case c = new Case("hello", "world",100,100);
  c.display();
}

void loadData(){
  //load file into array
  //loop through array and create case objects to fill the cases array
}
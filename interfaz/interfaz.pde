boolean overBox = false;
boolean locked = false;
int xs = 20;
int ys = 50;
int xp = 50;
int yp = 30;
int xOffset;
int yOffset;

 import processing.serial.*;
 Serial myPort;
 int val;
 
void setup(){
  size(500, 500);
  String portName = Serial.list()[0];
  myPort = new Serial(this, portName, 9600);
}

void draw(){
  background(255);
  
  stroke(0);
  fill(0);
  rect(20, 50, 460, 5);
  
  if(mouseX > xp && mouseX < xp + xs && mouseY > yp && mouseY < yp + ys ){
    overBox = true;
    stroke(255, 0, 0);
    fill(130);
  }else{
    overBox = false;
    fill(130);
  }
  
  rect(xp, yp, xs, ys);
  
  float g = map(xp, 20, 460, 0, 180);
  
  myPort.write(byte(g));
  
  println(int (g));
}

void mousePressed() {
  if(overBox) { 
    locked = true; 
    fill(0);
  } else {
    locked = false;
  }
  
  xOffset = mouseX-xp; // lo toma desde el punto n que el mouse fue presionado
}

void mouseDragged() {
  if(locked) {
    xp = mouseX - xOffset;
    if(xp <= 20){
      xp = 20;
    }else if(xp >= 460){
      xp = 460;
    } 
  }
}

void mouseReleased() {
  //locked = false;
}

class potenciometro{
  
}

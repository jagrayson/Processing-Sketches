float time = 0;
import processing.svg.*;

void setup(){
 size(1000, 1000); 
}

void draw(){
 background(0);
 translate(width/2, height/2);
 stroke(255);
 noFill();
 
 int rad = 250;
 int total = 300;
 float increment = PI / (float) total;
 float theta = 1;
 for (float i = 0; i < 75; i++){
  beginShape();
   for (float angle = -PI/2; angle <= PI/2; angle += increment) {
     float r = rad + 20*sin(10*angle - theta*time/8);
     float x = (10/i)*r * cos(angle);
     float y = (10/i)*r * sin(angle);
     
     vertex(x, y);
   
 }
 
  endShape();
  beginShape();
   for (float angle = -PI/2; angle <= PI/2; angle += increment) {
     float r = rad + 20*sin(10*angle  - theta*time/8);
     float x = (10/i)*r * cos(angle);
     float y = (10/i)*r * sin(angle);
     
     vertex(-x, y);
   
 }
 
  endShape();
  theta = -1*theta;
 }
 time++;
 if(time < 20){
   beginRecord(SVG, "frame-####.svg");
   print(time);
 }

}

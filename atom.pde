float time = 0;
PVector Ring[];

void setup(){
  background(255);
  size(1000, 1000, P3D);
 
}

void draw(){
  translate(width/2, height/2);
  sphere(100);
  orbit(300, PI/4);
}

void orbit(float rad, float rot){
  stroke(0);
  for (int j = 0; j<=200; j++){
      float x = rad*sin(j*PI/100);
      float y = 0;
      float z = rad*cos(j*PI/100);
      Ring[j]= new PVector(x, y, z);
  }
  //rotateY(radians(rot));
  for (int i = 0; i<=Ring.length-1; i++){
  beginShape(LINES);
    PVector v1 = Ring[i];
    PVector v2 = Ring[i+1];
    vertex(v1.x, v1.y, v1.z);
    vertex(v2.x, v2.y, v2.z);
  
  endShape();
   }
  }

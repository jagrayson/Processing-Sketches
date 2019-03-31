//import peasy.*;
//PeasyCam cam;
float time = 0;
PVector[][] globe;
float tracker[][];
int total = 100;
boolean record = false;

void setup() {
  size(1000, 1000, P3D);
 
  //cam = new PeasyCam(this, 500);
  //translate(width/2, height/2);
  //rotate(PI/2);
  colorMode(RGB);
  globe = new PVector[total+1][total+1];
}

void draw() {
  //rotate(PI/2);
 // translate(width/2, height/2);
  translate(width/2, height/2, -1000);
  rotateZ(PI/4);
  rotateX(time/100);
  background(0);
  noStroke();
  lights();
  float r = 500;
  for (int i = 0; i < total+1; i++) {
    float lat = map(i, 0, total, 0, PI);
     r += 5*sin(20*lat + time/10);
     //for (int t = 0; t < total; t++) {
     // float hu = map(t, 0, total, 0, 255*6);
     // fill((hu%255)+sin(10*lat + time/10));
    // }
    for (int j = 0; j < total+1; j++) {
      float lon = map(j, 0, total, 0, TWO_PI);
      float x = r * sin(lat) * cos(lon);
      float y = r * sin(lat) * sin(lon);
      float z = r * cos(lat);
      globe[i][j] = new PVector(x, y, z);
    }
  }

  for (int i = 0; i < total; i++) {
   //float hu = map(i, 0, total, 0, 255);
   //fill(hu%255, 255, 255*6);
    beginShape(TRIANGLE_STRIP);
    
    for (int j = 0; j < total+1; j++) {
      //float shader = map(r, 496, 504, 20, 255);
      PVector v1 = globe[i][j];
      //float shader = map(r, -4, 4, 100, 255);
      //fill(100, 75, shader);
      noFill();
      stroke(120, 0, map(sqrt((v1.x*v1.x+v1.y*v1.y+v1.z*v1.z)), 490, 510, 0, 255));
      vertex(v1.x, v1.y, v1.z);
      PVector v2 = globe[i+1][j];
      vertex(v2.x, v2.y, v2.z);
    }
    endShape();
    
  }
  if (record == true) {
  saveFrame("output2/wave_sphere_####.png");
  }
  time++;
}

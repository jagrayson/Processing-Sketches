float time = 0;
float matrix[][];
int scale = 10;
int wdth;
int hght;
int cols, rows;
float yflying = 0;
float xflying = 0;
float grid_incr = 0.05;
float time_incr = 0.005;
PVector[][] globe;
float tracker[][];
int total = 100;

void setup(){
  size(1000, 1000, P3D);
  background(0);
  wdth = 1000;
  hght = 1000;
  cols = wdth/scale;
  rows = hght/scale;
  matrix = new float[rows][cols];
  colorMode(RGB);
  globe = new PVector[total+1][total+1];
}

void draw(){

time += time_incr;
float yoff = yflying;
for (int y = 0; y < rows; y++) {
  float xoff = xflying;
    for (int x = 0; x < cols; x++) {
      matrix[x][y] = map(noise(time), 0, 1, -100, 100);
      matrix[x][y] += 500*pow(sin(time + cos(xoff) + sin(yoff)), 2);
  
      xoff += grid_incr;
    }
    yoff += grid_incr;
  }
  background(0);
  noFill();
  translate(width/2, height/2, -1000);
  lights();
  float r = 500;
  for (int i = 0; i < total+1; i++) {
    float lat = map(i, 0, total, 0, PI);
     r += 4*sin(20*lat + time/10);
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
  
  for (int y = 0; y < rows - 1; y++) {
    beginShape(TRIANGLE_STRIP);
    for (int x = 0; x < cols; x++) {
      
      //translate(width/2, height/2);
      //stroke(map(noise(x), 0, 1, 0, 255*cos(time)*cos(time)), map(noise(y), 0, 1, 0, 255*sin(time)*sin(time)), 255*pow(matrix[x][y], 2));
      stroke(matrix[x][y], 20, 255);
      vertex(x*scale, y*scale, matrix[x][y]);
      vertex(x*scale, (y+1)*scale, matrix[x][y+1]);
    }
    endShape();
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
      stroke(100, 70, map(sqrt((v1.x*v1.x+v1.z*v1.z)), 0, 1000, 0, 255));
      vertex(v1.x, v1.y, v1.z);
      PVector v2 = globe[i+1][j];
      vertex(v2.x, v2.y, v2.z);
    }
    endShape();
    
  }
}

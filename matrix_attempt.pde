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

void setup(){
  size(1000, 1000, P3D);
  background(0);
  wdth = 1000;
  hght = 1000;
  cols = wdth/scale;
  rows = hght/scale;
  matrix = new float[rows][cols];
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
  translate(width/2, height/2);
  translate(-wdth/2, -hght/2);
  
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
  
}

void message(String words){
  textMode(SHAPE);
  int len = words.length();
  for (int i; i<=len; i++){
    char text[i] = words.charAt(i);
  }
}

int scale = 10;
int wdth;
int hght;
int cols, rows;
float time = 0;
float terrain[][];
float xflying = 0;
float yflying = 0;
int time_on = 0;
float grid_incr = 0.05;
float time_incr = 0.005;

void setup() {
  size(1000, 1000, P3D);
  background(20);
  wdth = 500;
  hght = 500;
  cols = wdth / scale;
  rows = hght / scale;
  terrain = new float[rows][cols];
}

void keyPressed() {


  
}

void do_also() {
  if (key == 'e') {
    grid_incr += 0.0005; 
  }
  else if (key == 'd') {
    if (grid_incr > 0) {
      grid_incr -= 0.0005;
    }
  }
  
  else if (key == 't') {
    time_incr += 0.00005; 
  }
  else if (key == 'g') {
    time_incr -= 0.00005; 
  }
}

void draw() {
  if (keyPressed) {
    do_also();
    if (keyCode == UP) {
      do_also();
      time -= time_incr;
      yflying -= 0.01;
    }
    else if (keyCode == DOWN) {
      time += time_incr;
      yflying += 0.01; 
    }
    else if (keyCode == RIGHT) {
      time += time_incr;
      xflying += 0.01;  
    }
    else if (keyCode == LEFT) {
      time -= time_incr;
      xflying -= 0.01;  
    }
  }
  
  
  float yoff = yflying;
  for (int y = 0; y < rows; y++) {
    float xoff = xflying;
    for (int x = 0; x < cols; x++) {
      terrain[x][y] = map(noise(xoff, yoff, time), 0, 1, -100, 100*cos(time) + 100*sin(time/2));
      terrain[x][y] += 100*pow(sin(time + cos(xoff) + sin(yoff)), 2);

      xoff += grid_incr;
    }
    yoff += grid_incr;
  }

  background(255);
  //stroke(100*sin(time), 50*cos(time + PI/4), 0);
  stroke(100, 50, 150);
  noFill();
  translate(width/2, height/2);
  rotateX(PI/3);
  translate(-wdth/2, -hght/2);
  for (int y = 0; y < rows - 1; y++) {
    beginShape(TRIANGLE_STRIP);
    for (int x = 0; x < cols; x++) {
      //translate(width/2, height/2);
      vertex(x*scale, y*scale, terrain[x][y]);
      vertex(x*scale, (y+1)*scale, terrain[x][y+1]);
    }
    endShape();
  }
}

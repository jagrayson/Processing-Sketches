float time = 0;
PVector[][] grid;
int scale = 2;

void setup(){
  size(1000, 1000);
  background(0);
  translate(width/2, height/2);
  grid = new PVector[width/scale][height/scale];
  stroke(255);
}

void draw(){
  stroke(255);
  for(int i=0; i<width/scale; i++){
    for(int j=0; j<height/scale; j++){
      grid[i][j] = new PVector(i*scale, j*scale);
    }
  }
  beginShape(LINES);
   for(int i=0; i<width/scale; i++){
     for(int j=0; j<height/scale; j++){
       PVector v = grid[i][j];
       //PVector z = mobius(v, 0, 1, 1, 0);
       PVector z = test(v);
       vertex(z.x, z.y);
     }
   }
   endShape();
}


PVector mobius(PVector q, float a, float b, float c, float d){
  float w = (1/( pow(2, (c*q.x + d)) + pow(2, c*q.y)));
  float zx = w*((a*c*pow(2, q.x) + (a*d + b*c)*q.x + a*c*pow(2, q.y) + b*d));
  float zy = w*((a*d - b*c)*q.y);
  PVector z = new PVector(zx, zy);
  return(z);
  }
  
PVector test(PVector q){
 PVector s = new PVector(q.x/( pow(2, q.x) + pow(2, q.y)), -q.y/( pow(2, q.x) + pow(2, q.y)));
 return(s);
}

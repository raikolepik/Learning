
int cols, rows;
int scl = 20;
int w = 2000;
int h = 1600;
float flying = 0;
float[][] terrain;

void setup() {
  size  (600, 600, P3D);
  cols = w / scl;
  rows = h / scl;
  terrain = new float[cols][rows];

}


void draw() {
   // float rn = random(0, 10);
    flying -= 0.05;
  
   float yoff = flying;
  for (int y = 0; y < rows-1; y++) {

    float xoff = 0;
    for (int x = 0; x < cols; x++) {
     // if( rn > 0.4){
      terrain[x][y] = map(noise(xoff, yoff), 0, 2, -150, 80);
     /* }
      else{
      terrain[x][y] = map(noise(xoff, yoff), 2, 5, 60, 80);
      }*/
      xoff += 0.2;
    }
      yoff += 0.2;
  }
  
  background(30);
  stroke(255);
  noFill();
  
  translate(width/2, height/2);
  rotateX(PI/3);

  translate(-w/2,-h/2);
  for (int y = 0; y < rows-1; y++) {
      beginShape(TRIANGLE_STRIP);
    for (int x = 0; x < cols; x++) {
      vertex(x*scl, y*scl, terrain[x][y]); 
      vertex(x*scl, (y+1)*scl, terrain[x][y+1]);
      //rect(x*scl, y*scl, scl, scl);
        
     }
      endShape();
  }
}
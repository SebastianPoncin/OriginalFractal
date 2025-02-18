int maxDepth = 5; // Depth of recursion for rays
float radius = 128; // Radius of the sun circle
float t = 0;

void setup() {
  size(480, 480);
  
  strokeWeight(1);
  noFill();
  rectMode(CENTER);
  
  //drawSun(0, 0, radius, maxDepth);
}

void draw() {
  background(0);
  translate(width / 2, height / 2);
  drawSun(0, 0, radius, maxDepth, t);
  t+=0.01;
}

void drawSun(float x, float y, float r, int d, float c) {
  d-=1;
  strokeWeight(d);
  stroke(100-(d+1)*25*sin(t), 100-(d+1)*25*sin(t+PI/3), 100-(d+1)*25*sin(t+2*PI/3));
  ellipse(x, y, r, r);
  if (d > 0) {
    for(int i = 0; i < 6; i++) {
      strokeWeight(d);
      stroke(100-(d+1)*25*sin(t), 100-(d+1)*25*sin(t+PI/3), 100-(d+1)*25*sin(t+2*PI/3));
      pushMatrix();
      rotate((i-2)*PI/3.0);
      line(r/2, 0, 3*r/4, 0);
      translate(r, 0);
      drawSun(0, 0, r/2, d, c);
      popMatrix();
      //if(d%2 == 0) {
      //  drawSun(0, 0, r/4, d, c);
      //}
    }
  }
  

}

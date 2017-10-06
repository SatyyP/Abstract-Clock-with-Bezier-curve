//PFont SourceSans;
float ax1, ay1;
float ax2, ay2;
float cx1, cy1;
float cx2, cy2;
float bx1, by1; // anchor point of 2nd curve
float bx2, by2;
float dx1, dy1;// control point of 2nd curve
float dx2, dy2;
  
import processing.sound.*;
SoundFile file;
boolean debug = false;
void setup()
{
  size(1920, 1080); // 960, 540
  file = new SoundFile(this, "My-Movie.mp3");
   file.play();
  file.stop();
  file.loop();
}
void draw() {
  //SourceSans = createFont ("Futura Book font.ttf", 20 );
  background(0);
  int s = second();  // Values from 0 - 59
  int m = minute();  // Values from 0 - 59
  int h = hour();
  pushMatrix();
  translate(500, -650);
  scale(1.5);
    float r = map(second(), 0, 60, 0, 255);
  float g = map(minute(), 0, 60, 0, 255);
  float b = map(hour(), 0, 24, 0, 255);
  //background(255-r, 255-g, 255-b);
  fill(r, g, b);
 //fill(255);
 noStroke();
  ellipse(20, height-s*10, 20,20);

  ellipse(310, height-m*10, 20,20);

  ellipse(610, height-h*10, 20,20);
  //noFill();

  strokeWeight(5);
  cx1=ax1=150;
  //ay1=cy1=height-s*10-120;
  ay1=height-s*10-map(second(), 0, 60, 100, -100);
  ax2=240;
  ay2=height-m*10-map(second(), 0, 60, -20, 20);
  bx1=380;
  by1=height-m*10-map(second(), 0, 60, 20, -20);  
  dx2=bx2=500;
  dy2=by2=height-h*10+120;
  //bezier(ax1, ay1, cx1, cy1, cx2, cy2, ax2, ay2);
  noFill();
  stroke(r,g,b);
  beginShape();
  vertex(30, (height-s*10)); // first point  
  bezierVertex(ax1, ay1, ax2, ay2, 310, (height-m*10)); // 1st control point, 2nd control point, 2nd point.
  bezierVertex(bx1, by1, bx2, by2, 610, (height-h*10)); 
  //bezierVertex(350, 350, 380, 380, 600, (height-h*10));
  endShape();


  //debug
  if (debug) {
    noStroke();
    fill(r,g,b);
    ellipse(ax1, ay1, 10, 10);
    ellipse(ax2, ay2, 10, 10);
    ellipse(bx1, by1, 10, 10);
    ellipse(bx2, by2, 10, 10);  
    noFill();
    stroke(r,g,b);
    strokeWeight(1);
    line(10, (height-s*10), ax1, ay1);
    line(310, (height-m*10), ax2, ay2);
    line(310, (height-m*10), bx1, by1);
    line(610, (height-h*10), bx2, by2);
   }
if (keyPressed){
    debug = !debug;
  }
 popMatrix();
}
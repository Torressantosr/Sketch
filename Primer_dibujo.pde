
 

float xoff = 0.0;
float xincrement = 0.01; 
int xspacing = 16;   
int w;              
float theta = 60.0;  // Start angle at 0
float amplitude = 175.0;  // Height of wave
float period = 100.0;  // How many pixels before the wave repeats
float dx;  // Value for incrementing X, a function of period and xspacing
float[] yvalues;  // Using an array to store height values for the wave

void setup() {
  size(1280, 720);
   background(0);
  noStroke();
  w = width+16;
  dx = (TWO_PI / period) * xspacing;
  yvalues = new float[w/xspacing];
}

void draw() {
  fill(random(100), 10);
  rect(0,0,width,height);
  float n = noise(xoff)*720;
  xoff += xincrement;
  fill(200);
  calcWave();
  renderWave();
}

void calcWave() {
  theta += 2.02;
  float x = theta;
  for (int i = 0; i < yvalues.length; i++) {
    yvalues[i] = sin(x)*amplitude;
    x+=dx;
  }
}

void renderWave() {
  noStroke();
  fill(random(255));
  for (int x = 0; x < yvalues.length; x++) {
    ellipse(x*xspacing, mouseY+yvalues[x], 16, 16);
  }
}

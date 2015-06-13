import processing.opengl.*;

/*
CS3451 HW 2
Patrick Yeung

Computer Animation - Klink -> Klang -> Klinklang Evolution Chain

1. Camera Motion - Using the Arrow Keys, you can change the camera in the X and Y directions.
2. Object Animations - This Pokemon is just a gradual increase in gear count, for each evolution 
   I had to add one extra rotating gear.
3. Object Instancing - I created a gear() function that allowed me to create multiple gears in different places.
   I also had a function for drawing the faces. This function took in a parameter to determine which face type
   was to be drawn. This isn't completely instancing, but appears multiple times in my code as well.
4. Object Contact - The faces of each of my Pokemon are just very thin cylinders that sit right on top of the gear.
   The facial features like the eyes and mouth are also just very thin shapes translated to sit on top of the face cylinder.
5. Duration - I created 3 Pokemon that are cycled through by pressing 1, 2 and 3. I'm under the assumption that
   they consist of enough frames to meet this requirement.
6. Lighting and shading - I used 4 directional lights such that my Pokemon can be seen from any direction, and the colors
   are for the most part discernible.
7. Perspective projection - I used perspective() with the appropriate parameters, was there anything else?
*/

float time = 0;
float xView = 90;
float yView = 90;
int draw = 1;

void setup()  {
  size(400,400,OPENGL);
  noStroke();
}

void keyPressed() {
  if(keyCode == UP)  {
    if(yView < 170)  {
      yView += 10;
    }
  }
  if(keyCode == DOWN)  {
    if(yView > 10)  {
      yView -= 10;
    }
  }
  if(keyCode == LEFT)  {
    xView -= 10;
  }
  if(keyCode == RIGHT)  {
    xView += 10;
  }
  
  if(key == '1')  {
    draw = 1; 
  }
  if(key == '2')  {
    draw = 2;
  }
  if(key == '3')  {
    draw = 3;
  }
  
}

void draw()  {
  resetMatrix();
  
  background(0);
  
  perspective (PI * 0.333, 1.0, 0.01, 1000.0);
  
  camera (-50*cos(radians(xView))*sin(radians(yView)), 50*cos(radians(yView)), 50.0*sin(radians(xView))*sin(radians(yView)), 0.0, 0.0, -1.0, 0.0, 1.0, 0.0);
  
  lightSpecular(204, 204, 204);
  directionalLight(102, 102, 102, -0.7, -0.7, -1);
  directionalLight(152, 152, 152, 0, 0, -1);
  directionalLight(102, 102, 102, 0.7, 0.7, 1);
  directionalLight(152, 152, 152, 0, 0, 1);
  
  scale (1.0, -1.0, 1.0);  

  specular(0, 0, 0);
  shininess(1.0);
  
  if(draw == 1)  {
    klink();
  }
  else if(draw == 2)  {
    klang();
  }
  else if(draw == 3)  {
    klinklang();
  }
  
  time += .05;
}

void klink()  {
  pushMatrix();
  rotate(time/2,0,0,1);
  gear();
  klinkFace(1);
  popMatrix();
  
  pushMatrix();
  translate(-8.5,8.5,0);
  rotate(-time/2,0,0,1);
  gear();
  klinkFace(1);
  popMatrix();
}

void klang()  {
  pushMatrix();
  rotate(time/2,0,0,1);
  gear();
  klinkFace(2);
  popMatrix();
  
  pushMatrix();
  rotate(time/4,0,0,1);
  klangGear();
  klangFace();
  popMatrix();
  
  pushMatrix();
  translate(-8.5,8.5,0);
  rotate(-time/2,0,0,1);
  gear();
  klinkFace(1);
  popMatrix();
}

void klinklang()  {
  klang();
  
  pushMatrix();
  translate(0,-4,6.5);
  rotate(-time/2,0,1,0);
  rotate(PI/6,0,1,0);
  rotate(PI/2,1,0,0);
  gear();
  klinkFace(3);
  popMatrix();
  
  pushMatrix();
  translate(0,-4.5,6.5);
  rotate(-time/2,0,1,0);
  klinklangRing();
  popMatrix();
}

void gear()  {
  fill(195,198,213);
  pushMatrix();
  rotate (PI/2, 1, 0, 0);
  cylinder(4.5, 2.0, 32);
  popMatrix();
  
  for(int i = 0; i < 6; i++)  {
    pushMatrix();
    rotate(i*PI/3,0,0,1);
    translate(5.4,0,1);
    box(2);
    popMatrix();
  }
}

void klangGear()  { 
  fill(153,170,170);
  pushMatrix();
  translate(0,0,-3);
  rotate (PI/2, 1, 0, 0);
  cylinder(9, 3.0, 32);
  popMatrix();
  
  for(int i = 0; i < 8; i++)  {
    pushMatrix();
    rotate(i*PI/4,0,0,1);
    translate(10, 0,-1.5);
    box(3);
    popMatrix();
  }
}

void klinkFace(int state)  {
  if(state == 1)  {
    pushMatrix();
    translate(0,0,-.1);
    rotate (PI/2,1,0,0);
    fill(98,96,97);
    cylinder(3.5, 2.2, 32);
    popMatrix();
    
    pushMatrix();
    translate(-1.8,-1.5,2.1);
    rotate(PI/2,1,0,0);
    fill(255,255,255);
    cylinder(1,.1,32);
    fill(0,0,0);
    cylinder(.5,.2,32);
    popMatrix();
    
    pushMatrix();
    translate(-.5,2.3,2.1);
    rotate(PI/4,0,0,1);
    fill(255,255,255);
    box(2,.5,.1);
    popMatrix();
    
    pushMatrix();
    translate(-.5,2.3,2.1);
    rotate(-PI/4,0,0,1);
    fill(255,255,255);
    box(2,.5,.1);
    popMatrix();
    
    pushMatrix();
    translate(2.1,-1,2.1);
    rotate (PI/2,1,0,0);
    rotate(3*PI/8,0,1,0);
    scale(.75,2,1);
    fill(0,0,0);
    cylinder(.75,.1,32);
    popMatrix();
    
    pushMatrix();
    translate(0,0,-.2);
    rotate (PI/2,1,0,0);
    fill(119,153,153);
    cylinder(2,.1,32);
    popMatrix();
    
    pushMatrix();
    translate(0,0,2);
    fill(119,153,153);
    sphere(1);
    popMatrix();
  }
  
  else if (state == 2)  {
    pushMatrix();
    translate(0,0,1);
    fill(119,153,153);
    sphere(3);
    popMatrix();
  }
  
  else if(state == 3)  {
    pushMatrix();
    translate(0,0,1);
    fill(189,119,119);
    sphere(3);
    popMatrix();
  }
    
}

void klangFace()  {
  pushMatrix();
  translate(0,0,-3.1);
  rotate (PI/2, 1, 0, 0);
  fill(0,0,0);
  cylinder(7.6, 3.2, 32);
  popMatrix();
    
  pushMatrix();
  translate(0,0,-3.15);
  rotate (PI/2, 1, 0, 0);
  fill(153,170,170);
  cylinder(7, 3.3, 32);
  popMatrix();
  
  pushMatrix();
  translate(7.4*cos(3*PI/4),7.*sin(3*PI/4),.2);
  rotate(PI/4,0,0,1);
  fill(0,0,0);
  box(2,2,.1);
  popMatrix();
  
  pushMatrix();
  translate(7.4*cos(PI/4),7.*sin(PI/4),.1);
  rotate(PI/2,1,0,0);
  fill(0,0,0);
  cylinder(1,.1,32);
  popMatrix();
  
  pushMatrix();
  translate(.4,-7,.1);
  rotate(3*PI/4,0,0,1);
  fill(255,255,255);
  box(2.25,.75,.1);
  popMatrix();
  
  pushMatrix();
  translate(-.4,-7,.1);
  rotate(PI/4,0,0,1);
  fill(255,255,255);
  box(2.25,.75,.1);
  popMatrix();
  
  pushMatrix();
  translate(0,0,-3.2);
  rotate (PI/2,1,0,0);
  fill(119,153,153);
  cylinder(4,.1,32);
  popMatrix();
  
}

void klinklangRing()  {
  pushMatrix();
  translate(0,-.5,0);
  fill(195,198,213);
  ring(15,1,32);
  popMatrix();
  
  for(int i = 0; i < 6; i++)  {
    pushMatrix();
    rotate(i*PI/3,0,1,0);
    translate(0,0,15);
    cone(0,0,.5,2);
    popMatrix();
  }
}

void cylinder (float radius, float height, int sides) {
  int i,ii;
  float []c = new float[sides];
  float []s = new float[sides];

  for (i = 0; i < sides; i++) {
    float theta = TWO_PI * i / (float) sides;
    c[i] = cos(theta);
    s[i] = sin(theta);
  }
  
  normal (0.0, -1.0, 0.0);
  for (i = 0; i < sides; i++) {
    ii = (i+1) % sides;
    beginShape(TRIANGLES);
    vertex (c[ii] * radius, 0.0, s[ii] * radius);
    vertex (c[i] * radius, 0.0, s[i] * radius);
    vertex (0.0, 0.0, 0.0);
    endShape();
  }
  
  normal (0.0, 1.0, 0.0);
  for (i = 0; i < sides; i++) {
    ii = (i+1) % sides;
    beginShape(TRIANGLES);
    vertex (c[ii] * radius, height, s[ii] * radius);
    vertex (c[i] * radius, height, s[i] * radius);
    vertex (0.0, height, 0.0);
    endShape();
  }

  for (i = 0; i < sides; i++) {
    ii = (i+1) % sides;
    beginShape();
    normal (c[i], 0.0, s[i]);
    vertex (c[i] * radius, 0.0, s[i] * radius);
    vertex (c[i] * radius, height, s[i] * radius);
    normal (c[ii], 0.0, s[ii]);
    vertex (c[ii] * radius, height, s[ii] * radius);
    vertex (c[ii] * radius, 0.0, s[ii] * radius);
    endShape(CLOSE);
  }
}

void ring(float radius, float height, int sides)  {
  int i,ii;
  float []c = new float[sides];
  float []s = new float[sides];

  for (i = 0; i < sides; i++) {
    float theta = TWO_PI * i / (float) sides;
    c[i] = cos(theta);
    s[i] = sin(theta);
  }
  
  for (i = 0; i < sides; i++) {
    ii = (i+1) % sides;
    beginShape();
    normal (c[i], 0.0, s[i]);
    vertex (c[i] * radius, 0.0, s[i] * radius);
    vertex (c[i] * radius, height, s[i] * radius);
    normal (c[ii], 0.0, s[ii]);
    vertex (c[ii] * radius, height, s[ii] * radius);
    vertex (c[ii] * radius, 0.0, s[ii] * radius);
    endShape(CLOSE);
  }
}

static float unitConeX[];
static float unitConeY[];
static int coneDetail;
 
static {
  coneDetail(24);
}
 
static void coneDetail(int det) {
  coneDetail = det;
  unitConeX = new float[det+1];
  unitConeY = new float[det+1];
  for (int i = 0; i <= det; i++) {
    float a1 = TWO_PI * i / det;
    unitConeX[i] = (float)Math.cos(a1);
    unitConeY[i] = (float)Math.sin(a1);
  }
}
 
void cone(float x, float y, float r, float h) {
  pushMatrix();
  translate(x,y);
  scale(r,r);
  beginShape(TRIANGLES);
  for (int i = 0; i < coneDetail; i++) {
    vertex(unitConeX[i],unitConeY[i],0.0);
    vertex(unitConeX[i+1],unitConeY[i+1],0.0);
    vertex(0,0,h);
  }
  endShape();
  popMatrix();
}

  
  

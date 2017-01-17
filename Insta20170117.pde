import toxi.geom.*;
import toxi.physics2d.*;
import toxi.physics2d.behaviors.*;

ArrayList<Particle> particles;
Attractor attractor;

VerletPhysics2D physics;

void setup()
{
  size(1024, 1024);
  frameRate(30);
  colorMode(HSB);
  background(0);
  
  physics = new VerletPhysics2D();
  physics.setDrag(0.1);

  particles = new ArrayList<Particle>();
  for(int i = 0; i < 1024; i += 1)
  {
    particles.add(new Particle(new Vec2D(random(width * 0.2, width * 0.8 ), random(height * 0.2, height * 0.8))));
  }
  
  attractor = new Attractor(new Vec2D(width/ 2, height / 2));
  
}

void draw()
{
  // background(255);
  
  fill(0, 16);
  noStroke();
  rect(0, 0, width, height);
  
  physics.update();

  attractor.compute();
  attractor.disiplay();
  
  for(Particle p : particles)
  {
    p.display();
  }

  if(mousePressed)
  {
    attractor.lock();
    attractor.set(mouseX, mouseY);
    attractor.unlock();
  }
  
  println(frameCount);
  /*
  saveFrame("screen-#####.png");
  if(frameCount > 1800)
  {
     exit();
  }
  */
}
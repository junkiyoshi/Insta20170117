class Particle extends VerletParticle2D
{
  float r;
  color bodyColor;
  
  Particle(Vec2D loc)
  {
    super(loc);
    r = 5;
    physics.addParticle(this);
    physics.addBehavior(new AttractionBehavior(this, r * 4, -1));
    
    bodyColor = color(random(255), 255, 255);
  }
  
  void display()
  {    
    float d = dist(x, y, width /2, height / 2);
    
    fill(d % 255, 255, 255);
    noStroke();
    ellipse(x, y, r * 2, r * 2);
  }
}
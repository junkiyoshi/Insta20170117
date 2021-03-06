class Attractor extends VerletParticle2D
{
  float r;
  
  Attractor(Vec2D loc)
  {
    super(loc);
    r = 24;
    physics.addParticle(this);
    physics.addBehavior(new AttractionBehavior(this, width, 1));
  }
  
  void compute()
  {
    if(x <= 0)
    {
      this.lock();
      x = width - r;
      this.unlock();
    }
    
    if(x >= width)
    {
      this.lock();
      x = r;
      this.unlock();
    }
    
    if(y <= 0)
    {
      this.lock();
      y = height - r;
      this.unlock();
    }
    
    if(y >= height)
    {
      this.lock();
      y = r;
      this.unlock();
    }
  }
  
  void disiplay()
  {   
    fill(255);
    ellipse(x, y, r * 2, r * 2);
  }
}
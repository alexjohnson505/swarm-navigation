// An array of targets.
class Food {
  // Represent targets as PVectors
  ArrayList<PVector> food;
  
  Food(){
    food = new ArrayList<PVector>();
  }
  
  // Render each target
  void draw(){
    for (PVector v : food) {
      fill(240, 0, 0);
      ellipse(v.x, v.y, 10, 10);
     }
  }
  
  // Add new target to list
  void addFood(){
    PVector f;
    f = new PVector(random(0, 500), random(0, 1000));
    food.add(f);
  }
  
  void remove(int index){
    food.remove(index);
  }
  
  // Does a (the fish's location) collide with b (a food item)
  boolean collision(PVector a){
    float threshold = 8.5;
    
    boolean collision = false;
    
    // Iterate through food 
    for (int i = food.size() - 1; i >= 0; i--){
      PVector b = food.get(i);
     
      float horizontalDifference = abs(a.x - b.x);
      float verticalDifference = abs(a.y - b.y);
      
      collision = (horizontalDifference < threshold) && (verticalDifference < threshold);
      
      if (collision){
        food.remove(i);
        addFood();
      }
    }
    
    return collision;
  }
    
}



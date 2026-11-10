class FloatRange {
  float min, max;
  
  FloatRange(float p_min, float p_max){
    min = p_min;
    max = p_max;
  }
  
  float pick(){
    return random(min, max);
  }
}

class IntRange {
  int min, max;
  
  IntRange(int p_min, int p_max){
    min = p_min;
    max = p_max;
  }
  
  int pick(){
    return int(random(min, max));
  }
}

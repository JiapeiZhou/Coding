class form{
  void fdraw(){
    
    angle += 0.05;
    c1 = (cos(angle) * height/2);
    c2 = (cos(angle+PI/2) * height/2);
    c3 = (cos(angle+PI) * height/2);
    
    sum += (amp.analyze() - sum)* smoothFactor;
    float ampScaled = sum * (height/3) * scale;
    float s1 = ampScaled+ (sin(angle) * s/2) + s/2;
    
    
    strokeWeight(1);
    stroke(c3, c2, c1);
    fill(c1, c2, c3, 50);   //change the fill by amplitude
    box(s1);
  }
  
  
  
  
}

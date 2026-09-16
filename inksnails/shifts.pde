void shifts(){
  
  if(frameCount % shiftFrame == 0){
    switch((int)random(6)){
      case 0:
        spawnDensity += random(.10);
        break;
      case 1:
        spawnDensity = 0;
        break;
      case 2:
        flockSettingsRandom();
        break;
      case 3:
        flockSettings(1.0, 1.0, 1.0, 1.5, 0.03);
        spawnDensity = 0;
        break;
      case 4:
        if(frameCount < 200) spawnBoids();
        break;
      default:
        break;
      }
    }
  
  shiftFrame = (int)random(30,300);
  
  //if(evenGrid && timeout > 0){
  //  spawnGrid(true);
  //  evenGrid = false;
  //  return;
  //}
  
  //if(oddGrid && timeout > 0){
  //  cSeparation = 1.5;
  //  spawnGrid(false);
  //  oddGrid = false;
  //  return;
  //}
  
}

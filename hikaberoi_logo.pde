
/* hikaberoi title logo */

/* https://www.catch.jp/wiki/?Processing%B4%F0%C1%C3%BA%C7%C2%AE%C6%FE%CC%E7#sa2347a7 */
/* http://yoppa.org/geidai_media1_17/8243.html */
/* http://ap.kakoku.net/5-2.html */

PImage img;
float alpha;

void setup() {
  size(1280, 720);
  img = loadImage("hikaberoi.jpg");
  imageMode(CENTER);
  background(0);
  frameRate(24);
  noStroke();
  //println(PFont.list()); 
}

void draw() {
  
  println(frameCount / 24f);

  if(frameCount < 24 * 3) {
    for (int i = 0; i < 80; i++) {
      int x = int(random(img.width));
      int y = int(random(img.height));
      color col = img.get(x, y);
      //println (hex(col));
      //println (x,x+(width/2),width,img.width);
      float ellipseSize = map(brightness(col), 0, 255, 2, 10);
      fill(col,255);//(rgb,alpha).
      ellipse(x+(width/2)-(img.width/2), y+(height/2)-(img.height/2), ellipseSize, ellipseSize);
    }
  }
  
  if(frameCount > 32) {
    fadeIn();
    tint(255f,alpha);
    image(img, width/2, height/2, (img.width*1.05), (img.height*1.05));
    PFont aaa = createFont("Arial Black",32);
    textFont(aaa);
    text("Hikaberoi Works", (width/2)-(img.width/2)-30, (height/2)-(img.height/2)+280); 
  }
  
  saveFrame("frames/######.png");
  
  if(frameCount > 24 * 4.5) {
    exit();
  }
}

void fadeIn(){
  alpha = alpha + 1f;
      if( alpha > 255f ){ 
     alpha = 255f; 
  }
}

void fadeOut(){
  alpha = alpha - 4f;
      if( alpha < 0f ){
    alpha = 0f;
  }
}
//////////
void initializeImages() {
//  PImage texmap1 = loadImage("6p.jpg"); 
//  PImage texmap2 = loadImage("6a.jpg");  
//  PImage texmap3 = loadImage("6b.jpg"); 
//  PImage texmap4 = loadImage("6c.jpg"); 
//  PImage texmap5 = loadImage("6d.jpg"); 
//  PImage texmap6 = loadImage("6e.jpg");  
//
//  imageList1.add(texmap1);
//  imageList1.add(texmap2);
//  imageList1.add(texmap3);
//  imageList1.add(texmap4);
//  imageList1.add(texmap5);
//  imageList1.add(texmap6);
//
//  PImage texmap21 = loadImage("7p.jpg"); 
//  PImage texmap22 = loadImage("7a.jpg");  
//  PImage texmap23 = loadImage("7b.jpg"); 
//  PImage texmap24 = loadImage("7c.jpg"); 
//  PImage texmap25 = loadImage("7d.jpg"); 
//  PImage texmap26 = loadImage("7e.jpg");  
//
//  imageList2.add(texmap21);
//  imageList2.add(texmap22);
//  imageList2.add(texmap23);
//  imageList2.add(texmap24);
//  imageList2.add(texmap25);
//  imageList2.add(texmap26);
//
//  PImage texmap31 = loadImage("7p.jpg"); 
//  PImage texmap32 = loadImage("7a.jpg");  
//  PImage texmap33 = loadImage("7b.jpg"); 
//  PImage texmap34 = loadImage("7c.jpg"); 
//  PImage texmap35 = loadImage("7d.jpg"); 
//  PImage texmap36 = loadImage("7e.jpg");  
//
//  imageList3.add(texmap31);
//  imageList3.add(texmap32);
//  imageList3.add(texmap33);
//  imageList3.add(texmap34);
//  imageList3.add(texmap35);
//  imageList3.add(texmap36);
//
//  PImage texmap41 = loadImage("7p.jpg"); 
//  PImage texmap42 = loadImage("7a.jpg");  
//  PImage texmap43 = loadImage("7b.jpg"); 
//  PImage texmap44 = loadImage("7c.jpg"); 
//  PImage texmap45 = loadImage("7d.jpg"); 
//  PImage texmap46 = loadImage("7e.jpg");  
//
//  imageList4.add(texmap41);
//  imageList4.add(texmap42);
//  imageList4.add(texmap43);
//  imageList4.add(texmap44);
//  imageList4.add(texmap45);
//  imageList4.add(texmap46);
//
//  PImage texmap51 = loadImage("7p.jpg"); 
//  PImage texmap52 = loadImage("7a.jpg");  
//  PImage texmap53 = loadImage("7b.jpg"); 
//  PImage texmap54 = loadImage("7c.jpg"); 
//  PImage texmap55 = loadImage("7d.jpg"); 
//  PImage texmap56 = loadImage("7e.jpg");  
//
//  imageList5.add(texmap51);
//  imageList5.add(texmap52);
//  imageList5.add(texmap53);
//  imageList5.add(texmap54);
//  imageList5.add(texmap55);
//  imageList5.add(texmap56);
//
//  PImage texmap61 = loadImage("7p.jpg"); 
//  PImage texmap62 = loadImage("7a.jpg");  
//  PImage texmap63 = loadImage("7b.jpg"); 
//  PImage texmap64 = loadImage("7c.jpg"); 
//  PImage texmap65 = loadImage("7d.jpg"); 
//  PImage texmap66 = loadImage("7e.jpg");  
//
//  imageList6.add(texmap21);
//  imageList6.add(texmap22);
//  imageList6.add(texmap23);
//  imageList6.add(texmap24);
//  imageList6.add(texmap25);
//  imageList6.add(texmap26);
  
  
  PImage texmap1 = loadImage("1group_newgrid2.jpg"); 
  PImage texmap2 = loadImage("2group_newgrid2.jpg");  
  PImage texmap3 = loadImage("3group_newgrid2.jpg"); 
  PImage texmap4 = loadImage("4group_newgrid2.jpg"); 
  PImage texmap5 = loadImage("5group_newgrid2.jpg"); 
  PImage texmap6 = loadImage("6group_newgrid2.jpg");  
  PImage texmap7 = loadImage("7group_newgrid2.jpg"); 
  PImage texmap8 = loadImage("8group_newgrid2.jpg"); 
  
  imageList.add(texmap1);
  imageList.add(texmap2);
  imageList.add(texmap3);
  imageList.add(texmap4);
  imageList.add(texmap5);
  imageList.add(texmap6);
  imageList.add(texmap7);
  imageList.add(texmap8);
}

void initializeGlobes() {
//  globeList.add(new Globe(1, 100, 100, -500, imageList1.get(0)));
//  globeList.add(new Globe(2, 800, 600, -200, imageList2.get(0)));
//  globeList.add(new Globe(0.9, 400, 300, 200, imageList3.get(0)));
//  globeList.add(new Globe(2.2, 1000, 400, 0, imageList4.get(0)));
//  globeList.add(new Globe(4, 80, -100, -200, imageList5.get(0)));
//  globeList.add(new Globe(3, 400, 700, -200, imageList6.get(0)));

  globeList.add(new Globe(1, 100, 100, -1000, imageList.get(0)));
  globeList.add(new Globe(2, 800, 600, -1500, imageList.get(1)));
  globeList.add(new Globe(0.9, 400, 300, 800, imageList.get(2)));
  globeList.add(new Globe(2.2, 1000, 400, -500, imageList.get(3)));
  globeList.add(new Globe(4, 80, -100, 700, imageList.get(4)));
  globeList.add(new Globe(1, 1000, 700, -600, imageList.get(5)));
  globeList.add(new Globe(1.5, 200, 500, 500, imageList.get(6)));
  globeList.add(new Globe(3, 500, 800, 1000, imageList.get(7)));
}


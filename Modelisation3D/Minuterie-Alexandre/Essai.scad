
// création support minuterie 
// diamètre fusex = 100mm dont 2mm d'épaisseur soit 98mm de diamètre intérieur
color ("white")
cylinder (h=20,r1=98,r2=98,center = true,$fn=100);
color ("white")
translate ([0,0,400])
          cylinder(h=20,r1=98,r2=98, center = true,$fn=100);
color ("white")
translate([0,0,200])
         cube([20,200,400], true,$fn=100);
         
// création 2ème support minuterie
color ("white")
translate ([600,0,0])
         cylinder (h=20,r1=98,r2=98,center = true,$fn=100);
color ("white")
translate ([600,0,400])
          cylinder(h=20,r1=98,r2=98, center = true,$fn=100);
color ("white")
translate([600,0,200])
         cube([20,196,400], true,$fn=100);


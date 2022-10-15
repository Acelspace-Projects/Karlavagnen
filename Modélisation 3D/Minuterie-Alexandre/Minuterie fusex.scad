
use <../elec-cartes/elec-cartes.scad>

// création support minuterie 
// diamètre fusex = 100mm dont 2mm d'épaisseur soit 98mm de diamètre intérieur
color ("white")
cylinder (h=20,r1=49,r2=49,center = true,$fn=100);
color ("white")
translate ([0,0,380])
          cylinder(h=20,r1=49,r2=49, center = true,$fn=100);
color ("white")
translate([0,0,190])
         cube([8,98,380], true,$fn=100);
         
// création 2ème support minuterie
color ("white")
translate ([300,0,0])
         cylinder (h=20,r1=49,r2=49,center = true,$fn=100);
color ("white")
translate ([300,0,160])
          cylinder(h=20,r1=49,r2=49, center = true,$fn=100);
color ("white")
translate([300,0,80])
         cube([10,98,160], true,$fn=100);
// intégration carte elec sur support minuterie

translate ([305,0,80])
rotate ([0,90,0])
          sequenceur_1(){};

// intégration carte elec sur support minuterie
translate ([5,O,190])
rotate ((0,90,0))
     sequenceur_1(){};



 



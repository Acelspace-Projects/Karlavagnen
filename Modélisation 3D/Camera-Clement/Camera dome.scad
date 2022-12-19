
difference() { union() {
//corps de la fusée 
cylinder(h = 2000, r1 = 100, r2 = 100, center = false);
//ogive (réduction du diamètre)
translate([0,0,2000])
cylinder(h = 90, r1 = 100, r2 = 80, center = false);
//ogive (dôme)
translate([0,0,2090]) 
sphere(r = 80);
//support caméra
translate([0,0,2000])
cylinder(h = 90, r1 = 100, r2 = 80, center = false);
}
cube(size = 2000);   
} 


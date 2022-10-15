use <bagues.scad>;

module diode(d=5) {
    translate([0,0,d]) 
    sphere(d=d, $fn=100);
    cylinder(d=d,h=d, $fn=100);
}
// diode();

module interrupteur(state="ON"){
    largeure  = 8;
    longueure = 14;
    hauteur   = 10;
    translate([0,0,5])
    union() {
        color("blue")
        cube(size=[largeure, longueure, hauteur], center=true);
        
        color("grey")
        translate([0, 0, hauteur/2-0.1]) 
        cube(size=[largeure+0.2, longueure+0.2, 0.4], center=true);
        
        color("grey")
        translate([0, 0, 2.6])
        cube(size=[largeure+0.2, longueure-1, 5], center=true);
        
        color("grey")
        translate([0,0,5]) 
        cylinder(d=4,h=1,$fn=30);
        
        translate([0,0,5])
        if (state=="ON"){
            rotate([30,0,0])
            union() {
                hauteur=6;
                diametre=2.5;
                color("grey")
                cylinder(d=diametre,h=hauteur,$fn=30);
                color("grey")
                translate([0,0,hauteur]) 
                sphere(d=diametre,$fn=30);
            }
        }else{
            rotate([-30,0,0])
            union() {
                hauteur=6;
                diametre=2.5;
                color("grey")
                cylinder(d=diametre,h=hauteur,$fn=30);
                color("grey")
                translate([0,0,hauteur]) 
                sphere(d=diametre,$fn=30);
            }
        }
    }
}
// interrupteur("ON");

module moteur_1(){
    for (i=[0:1:1]) {
        color("grey")
        rotate([0,0,i*180]) 
        translate([28/2-1.5, -1, 35+25+3])
        rotate([0,-45,0]) 
        cube(size=[0.1,2,4]);
    }
    
    translate([0, 0, 35+25+3])
    union(){
        color(c=[0.2,0.2,0.2,1])
        bague_creuse(d_e=10, d_i=2, epaisseur=2, $fn=100);
        color("grey")
        cylinder(d=2, h=2);
    }
    
    color(c=[0.2,0.2,0.2,1])
    translate([0, 0, 35+25])
    cylinder(d=28, h=3, $fn=100);
    
    color("DarkKhaki")
    translate([0, 0, 25])
    cylinder(d=28, h=35, $fn=100);
    
    color("Gray")
    translate([0, 0, 0])
    cylinder(d=32, h=25, $fn=100);
    
    rotate([0,0,90]) 
    translate([32/2-5-10/2, 0, -2])
    union() {
        color("Gray")
        cylinder(d=10, h=2, $fn=50);
        color("lightGray")
        translate([0,0,-10])
        difference(){
            cylinder(d=5, h=10, $fn=30);
            translate([0,5/2,2]) 
            cube(size=[6,5,12], center=true);
        }
    }
}
moteur_1();
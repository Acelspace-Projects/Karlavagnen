
use <../meca-comps/meca-comps.scad>

// <img src="file:///G:/Mon%20Drive/Cspace%202023%20-%20Karlavagnen/Mod%C3%A9lisation%203D/library/elec-comps/diode.png">

module diode(d=5) {
    translate([0,0,d]) 
    sphere(d=d, $fn=100);
    cylinder(d=d,h=d, $fn=100);
}

// <img src="file:///G:/Mon%20Drive/Cspace%202023%20-%20Karlavagnen/Mod%C3%A9lisation%203D/library/elec-comps/interrupteur.png">

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

// <img src="file:///G:/Mon%20Drive/Cspace%202023%20-%20Karlavagnen/Mod%C3%A9lisation%203D/library/elec-comps/moteur.png">

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
        bague_creuse(10, 2, 2);
        color("grey")
        cylinder(d=2, h=2);
    }
    
    color(c=[0.2,0.2,0.2,1])
    translate([0, 0, 35+25])
    cylinder(d=28, h=3);
    
    color("DarkKhaki")
    translate([0, 0, 25])
    cylinder(d=28, h=35);
    
    color("Gray")
    translate([0, 0, 0])
    cylinder(d=32, h=25);
    
    rotate([0,0,90]) 
    translate([32/2-5-10/2, 0, -2])
    union() {
        color("Gray")
        cylinder(d=10, h=2);
        color("lightGray")
        translate([0,0,-10])
        difference(){
            cylinder(d=5, h=10);
            translate([0,5/2,2]) 
            cube(size=[6,5,12], center=true);
        }
    }
}

// <img src="file:///G:/Mon%20Drive/Cspace%202023%20-%20Karlavagnen/Mod%C3%A9lisation%203D/library/elec-comps/pile_9V.png">

module pile_9V(){
    l = 25;
    L = 45;
    e = 17;
    
    color([0.1,0.1,0.1])
    translate([2,2,0])
    minkowski(){
        cube(size=[l-4,e-4,L*2/3-2]);
        cylinder(h=2, r=2, $fn=50);
    }
    color("darkOrange")
    translate([2,2,L*2/3])
    minkowski(){
        cube(size=[l-4,e-4,L*1/3-2]);
        cylinder(h=2, r=2, $fn=50);
    }
    
    color("grey")
    translate([7,e/2,L])
    cylinder(d=5, h=2, $fn=50);

    color("grey")
    translate([18,e/2,L])
    cylinder(d=8, h=2, $fn=50);
}

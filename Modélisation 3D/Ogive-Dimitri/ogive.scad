
use <../library/elec-comps/elec-comps.scad>
use <../library/meca-comps/meca-comps.scad>

module ogiveK(d_ext=100) {

LR=150;

// retrain
color("dimgrey") 
union(){
    difference(){
        cylinder(h=LR, d1=d_ext, d2=87);
        translate([0,0,-1])
        cylinder(h=LR+2, d1=d_ext-6, d2=81);
    };
    translate([0,0,LR]) 
    difference(){
        cylinder(h=5, d=87);
        translate([0,0,-2])
        cylinder(h=9, d=83);
    };
}

// dome
color("white", 0.5)
translate([0,0,LR])
union(){
    translate([0,0,10])
    difference() {
        sphere(40);
        translate([0,0,-22.5])
        cube([85,85,45],true);
    }
    cylinder(h=10,r=40);
    cylinder(h=2,r=42.5);
}

}
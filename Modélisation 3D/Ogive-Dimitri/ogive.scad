
use <../library/elec-comps/elec-comps.scad>
use <../library/meca-comps/meca-comps.scad>

module ogiveK(d_ext=100) {

//retrain
difference(){
    cylinder(h=200, d1=d_ext, d2=87);
    translate([0,0,-1])
    cylinder(h=202, d1=d_ext-6, d2=81);
};

//dome
color("white", 0.5)
translate([0,0,200])
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
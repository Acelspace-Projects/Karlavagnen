
use <../library/elec-comps/elec-comps.scad>
use <../library/meca-comps/meca-comps.scad>

module bloc_camera(d_int=96) {
// camera
union(){
    color([100/255,100/255,100/255])
    translate([-15,-40,30])
    cube([30,80,50]);
    color([150/255,150/255,255/255]) 
    translate([15,-20,60])
    rotate([0,90,0])
    cylinder(10,d=30);
};

// axe rotatif
color(c=[200/255,200/255,200/255])
translate([0,0,-10])
cylinder(40,d=10);

// support
bague_pleine(d_int,20);

// moteur
translate([0,6,-20])
rotate([180,0,0]) 
moteur_1();
}

bloc_camera();

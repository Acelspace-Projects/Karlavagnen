
include <lib-gear-dh.scad>
include <lib-worm-dh.scad>
use <../library/elec-comps/elec-comps.scad>
use <../library/meca-comps/meca-comps.scad>

module roulis(d_int=96,taille_plaque=130) {
// support
color("white") {
    // bagues
    bague_pleine(d_int,10);
    translate([0, 0, taille_plaque+10])
    bague_pleine(d_int,10);
    // plaque
    translate([-15,0,taille_plaque/2+10]) 
    cube([2,d_int,taille_plaque],center=true);
}

// moteur
translate([6,0,50]) 
rotate([0,0,90]) 
moteur_1();


// ensemble mecanique
color("silver")
translate([0,0,30]) {
    // rebords
    translate([0, -25, 0])
    cube([20, 5, 40],center=true);
    translate([0, 25, 0])
    cube ([20, 5, 40],center=true);

    // engrenages
    translate([0,0,7])
    gear(24,8,12);
    rotate([90, 0, 0])
    translate([0, 0, 10])
    gear(20,6,12);
    rotate([90, 0, 0])
    translate([0, 0, -12])
    gear(20,6,12);

    // axes rotatifs
    rotate([90, 0, 0])
    translate([0, 0, -30])
    cylinder (50,d=5,center=true);
    rotate([90, 0, 0])
    translate([0, 0, 30])
    cylinder (50,d=5,center=true);
}

// ailerons
translate([0,-(d_int/2+4),0])
rotate([0,0,-90])
aileron(150,75,65,40,1.5);
translate([0,d_int/2+4,0])
rotate([0,0,90])
aileron(150,75,65,40,1.5);
}

roulis();

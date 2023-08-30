
use <../library/meca-comps/meca-comps.scad>
use <../library/elec-comps/elec-comps.scad>
use <../library/elec-cartes/elec-cartes.scad>
use <../Module_Vitesse-Dimitri/blocs.scad>

module vitesse(d_int=96){
// support
color("white"){
    bague_pleine(d_int,20);
    translate([-5,-d_int/2,20])
    cube([10,d_int,146]);
    difference(){
        translate([0,0,20+146]) bague_pleine(84,20);
        translate([-26, -30, 166]) cube(size = [21,35, 21]);
    }
}

// arduino
translate([6,35,110])
rotate([-90,0,-90])
arduino_uno();

// piles
rotate([0,0,90]) 
translate([-27.5,-22,35]) {
    pile_9V();
    translate([30,0,0]) 
    pile_9V();
}

// carte CATS
rotate([0,-90,0])
translate([90,-29,5])
cats_vega();

// pile
rotate([0,0,90]) 
translate([-30,5,30]) 
pile_9V();

// panneau de controle
color("dimgrey") 
rotate([0,0,180]) 
translate([5,-32,70]) 
equerre(h1 = 30, h2 = 25, l = 70, e = 2);

// blocs vitesse
translate([0,0,-156])
blocs();

}

vitesse();

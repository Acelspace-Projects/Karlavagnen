
use <../library/elec-cartes/elec-cartes.scad>
use <../library/meca-comps/meca-comps.scad>

module vitesse(d_int=96,taille_plaque=146){
// support
color("white"){
    bague_pleine(d_int,20);
    translate([-5,-d_int/2,20])
    cube([10,d_int,taille_plaque]);
    difference(){
        translate([0,0,20+taille_plaque]) bague_pleine(84,20);
        translate([-26, -5, 166]) cube(size = [21,35, 21]);
    }
   
}

// arduino
translate([6,35,110])
rotate([-90,0,-90])
arduino_uno();

// CATS Vega
translate([-9, -5, 90])
rotate([0, 270, 0])
CATS_Vega();

}

vitesse();

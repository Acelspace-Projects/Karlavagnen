
use <../library/elec-cartes/elec-cartes.scad>
use <../library/meca-comps/meca-comps.scad>

module vitesse(d_int=96,taille_plaque=130){
// support
color("white"){
    bague_pleine(d_int,20);
    translate([-5,-d_int/2,20])
    cube([10,d_int,taille_plaque]);
    translate([0,0,20+taille_plaque])
    bague_pleine(d_int,20);
}

// arduino
translate([5,0,100])
rotate([0,90,0])
arduino_nano();

// tube de pitot
translate([55,0,0]) 
bague_creuse(10,8,150);
translate([-55,0,0]) 
bague_creuse(10,8,150);

}

vitesse();

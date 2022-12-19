
use <../library/elec-cartes/elec-cartes.scad>
use <../library/meca-comps/meca-comps.scad>

module minuterie(d_int=96){
// création support minuterie 
color("white")
bague_pleine(d_int,20);
color("white")
translate([0,0,380])
bague_pleine(d_int,20);
color("white")
translate([0,0,190])
cube([8,d_int,380],center=true);

// intégration carte elec sur support minuterie
translate ([5,0,190])
rotate ([0,90,0])
     sequenceur();
}

minuterie();

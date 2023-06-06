
use <../library/elec-cartes/elec-cartes.scad>
use <../library/meca-comps/meca-comps.scad>

module minuterie(d_int=96){

// support minuterie 
color("white") {
     bague_pleine(d_int,20);
     translate([0,0,380])
     bague_pleine(d_int,20);
     translate([0,0,190])
     cube([8,d_int,380],center=true);
}

// carte elec
translate ([5,0,190])
rotate ([90,0,90])
sequenceur();

}

minuterie();

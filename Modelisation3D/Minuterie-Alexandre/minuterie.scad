
use <../library/elec-comps/elec-comps.scad>
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
translate([5,0,350])
rotate([90,0,90])
sequenceur();

// panneau de controle
translate([4,-25,160]) 
color("dimgrey") 
equerre(h1 = 30, h2 = 30, l = 150, e = 2);

// arduino nano
color([50/255,100/255,40/255]) 
translate([7,-19,40])
cube([2,38,63]);
rotate([0,90,0])
translate([-93,-9,10])
arduino_nano();

// piles
translate([4,-25,155])
rotate([0,180,-90]) 
pile_9V();
translate([4,10,270])
rotate([0,180,-90]) 
pile_9V();

}

minuterie();

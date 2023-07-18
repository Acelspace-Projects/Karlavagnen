use <tube.scad>
use <bagues.scad>
use <block_ailerons.scad>
use <ogive.scad>
use <guide_rampe.scad>
use <bras_poids.scad>
use <bras_ogma.scad>
use <block_interrupteur_ogma.scad>
use <block_rouli.scad>

longueur_total = 2350;
longueur_ogive = 350;
diametre = 100;

// Ogive
translate([0,0,longueur_total-350]) ogive_ogma_1();
translate([0,0,longueur_total-350]) ogive_ogma_2();

// Tube
// tube_ogma();

// Ailerons
block_ailerons_ogma();

// Guide rampe 1
rotate([0,0,45*3])
translate([0, diametre/2-1.5, 435]) 
guide_rampe();

// Guide rampe 2
rotate([0,0,45*3])
translate([0, diametre/2-1.5, 1605]) 
guide_rampe();

// Bras controle rouli
for(i=[0:1:3])
    rotate([0,0,90*i])
    translate([0,diametre/2,1010]) 
    bras_ogma();

// Block interrupteur
translate([0,0,1035])
rotate([0,0,-90]) 
block_interrupteur_ogma();

translate([0, 0, 567]) 
control_bras();

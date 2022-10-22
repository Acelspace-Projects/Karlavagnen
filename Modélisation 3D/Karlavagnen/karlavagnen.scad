/*Global*/
use <../library/elec-cartes/elec-cartes.scad>
use <../library/elec-comps/elec-comps.scad>
use <../library/meca-comps/meca-comps.scad>

/*Persos*/
use <../Tensionometre-Etienne/tensionometre.scad>

module block_ailerons_ogma() {
    
    for (i=[0:1:3]) {
        // equerres bague de pousée
        color("grey")
        rotate([0,0,90*i]) 
        translate([1,-33,10]) 
        rotate([90,0,0])
        equerre(20, 20, 10, 1);
        
        color("grey")
        rotate([0,0,90*i]) 
        translate([-33,1,10])
        rotate([0,-90,0])
        equerre(20, 20, 10, 1);
        // equerres bague mileu
        color("grey")
        rotate([0,0,90*i])
        translate([1,33,162-5])
        rotate([-90,0,0])
        equerre(20, 20, 10, 1);
        
        color("grey")
        rotate([0,0,90*i])
        translate([1,-43,162-5]) 
        rotate([-90,0,0])
        equerre(20, 20, 10, 1);
        // equerres bague haut
        color("grey")
        rotate([0,0,90*i])
        translate([1,33,225-5])
        rotate([-90,0,0])
        equerre(20, 20, 10, 1);
        
        color("grey")
        rotate([0,0,90*i])
        translate([1,-43,225-5]) 
        rotate([-90,0,0])
        equerre(20, 20, 10, 1);
    }
    // Bague de pousée
    color("grey")
    bague_de_poussee(100, 97, 54.3, 2, 10);

    // Bague milieu
    color("grey")
    translate ([0,0,162-5])
    bague_creuse(100, 50, 10);

    // Bague haut
    color("grey")
    translate ([0,0,225-5])
    bague_creuse(100, 50, 10);

    // Ailerons
    for (aileron = [0:1:3]) {
        rotate([0,0,aileron*90])
        translate([50,0,0])
        union() {
            color("grey")
            translate([-20,-1,0]) 
            cube(size=[20,2,300]);
            aileron(300, 300, 145, 90, 2);
        }
    }
}

// 16.2 22.5 cm

block_ailerons_ogma();
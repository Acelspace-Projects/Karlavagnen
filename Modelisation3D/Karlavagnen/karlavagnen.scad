/*Global*/
use <../library/elec-cartes/elec-cartes.scad>
use <../library/elec-comps/elec-comps.scad>
use <../library/meca-comps/meca-comps.scad>

/*Persos*/
use <../Ogive-Dimitri/ogive.scad>
use <../Camera-Clement/camera.scad>
use <../Tensionometre-Etienne/tensionometre.scad>
use <../Module_Vitesse-Dimitri/vitesse.scad>
use <../Minuterie-Alexandre/minuterie.scad>
use <../Mini_Ailerons-ClementL/roulis.scad>

/*Variables*/
d_ext=100;
d_int=96;
l_tube=2000;


/*Camera*/
translate([0,0,l_tube+150])
bloc_camera(d_int);

/*Ogive*/
translate([0,0,l_tube])
ogiveK(d_ext);

/*Module vitesse*/
translate([0,0,l_tube-216])
vitesse();


/*Trappe*/
translate([0,0,1000]) 
color("red") 
cylinder(h=500,d=d_int);


/*Bloc Minuterie*/
translate([0,0,500]) {
    /*Minuterie*/
    minuterie(d_int);
    /*Tensionometre*/
    scale([0.5,0.5,1]) 
    translate([-50,0,130]) 
    tensionometre();
}


for (i=[0:1:3]) {
    color("dimgrey") {
    // equerres bague de pousée
    rotate([0,0,90*i]) 
    translate([1,-33,8]) 
    rotate([90,0,0])
    equerre(20, 20, 10, 1);

    rotate([0,0,90*i]) 
    translate([-33,1,8])
    rotate([0,-90,0])
    equerre(20, 20, 10, 1);

    // equerres bague mileu
    rotate([0,0,90*i]) 
    translate([1,-33,170]) 
    rotate([90,0,0])
    equerre(20, 20, 10, 1);

    rotate([0,0,90*i]) 
    translate([-33,1,170])
    rotate([0,-90,0])
    equerre(20, 20, 10, 1);

    // equerres bague haut
    rotate([0,0,90*i]) 
    translate([1,-33,235]) 
    rotate([90,0,0])
    equerre(20, 20, 10, 1);

    rotate([0,0,90*i]) 
    translate([-33,1,235])
    rotate([0,-90,0])
    equerre(20, 20, 10, 1);
    }
}
// Bague de pousée
color("grey")
translate ([0,0,-2])
bague_de_poussee(d_ext, d_int, 54.3, 2, 10);
// Bague milieu
color("grey")
translate ([0,0,160])
bague_creuse(d_int, 50, 10);
// Bague haut
color("grey")
translate ([0,0,225])
bague_creuse(d_int, 50, 10);

// Ailerons
for (aileron = [0:1:3]) {
    rotate([0,0,aileron*90])
    translate([50,0,0])
    union() {
        color("grey")
        translate([-20,-1,0]) 
        cube(size=[20,2,300]);
        aileron(300, 150, 130, 75, 2);
    }
}

/*Systeme retenue propu*/
retenuePropu();

/*Tube*/
color([150/255,150/255,150/255,0.5])
bague_creuse(d_ext, d_int, l_tube);

use <ressort.scad>
use <bagues.scad>
use <composants_elec.scad>;

module block_rouli_ogma() {
    translate([0,0,100]) color("white") bague_pleine(96, 15);
    color("white") bague_pleine(96, 15);
}

// block_rouli_ogma();

module control_bras() {
    // Bague basse
    /*
    */
    color("white")
    bague_creuse_2(96, 30, 6, 18, $fn=50);

    // Bague haute
    color("white")
    translate([0, 0, 89]) 
    bague_creuse(96, 13, 18, $fn=50);
    
    // Supports
    color("lightgrey")
    for (i=[0:1:3]) {
        rotate([0,0,90*i]) 
        translate([96/2-10-5, 0, 18])
        cylinder(d=10, h=89-18, $fn=50);
    }

    // moteur
    translate([6, 0, 25+18]) 
    rotate([0,180,90]) 
    moteur_1();

    // Cam
    module cam(d, h) {
        translate([0,0,-14]) 
        cylinder(d=12, h=14);
        translate([0, -d/2, 0])
        difference() {
            translate([0, d/2, 0]) 
            cylinder(d=d, h=h);
            rotate([atan(h/(d/2)), 0, 0])
            translate([-100, 0, 0])
            cube([200, 200, 20]);
        }
    }
    color("lightgrey")
    translate([0,0,18+25+2+14])
    cam(d=40, h=8, $fn=50);

    // ressort
    // guide ressort
    translate([0, 0, 91])
    rotate([180, 0, 0])
    union() {
        color("black")
        translate([0, 0, 15]) 
        cylinder(d=35, h=3);

        ressort(diametre=17, section=1, hauteur=15, nb_spire=3);
        
        color("black")
        translate([0, 0, -42+15]) 
        cylinder(d=10, h=42);

        color("black")
        translate([0, 0, -10-18]) 
        cylinder(d=32, h=2);

        translate([0, 0, 18+5]) {
            color("black") 
            difference() {
                translate([0,8,0])
                union() {
                    cylinder(d=16, h=10, $fn=20);
                    translate([0, 0, -5]) 
                    cylinder(d=16, h=5, $fn=20);
                }
                rotate([atan(10/16),0,0]) 
                translate([-10, 0, 0]) 
                cube(30);
            }
        }
    }

    color("gold")
    translate([8, 8, 87])
    cylinder(d=4, h=50, $fn=20);

    // Cloche de verrouillage
    color(["black"])
    translate([0, 0, 119])
    difference() {
        cylinder(d=32, h=27, $fn=50);
        translate([0, 0, 7]) 
        cylinder(d=28, h=27);
        translate([0, -32/2, 26]) 
        rotate([-90, 0, 0]) 
        cylinder(d=5, h=32, $fn=30);
        translate([32/2, 0, 26]) 
        rotate([-90, 0, 90]) 
        cylinder(d=5, h=32, $fn=30);
    }
}

// control_bras();
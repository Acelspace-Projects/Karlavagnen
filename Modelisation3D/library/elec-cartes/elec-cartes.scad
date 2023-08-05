
use <../elec-comps/elec-comps.scad>
use <../meca-comps/meca-comps.scad>

// <img src="https://raw.githubusercontent.com/Acelspace-Projects/Acelspace/main/OpenSCAD/library/elec-cartes/arduino_uno.png">

module arduino_uno(){
    color("blue")
    difference() {
        polyhedron(
            points=[
                [    0  ,               0, 0], //  0
                [66.04-2,               0, 0], //  1
                [66.04  ,              -2, 0], //  2
                [66.04  ,    -(17.78-2-3), 0], //  3
                [69.04  ,    -(17.78-2  ), 0], //  4
                [66.04+3,  -(45.72+2    ), 0], //  5
                [66.04  ,  -(45.72+2+3  ), 0], //  6
                [66.04  ,  -(45.72+2+3+2), 0], //  7
                [    0  ,  -(45.72+2+3+2), 0], //  8

                [    0  ,               0, 1], //  9
                [66.04-2,               0, 1], // 10
                [66.04  ,              -2, 1], // 11
                [66.04  ,    -(17.78-2-3), 1], // 12
                [69.04  ,    -(17.78-2  ), 1], // 13
                [66.04+3,  -(45.72+2    ), 1], // 14
                [66.04  ,  -(45.72+2+3  ), 1], // 15
                [66.04  ,  -(45.72+2+3+2), 1], // 16
                [    0  ,  -(45.72+2+3+2), 1], // 17
            ],
            faces=[
                [9,0,1,10],
                [10,1,2,11],
                [11,2,3,12],
                [12,3,4,13],
                [13,4,5,14],
                [14,5,6,15],
                [15,6,7,16],
                [16,7,8,17],
                [17,8,0,9],
                [9,10,11,12,13,14,15,16,17],
                [0,8,7,6,5,4,3,2,1]
            ],
            convexity=5
        );
        translate([15.24, -2.54,-1]) cylinder(d=3.2, h=10, $fn=50);
        translate([15.24,-50.8 ,-1]) cylinder(d=3.2, h=10, $fn=50);
        translate([66.04,-17.78,-1]) cylinder(d=3.2, h=10, $fn=50);
        translate([66.04,-45.72,-1]) cylinder(d=3.2, h=10, $fn=50);
    }
    // USB
    color("grey")
    translate([-5,-12*2,1])
    cube(size=[15, 12, 12]);
    // SD
    color("grey")
    translate([-2,-(50),1])
    cube(size=[15, 11, 2]);
    // Crystal
    color("grey")
    translate([13,-30,1])
    union() {
        longueur = 12;
        largeur  = 5;
        hauteur  = 6;
        translate([largeur/2,0,0]) cube(size=[longueur-largeur,largeur,hauteur]);
        translate([largeur/2,largeur/2,0]) cylinder(d=largeur,h=hauteur, $fn=50);
        translate([longueur-largeur/2,largeur/2,0]) cylinder(d=largeur,h=hauteur, $fn=50);
    }
    // ATMega
    color([0.1,0.1,0.1])
    translate([30,-41,0]) 
    cube(size=[33,9,12]);

    // Pins
    color([0.1,0.1,0.1])
    translate([18,-3.5,0])
    cube(size=[25,2,10]);

    color([0.1,0.1,0.1])
    translate([44,-3.5,0])
    cube(size=[20,2,10]);

    color([0.1,0.1,0.1])
    translate([25,-51.8,0])
    cube(size=[21,2,10]);

    color([0.1,0.1,0.1])
    translate([47,-51.8,0])
    cube(size=[18,2,10]);
}

// <img src="https://raw.githubusercontent.com/Acelspace-Projects/Acelspace/main/OpenSCAD/library/elec-cartes/arduino_nano.png">

module arduino_nano(){
    color("blue")
    cube([43,18,2]);
    // USB
    color("grey")
    translate([-3,4.5,2])
    cube([9, 9, 3]);
    // Pins
    color([0.1,0.1,0.1]) {
        translate([5,1,2])
        cube([35, 1.5, 5]);
        translate([5,15.5,2])
        cube([35, 1.5, 5]);
    }
}

// <img src="https://raw.githubusercontent.com/Acelspace-Projects/Acelspace/main/OpenSCAD/library/elec-cartes/sequenceur.png">

module sequenceur(){
    epaisseur_carte = 1.5;
    // Carte
    color("beige")
    translate([0,0,epaisseur_carte/2]) 
    cube(size=[85,50,epaisseur_carte], center=true);
    // Relay
    color("white")
    translate([-35,-20,epaisseur_carte])
    cube([20, 15, 15]);
    // diode 1
    color("red")
    translate([-35,15,epaisseur_carte]) 
    diode();
    // diode 2
    color("blue")
    translate([-28,15,epaisseur_carte]) 
    diode();
    // Condo 1
    color("blue")
    translate([7,15,epaisseur_carte]) 
    cylinder(d=10, h=13, $fn=20);
    // Condo 2
    color("blue")
    translate([25,5,epaisseur_carte]) 
    cylinder(d=5, h=8, $fn=20);
    // Transistor
    color([0.1,0.1,0.1])
    translate([-16,1,epaisseur_carte]) 
    difference() {
        cylinder(d=4, h=5, $fn=20);
        translate([4,0,3]) 
        cube(7, center=true);
    }
    // NE556
    color([0.1,0.1,0.1])
    translate([5,-12,epaisseur_carte]) 
    cube(size=[10,20,9]);
    // Potar
    translate([-2.5,-15,epaisseur_carte])
    union() {
        color("blue")
        cube(size=[5,10,10.5]);
        color("gold")
        translate([2,2,10.5])
        cylinder(d=2.5, $fn=50);
    }
}

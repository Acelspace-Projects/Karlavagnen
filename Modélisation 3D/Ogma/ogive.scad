
module ogive_pleine(hauteur, diametre) {
    h_o = hauteur;
    d_o = diametre;
    r_o = d_o/2;

    rotate_extrude(angle=360, convexity=2)
    rotate(a=[0,0,90]) 
    intersection() {
        square([h_o,r_o]);
        resize([2*h_o, 0, 0]) circle(r_o, $fn=100);
    }
}

// ogive_pleine(170, 63);

module ogive(hauteur, diametre, epaisseur) {
    difference() {
        ogive_pleine(hauteur, diametre);
        translate([0,0,-1 ]) ogive_pleine(hauteur-epaisseur+1, diametre-epaisseur);
    }
}

// ogive(170, 63, 10);

module ogive_ogma_1() {
    hauteur = 350;
    diametre = 100;
    epaisseur = 2;

    color("green") 
    difference() {
        ogive_pleine(hauteur, diametre);
        difference() {
            translate([0,0, -1]) ogive_pleine(hauteur-epaisseur+1, diametre-epaisseur);
            translate([0,0,220+diametre]) cube(diametre*2, true);
        };
        translate([0,-diametre,-1]) cube(diametre*4, false);
        translate([0,0,220+25]) cylinder(d=22, h=45);
        translate([0,0,230]) cylinder(d=4, h=50);
        translate([0,0,220+5]) cylinder(d=40, h=15);
    }
}

module ogive_ogma_2() {
    color("red") 
    rotate([0,0,180])
    ogive_ogma_1();

    color("grey")
    translate([9,0,220+2])
    cylinder(d=1, h=20);
}

// ogive_ogma_1();
// ogive_ogma_2();
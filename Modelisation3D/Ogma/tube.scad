
module tube(hauteur, diametre, epaisseur) {
    difference() {
        cylinder(h=hauteur, d=diametre);
        translate([0,0,-1]) cylinder(h=hauteur+2, d=diametre-epaisseur*2);
    }
}

module tube_ogma() {
    longueur_total = 2350-350;
    diametre = 100;
    
    color("grey")   
    difference() {
        tube(longueur_total, diametre, 2);
        // trous les poids
        longueur_1 = 40;
        largeur_1 = 20;
        hauteur_1 = 690;
        for (i=[0:1:3]) {
            rotate([0,0,i*90]) 
                translate([diametre/2,0,hauteur_1+longueur_1/2]) 
                cube(size=[10, largeur_1, longueur_1], center=true);
        }
        // trou accès poids
        longueur_2 = 85;
        largeur_2 = 30;
        rotate ([0,0,45]) 
            translate([0,diametre/2,725+longueur_2/2]) 
            cube(size=[largeur_2, 10, longueur_2], center=true);
        // trou accès interrupteurs
        longueur_3 = 150;
        largeur_3 = 30;
        rotate ([0,0,45]) 
            translate([0,diametre/2,1150+longueur_3/2]) 
            cube(size=[largeur_3, 10, longueur_3], center=true);
        // trou jack
        longueur_4 = 55;
        largeur_4 = 20;
        rotate ([0,0,45]) 
            translate([0,diametre/2,1065+longueur_4/2]) 
            cube(size=[largeur_4, 10, longueur_4], center=true);
    }
}

// tube_ogma();

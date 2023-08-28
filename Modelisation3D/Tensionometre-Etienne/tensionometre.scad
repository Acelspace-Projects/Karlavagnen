use <../library/meca-comps/meca-comps.scad>

module tensionometre(l_tube=250) {
    ressort(60,5,l_tube,20);
    color([200/255,200/255,200/255]) {
        tube(hauteur = l_tube, diametre = 80, epaisseur = 3);

        translate([0,0,l_tube+45]) cylinder(5,12,17.5);
        translate([0,0,l_tube+50]) cylinder(30,17.5,17.5);
        translate([0,0,l_tube+80]) cylinder(5,17.5,12);
    }
    color([85/255,85/255,85/255]) {
        translate([0,0,l_tube]) cylinder(160,7,7);
    }
}

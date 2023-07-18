use <../library/meca-comps/meca-comps.scad>

module tensionometre() {
    ressort(60,5,340,20);
    color([.9,.9,.9]) tube(hauteur = 340, diametre = 80, epaisseur = 5);
    translate([0,0,340]) cylinder(110,7,7);
    translate([0,0,370]) cylinder(15,12,12);
    translate([0,0,385]) cylinder(5,12,17.5);
    translate([0,0,390]) cylinder(30,17.5,17.5);
    translate([0,0,420]) cylinder(5,17.5,12);
    translate([0,0,425]) cylinder(15,12,12);
    translate([0,0,450]) ressort(14,5,50,10);
}

use <../library/meca-comps/meca-comps.scad>

module tensionometre();
{
    ressort(6,0.5,34,20);
    color([0.9,0.9,0.9]) tube(hauteur = 34, diametre = 8, epaisseur = 0.5);
    translate([0,0,34]) cylinder(11,0.7,0.7);
    translate([0,0,37]) cylinder(1.5,1.2,1.2);
    translate([0,0,38.5]) cylinder(0.5,1.2,1.75);
    translate([0,0,39]) cylinder(3,1.75,1.75);
    translate([0,0,42]) cylinder(0.5,1.75,1.2);
    translate([0,0,42.5]) cylinder(1.5,1.2,1.2);
    translate([0,0,45]) ressort(1.4,0.5,5,10);
}
tensionometre();
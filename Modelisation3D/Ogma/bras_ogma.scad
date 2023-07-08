/*
^  |
l1 |
|  |
v  | < h >
^   \
l2   \
|     \
v      \
^       |
l3      |
|       |
v       |
*/
module bras_seul(l1,l2,l3,h,d) {
    translate([0,d/2,-l1-l2-l3+0.5])
        cylinder(d=d, h=l3);
    translate([0,d/4,-l1-l2])
        rotate([-atan((h-d/2)/l2),0,0])
        cylinder(d=d, h=sqrt(l2^2 + (h-d/2)^2)+1);
    translate([0,h-d/2,-l1])
        cylinder(d=d, h=l1);
}

module fixation(L,l,H,h,e) {
    // Base
    translate([0,h/2,0])
        cube(size=[e, h, L], center=true);
    // Articulation
    translate([0,H/2,0])
        cube(size=[e, H, l], center=true);
}
// fixation(21,7,13,5,8);

module poids(){
    color("orange")
    translate([0, -5, 0])
    cube(size=[18, 35, 38], center=true);
    
    color("grey")
    translate([0, -25/2-10, 0]) 
    rotate([90, 0, 0])
    cylinder(d=3, h=4, $fn=10);

    color("grey")
    translate([0, -25/2-3-11, 0]) 
    rotate([90, 0, 0])
    cylinder(d1=3, d2=7, h=2.5, $fn=10);
}

module bras(l1,l2,l3,h,d) {
    color("grey") bras_seul(l1, l2, l3, h, d);
    color("grey") fixation(21, 7, 13, 5, 8);
    translate([0,-25/2+d/2,-l1-l2-l3+45/2])
        poids();
}

module bras_ogma()
    bras(20, 23, 280, 10, 6);

bras_ogma();
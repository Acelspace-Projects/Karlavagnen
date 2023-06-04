
use <../library/meca-comps/meca-comps.scad>

module bloc_camera(d_int=96) {

// //ogive (réduction du diamètre)
// difference(){
//     translate([0,0,200]) cylinder(h = 70, r1 = 50, r2 = 42.5, center = false);
//     translate([0,0,198.4]) cylinder(h = 72, r1 = 35, r2 = 27, center = false);
// }

// //ogive (dôme)
// translate([0,0,270]) 
// difference(){
//     #sphere(r = 42.5);
//     translate([0,0,-50]) cube(100,true);
//     #sphere(r = 39.5);
// }

//support caméra
// difference(){
//     translate([0,0,200]) cylinder(h = 20, r1 = 50, r2 = 30, center = false);
//     translate([0,0,202]) cylinder(h = 19.4, r1 = 35, r2 = 24.55, center = false);
// }

//batterie
// color([0.9, 0, 0]) {
//     translate([-20,0,195]) cube([51, 34, 4]);
// }

//support
translate([0, 0, -11])
color("white")
difference(){
    cylinder(h=10, d1=82, d2=81);
    translate([0,0,-1])
    cylinder(h=12,d=10);
};

//servo-moteurs
color([50/255,50/255,255/255]) {
    translate([0,-7,8.5-28])
    cube([8, 19, 17],true);
    translate([23/2+10,0,17/2+5])
    rotate([0,0,90]) 
    cube([8, 19, 17],true);
}

//axe
translate([0, 0, -11])
color("grey")
cylinder(h=15,d=5);

//pattes support caméra
union() {
    translate([23/2,-10/2,4])
    cube([5,10,35]);
    translate([-23/2-5,-10/2,4])
    cube([5,10,35]);
    translate([-23/2-5,-10/2,4])
    cube([33,10,5]);
}

//caméra
translate([0,0,15]) {
    translate([0,0,23/2])
    color("dimgrey") 
    cube(23,true);
    translate([0,23/2+1,23/2])
    color("navy")
    rotate([90,0,0])
    cylinder(h=1,d=10);
}

}

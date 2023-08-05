module bloc_vitesse(type){
    translate([0,-22.5,150])
    color([0.4,0.5,1]){
        rotate([0,90,0]){
difference(){
    cube([150,45,49]);
    translate([-10,22.5,-47]) rotate ([0,90,0]) cylinder(170,50,50);
    translate([-1,22.5,24]) rotate ([0,90,0]) cylinder(52,19,5);
    translate([0,22.5,24]) rotate ([0,90,0]) cylinder(170,5,5);
    translate([100,22.5,24]) rotate ([0,90,0]) cylinder(51,5,19);
    if (type>0){
    translate([-10,22.5,24]) rotate ([0,90,0]) cylinder(170,18,18);}}
difference(){
    translate([0,22.5,-47]) rotate ([0,90,0]) cylinder(150,55,55);
    translate([-10,0,0]) cube([170,45,45]);
    translate([-10,22.5,-47]) rotate([0,90,0])cylinder(170,50,50);
    translate([-10,48,-5]) rotate([-30]) cube(170);
    translate([-10,-5,-5]) rotate([120]) cube(170);
    translate([-10,-35,-200]) cube(200);
}

}}}
module blocs(){
translate([50,0,0]) rotate([0,0,0]) bloc_vitesse(0);
translate([0,50,0]) rotate([0,0,90]) bloc_vitesse(1);
rotate([0,180,0]){translate([0,70,-150]){
color([1,1,1,0.5])cylinder(100,2,2);
translate([0,0,100]){
translate([-7.5,-1.5,0])cube([15,3,15]);
translate([0,0,10]) rotate([0,-45,0])  color([1,1,1,0.5])cylinder(20,1,1);
translate([1,0,10]) rotate([0,0,0]) color([1,1,1,0.5])cylinder(20,1,1);}
color([0.6,0.6,0.6]){
translate([-22.5,0,25]) rotate([0,90,0]) cylinder(45,4,4);
translate([0,22.5,75]) rotate([90,0,0]) cylinder(39,4,4);
}
}}
translate([-50,0,0]) rotate([0,0,180]) bloc_vitesse(0);
translate([0,-50,0]) rotate([0,0,-90]) bloc_vitesse(1);
}
//translate([-0,0,-1500]) cylinder(2000,50,50); //gabarit de tube
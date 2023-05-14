
//ogive (réduction du diamètre)
difference(){translate([0,0,200]) cylinder(h = 70, r1 = 50, r2 = 42.5, center = false);
translate([0,0,198.4]) cylinder(h = 72, r1 = 35, r2 = 27, center = false);
}
//ogive (dôme)
translate([0,0,270]) 
difference(){#sphere(r = 42.5);
    translate([0,0,-50]) cube(100,true);
    #sphere(r = 39.5);
    };
//support caméra
difference(){
translate([0,0,200]) cylinder(h = 20, r1 = 50, r2 = 30, center = false);
translate([0,0,202]) cylinder(h = 19.4, r1 = 35, r2 = 24.55, center = false);

}
//corps de la fusée pd
translate([0,0,0]) cylinder(h = 200, r1 = 50, r2 = 50, center = false);

//batterie
color([0.9, 0, 0]) {
translate([-20,0,195]) cube(size=[51, 34, 4]);
}
//caméra: moteur pas à pas

translate([0, 0, 240]) cylinder(h = 9.7, r1 = 29.15, r2 = 28.15);
translate([0, 0, 251.7]) cylinder(h = 7, r1 = 2, r2 = 2);
color([0, 0.5, 0])
translate([0, 0, 240.5]) cylinder(h = 10, r1 = 17, r2 = 17);
//caméra: servo moteur
translate([170, 0, 0]) cube(size=[8, 19, 17]);
//pattes support caméra + servomoteur
translate([-15.8, -4.5, 251.7]) cube (size=[5, 9, 25]);
translate([12, -4.5, 251.7]) cube (size=[5, 9, 25]);
//caméra
translate([-10.85, -11.5, 261.7]) cube(size=[23, 23, 23]);



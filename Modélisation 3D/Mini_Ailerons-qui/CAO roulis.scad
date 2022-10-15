include <lib-gear-dh.scad>
include <lib-worm-dh.scad>

// Contrôle du roulis
translate([0, 0, -17])
cylinder (h = 10, r = 49, center = true, $fn=100);

translate([0, 0, 127])
cylinder (h = 10, r = 49, center = true, $fn=100);

translate([12, 0, 55])
cube(size = [3, 89, 150], center = true);

translate([0, -25, 0])
cube(size = [20, 5, 40], center = true);

translate([0, 25, 0])
cube (size = [20, 5, 40], center = true);

translate([0, 0, 30])
cylinder (h = 40, r = 10,center = true, $fn=100);

translate([0, 0, 8])
cylinder (h = 7, r = 1, center = true, $fn=100);

translate([0,0,7])
gear(24,8,12);

rotate([90, 0, 0])
translate([0, 0, 10])
gear(20,6,12);

rotate([90, 0, 0])
translate([0, 0, -12])
gear(20,6,12);

//difference() {
//	cylinder (h = 160, r=50, center = true, $fn=100);
//	cylinder (h = 160, r=49, center = true, $fn=100);
    
//    translate([0, 0, 0])
//    rotate ([90,0,0]) cylinder (h = 100, r=3, center = true, $fn=100);
   
//}
rotate([0, 0, 90])
translate([51, 0, -80])
polyhedron ( points = [[0, -0.5, 120], [0, 0.5, 120], [0, 0.5, 50], [0, -0.5, 50], [40, -0.5, 50], [40, 0.5, 50]], 
triangles = [[0,3,2], [0,2,1], [3,0,4], [1,2,5], [0,5,4], [0,1,5],  [5,2,4], [4,2,3], ]);

rotate([0, 0, 270])
translate([51, 0, -80])
polyhedron ( points = [[0, -0.5, 120], [0, 0.5, 120], [0, 0.5, 50], [0, -0.5, 50], [40, -0.5, 50], [40, 0.5, 50]], 
triangles = [[0,3,2], [0,2,1], [3,0,4], [1,2,5], [0,5,4], [0,1,5],  [5,2,4], [4,2,3], ]);
rotate([90, 0, 0])
translate([0, 0, -30])
cylinder (h = 50, r = 2.9, center = true, $fn=100);

rotate([90, 0, 0])
translate([0, 0, 30])
cylinder (h = 50, r = 2.9, center = true, $fn=100);




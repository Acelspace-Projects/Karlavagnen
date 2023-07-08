
module pile_9V(){
    l = 25;
    L = 45;
    e = 17;
    
    color("green")
    translate([2,2,2])
    minkowski(){
        cube(size=[l-4,e-4,L-4]);
        sphere(r=2, $fn=50);
    }
    
    color("grey")
    translate([7,e/2,L])
    cylinder(d=5, h=2, $fn=50);

    color("grey")
    translate([18,e/2,L])
    cylinder(d=8, h=2, $fn=50);
}

// pile_9V();

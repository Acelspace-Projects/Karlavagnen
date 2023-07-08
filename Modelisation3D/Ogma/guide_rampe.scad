
module guide_rampe() {
    rotate([-90,0,0]) color("grey") union() {
        cylinder(d= 7, h=13);
        cylinder(d=12, h= 5);
        translate([0,0,10]) cylinder(d=12, h=3);
    }
}

// guide_rampe();
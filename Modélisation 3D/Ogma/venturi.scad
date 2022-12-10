module venturi();
    {
    difference() {
            translate([0,0,-40]) cylinder(r=32,h=130,center=false);
            rotate([0,45,0]) translate([-90,-70,22]) cube(180);
            translate([0,0,-40]) cylinder(r=30,h=130,center=false);
    }
    translate([0,0,-30]) cylinder(r=32,h=30,center=false);
    translate([0,0,-60]) cylinder(r1=8,r2=32,h=20,center=false);
    translate([0,0,-90]) cylinder(r=8,h=30,center=false);
    translate([0,0,-100]) cylinder(r1=32,r2=8,h=20,center=false);
    translate([0,0,-100]) cylinder(r1=30,r2=6,h=20,center=false);
    translate([0,0,-130]) cylinder(r=32,h=30,center=false);
    translate([0,0,-130]) cylinder(r=30,h=30,center=false);
        difference() {
            translate([0,0,-260]) cylinder(r=32,h=130,center=false);
            translate([-90,-70,-252]) rotate([0,45,0]) cube(180);
            translate([0,0,-260]) cylinder(r=32,h=130,center=false);
}
                #translate([0,0,-110]) cylinder(r=32,h=70);
    }


venturi();

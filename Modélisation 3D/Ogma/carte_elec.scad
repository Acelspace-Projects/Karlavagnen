use <composants_elec.scad>;

module sequenceur_1(){
    epaisseur_carte = 1.5;
    // Carte
    color("beige")
    translate([0,0,epaisseur_carte/2]) 
    cube(size=[85,50,epaisseur_carte], center=true);
    // Relay
    color("white")
    translate([-35,-20,epaisseur_carte])
    cube([20, 15, 15]);
    // diode 1
    color("red")
    translate([-35,15,epaisseur_carte]) 
    diode();
    // diode 2
    color("blue")
    translate([-28,15,epaisseur_carte]) 
    diode();
    // Condo 1
    color("blue")
    translate([7,15,epaisseur_carte]) 
    cylinder(d=10, h=13, $fn=20);
    // Condo 2
    color("blue")
    translate([25,5,epaisseur_carte]) 
    cylinder(d=5, h=8, $fn=20);
    // Transistor
    color("black")
    translate([-16,1,epaisseur_carte]) 
    difference() {
        cylinder(d=4, h=5, $fn=20);
        translate([4,0,3]) 
        cube(7, center=true);
    }
    // NE556
    color("black")
    translate([5,-12,epaisseur_carte]) 
    cube(size=[10,20,9]);
    // Potar
    translate([-2.5,-15,epaisseur_carte])
    union() {
        color("blue")
        cube(size=[5,10,10.5]);
        color("gold")
        translate([2,2,10.5])
        cylinder(d=2.5, $fn=50);
    }
}
sequenceur_1();
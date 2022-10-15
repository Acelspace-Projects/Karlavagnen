use <bagues.scad>
use <pile.scad>
use <parts.scad>
use <arduino.scad>
use <tube.scad>
use <carte_elec.scad>
use <composants_elec.scad>


longueur_block = 375;
diametre_tube_ressort = 40;
epaisseur_plaque_centrale = 5;

// a1 : angle de l'écaire
// a2 : angle de la base par rapport à zx
module plaque_interrupteurs(a1=30){
    translate([0, -2.5, 0])
    rotate([0,0,-a1])
    union() {
        rotate([90,0,0]) 
        union() {
            align_led_v = [30, 0, 1];
            align_sw_v  = [30, 0, -9];

            translate(align_sw_v + [0, 9.5, 0]) 
            rotate([0,0,90])
            interrupteur();

            color("red")
            translate(align_led_v + [0, 23, 0]) 
            diode(d=3);

            color("green")
            translate(align_led_v + [0, 36, 0]) 
            diode(d=3);


            translate(align_sw_v + [0, 49, 0]) 
            rotate([0,0,90])
            interrupteur();

            color("white")
            translate(align_led_v + [0, 64, 0]) 
            diode(d=3);

            color("red")
            translate(align_led_v + [0, 76, 0]) 
            diode(d=3);

            color("green")
            translate(align_led_v + [0, 89, 0]) 
            diode(d=3);


            translate(align_sw_v + [0, 100, 0]) 
            rotate([0,0,90])
            interrupteur();

            color("blue")
            translate(align_led_v + [0, 115, 0]) 
            diode(d=3);

            color("yellow")
            translate(align_led_v + [0, 128, 0]) 
            diode(d=3);

            color("red")
            translate(align_led_v + [0, 140, 0]) 
            diode(d=3);

            color("red")
            translate(align_led_v + [6, 152, 0]) 
            diode(d=2);


            color("grey")
            cube(size=[40,160,1]);
            
            color("beige")
            translate([7, 0, -10])
            cube(size=[35, 160, 1]);
        }
        color("grey")
        rotate([0,0,a1])
        cube(size=[40,1,160]);
    }
}
plaque_interrupteurs(70);

module block_interrupteur_ogma() {
    // Première bague
    color("white")
    bague_pleine(96, 15);
    
    // Deuxième bague
    color("white")
    translate([0,0,longueur_block-15])
    bague_pleine(96, 15);
    
    // plaque centrale
    color("white")
    translate([-96/2,0,15])
    cube(size=[96,epaisseur_plaque_centrale,longueur_block-15*2]);
    
    // Tube ressort
    translate([0,diametre_tube_ressort/2+epaisseur_plaque_centrale,15])
    tube(longueur_block-15*2, diametre_tube_ressort, 1, $fa=2);

    // Piles
    alignement_pile = [19,epaisseur_plaque_centrale,0];
    translate([0,0,35]) 
    for(i=[0:1:2]){
        translate([0,0,i*79]) 
        union(){
            // Pile
            translate(alignement_pile + [0,0,30]) 
            pile_9V();
            // equerre basse pour caller les piles
            color("grey")
            translate([diametre_tube_ressort/2,epaisseur_plaque_centrale,30])
            rotate([0,90,0])
            equerre(15,15,20,1.5);
            // equerre haute pour caller les piles
            color("grey")
            translate([diametre_tube_ressort/2+20,epaisseur_plaque_centrale,78])
            rotate([0,-90,0])
            equerre(15,15,20,1.5);
        }
    }

    // Arduino
    translate([30,-10,longueur_block-65-5])
    rotate([90,0,0])
    rotate([0,0,180])
    arduino_uno();

    // Sequenceur
    translate([0,0,42])
    rotate([90,0,0])
    sequenceur_1();

    // Plaque interrupteurs
    angle_switch=50;
    translate([-35, 0, 115])
    rotate([0,0,0])
    plaque_interrupteurs(60);
}

// block_interrupteur_ogma();
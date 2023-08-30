
// <img src="https://raw.githubusercontent.com/Acelspace-Projects/Acelspace/main/OpenSCAD/library/meca-comps/aileron.png">

module aileron(m, n, E, p, epaisseur) {
    CubePoints = [
        [  0,       0,         0 ], //0
        [  E, m-(p+n),         0 ], //1
        [  E,     m-p,         0 ], //2
        [  0,       m,         0 ], //3
        [  0,       0, epaisseur ], //4
        [  E, m-(p+n), epaisseur ], //5
        [  E,     m-p, epaisseur ], //6
        [  0,       m, epaisseur ]  //7
    ];
    
    CubeFaces = [
        [0,1,2,3], // bottom
        [4,5,1,0], // front
        [7,6,5,4], // top
        [5,6,2,1], // right
        [6,7,3,2], // back
        [7,4,0,3]  // left
    ];
    
    translate([0,epaisseur/2,0]) rotate(a=[90,0,0]) color("grey") polyhedron( CubePoints, CubeFaces );
}

// <img src="https://raw.githubusercontent.com/Acelspace-Projects/Acelspace/main/OpenSCAD/library/meca-comps/bague_creuse.png">

module bague_creuse(diametre_externe, diametre_interieur, epaisseur) {
    assert(diametre_externe > diametre_interieur, "Le diametre extérieur doit être plus grand que diametre intérieur")
    difference() {
        cylinder(h=epaisseur, d=diametre_externe);
        translate([0,0,-1]) cylinder(h=epaisseur+2, d=diametre_interieur);
    }
}

// <img src="https://raw.githubusercontent.com/Acelspace-Projects/Acelspace/main/OpenSCAD/library/meca-comps/bague_de_poussee.png">

module bague_de_poussee(
    diametre_exterieur,
    diametre_intermediaire,
    diametre_interieur,
    epaisseur_exterieure,
    epaisseur_interieure
) {
    union() {
        bague_creuse(diametre_exterieur, diametre_interieur, epaisseur_exterieure, $fn=50);
        bague_creuse(diametre_intermediaire, diametre_interieur, epaisseur_interieure, $fn=50);
    }
}

// <img src="https://raw.githubusercontent.com/Acelspace-Projects/Acelspace/main/OpenSCAD/library/meca-comps/bague_pleine.png">

module bague_pleine(diametre, epaisseur) {
    cylinder(h=epaisseur, d=diametre);
}

// <img src="https://raw.githubusercontent.com/Acelspace-Projects/Acelspace/main/OpenSCAD/library/meca-comps/equerre.png">

module equerre(h1, h2, l, e){
    union() {
        cube(size=[h1,e,l]);
        cube(size=[e,h2,l]);
    }
}

// <img src="https://raw.githubusercontent.com/Acelspace-Projects/Acelspace/main/OpenSCAD/library/meca-comps/guide_rampe.png">

module guide_rampe() {
    rotate([-90,0,0]) color("grey") union() {
        cylinder(d= 7, h=13);
        cylinder(d=12, h= 5);
        translate([0,0,10]) cylinder(d=12, h=3);
    }
}

// <img src="https://raw.githubusercontent.com/Acelspace-Projects/Acelspace/main/OpenSCAD/library/meca-comps/ogive.png">

module ogive(hauteur, diametre, epaisseur) {
    difference() {
        ogive_pleine(hauteur, diametre);
        translate([0,0,-1 ]) ogive_pleine(hauteur-epaisseur+1, diametre-epaisseur);
    }
}

// <img src="https://raw.githubusercontent.com/Acelspace-Projects/Acelspace/main/OpenSCAD/library/meca-comps/ogive_pleine.png">

module ogive_pleine(hauteur, diametre) {
    h_o = hauteur;
    d_o = diametre;
    r_o = d_o/2;

    rotate_extrude(angle=360, convexity=2)
    rotate(a=[0,0,90]) 
    intersection() {
        square([h_o,r_o]);
        resize([2*h_o, 0, 0]) circle(r_o, $fn=100);
    }
}

// <img src="https://raw.githubusercontent.com/Acelspace-Projects/Acelspace/main/OpenSCAD/library/meca-comps/ressort.png">

module ressort(diametre=10, section=1, hauteur=20, nb_spire=10){
    //
    // Mendel90
    //
    // GNU GPL v2
    // nop.head@gmail.com
    // hydraraptor.blogspot.com
    //
    // Springs
    //

    extruder_spring = [ 7,    1, 10, 5];
    hob_spring      = [12, 0.75, 10, 6];

    function spring_od(type)     = type[0];
    function spring_gauge(type)  = type[1];
    function spring_length(type) = type[2];
    function spring_coils(type)  = type[3];

    // taken from openscad example 20
    module coil(r1 = 100, r2 = 10, h = 100, twists)
    {
        hr = h / (twists * 2);
        stepsize = 1/16;
        module segment(i1, i2) {
            alpha1 = i1 * 360*r2/hr;
            alpha2 = i2 * 360*r2/hr;
            len1 = sin(acos(i1*2-1))*r2;
            len2 = sin(acos(i2*2-1))*r2;
            if (len1 < 0.01)
                polygon([
                    [ cos(alpha1)*r1, sin(alpha1)*r1 ],
                    [ cos(alpha2)*(r1-len2), sin(alpha2)*(r1-len2) ],
                    [ cos(alpha2)*(r1+len2), sin(alpha2)*(r1+len2) ]
                ]);
            if (len2 < 0.01)
                polygon([
                    [ cos(alpha1)*(r1+len1), sin(alpha1)*(r1+len1) ],
                    [ cos(alpha1)*(r1-len1), sin(alpha1)*(r1-len1) ],
                    [ cos(alpha2)*r1, sin(alpha2)*r1 ],
                ]);
            if (len1 >= 0.01 && len2 >= 0.01)
                polygon([
                    [ cos(alpha1)*(r1+len1), sin(alpha1)*(r1+len1) ],
                    [ cos(alpha1)*(r1-len1), sin(alpha1)*(r1-len1) ],
                    [ cos(alpha2)*(r1-len2), sin(alpha2)*(r1-len2) ],
                    [ cos(alpha2)*(r1+len2), sin(alpha2)*(r1+len2) ]
                ]);
        }
        linear_extrude(height = h, twist = 180*h/hr,
                $fn = (hr/r2)/stepsize, convexity = 5) {
            for (i = [ stepsize : stepsize : 1+stepsize/2 ])
                segment(i-stepsize, min(i, 1));
        }
    }

    module comp_spring(type, l = 0) {
        l = (l == 0) ? spring_length(type) : l;

        coil(r1 = (spring_od(type) - spring_gauge(type)) / 2, r2 = spring_gauge(type) / 2, h = l, twists = spring_coils(type));

        if($children)
            translate([0, 0, l])
                children();
    }
    
    color("grey")
    comp_spring([diametre, section, hauteur, nb_spire]);
}

// Retenue propu

module retenuePropu(L=15, l=12.5) {
    rotate([180,0,0]) 
    translate([25,0,2]) {
        // plaque epaisse - 5mm
        color("lightgrey") 
        translate([L/2+2.5,0,2.5]) 
        cube([L, l, 5],true);
        // plaque U - 4mm
        color("grey") 
        difference() {
            translate([L/2+2.5,0,7]) 
            cube([L, l, 4],true);
            translate([8,0,7.5]) 
            cube([12, 5, 6],true);
        }
        // pene
        color("dimgray") 
        translate([0,0,7]) 
        difference() {
            translate([5,0,0]) 
            cube([12, 4, 4],true);
            translate([-1,0,1]) 
            rotate([0,45,0]) 
            cube([5, 5, 10],true);
        }
        // plaque dessus - 1mm
        color("lightgrey")
        difference() {
            translate([L/2+2.5,0,9.5]) 
            cube([L, l, 1],true);
            translate([9,0,9.5]) 
            cube([7, 2.5, 2],true);
        }
        // vis
        color("grey") 
        translate([L/2+2.5,0,9])
        cylinder(h=5,d=2);
    }
}

// <img src="https://raw.githubusercontent.com/Acelspace-Projects/Acelspace/main/OpenSCAD/library/meca-comps/tube.png">

module tube(hauteur, diametre, epaisseur) {
    difference() {
        cylinder(h=hauteur, d=diametre);
        translate([0,0,-1]) cylinder(h=hauteur+2, d=diametre-epaisseur*2);
    }
}

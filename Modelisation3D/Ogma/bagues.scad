module bague_pleine(diametre, epaisseur) {
    cylinder(h=epaisseur, d=diametre, $fn=100);
}

module bague_creuse(d_e, d_i, epaisseur) {
    assert(d_e > d_i, "diametre extérieur doit être plus grand que diametre intérieur")
    difference() {
        cylinder(h=epaisseur, d=d_e);
        translate([0,0,-1]) cylinder(h=epaisseur+2, d=d_i);
    }
}

module bague_creuse_2(d_e, d_i, dec, epaisseur) {
    assert(d_e > d_i, "diametre extérieur doit être plus grand que diametre intérieur")
    difference() {
        cylinder(h=epaisseur, d=d_e);
        translate([dec,0,-1]) cylinder(h=epaisseur+2, d=d_i);
    }
}
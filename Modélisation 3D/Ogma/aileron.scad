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
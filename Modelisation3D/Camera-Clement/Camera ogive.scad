//corps de la fusée 
translate([300,0,0])
cylinder(h = 2000, r1 = 100, r2 = 100, center = false);
//ogive
x=350;
translate([300,0,2000]){
    for ( i = [0 : 0.01 : 10] ){
        translate([0,0,i*35]) cylinder(10,100-(i^2),100-(i^2));
}}
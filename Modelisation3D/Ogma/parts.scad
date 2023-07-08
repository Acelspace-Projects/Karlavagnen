//      ______
//    /|      |
//   / |      | l
//  /  |      |
//  |  | _____|
//  |  /   h2
//  | /h1
//  |/
// 
// 
// 
// 
module equerre(h1, h2, l, e){
    cube(size=[h1,e,l]);
    cube(size=[e,h2,l]);
}
// equerre(20,25,20,2);
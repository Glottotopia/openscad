anstellwinkel = 30;
mdfwidth=3;
saegezahntiefe = mdfwidth;
saegezahnbreite = 5*mdfwidth;
epsilon = 0.001;

module dent(){
    scale([.99,.99,.99])
    square([mdfwidth,3*mdfwidth]);
}
    
module dreieck(){
        translate([0,0,20])
//            linear_extrude(3)
                difference(){
                    scale([2,1,0])
                        circle(d=120, $fn=3);
                    translate([-50,45,0])
                        rotate([0,0,anstellwinkel])
                            dent();
                }
}



module saegezahnstrahl(length=250,offset=0){
    difference(){
        square([mdfwidth*1.5,length]);
        for (i=[0:length/saegezahnbreite]){
            translate([0,offset*saegezahnbreite+i*saegezahnbreite*2-epsilon])
                square([saegezahntiefe*1.5+epsilon*2,saegezahnbreite+epsilon*2]);
        }
    }
}

module pseudostrahl(length=250,offset=0){
//    difference(){
        square([epsilon,length]);
//        for (i=[0:length/saegezahnbreite]){
//            translate([0,offset*saegezahnbreite+i*saegezahnbreite*2-epsilon])
//                square([saegezahntiefe+epsilon*2,saegezahnbreite+epsilon*2]);
//        }
//    }
}

module saegezahndreieck(){
    //    basis
//        linear_extrude(mdfwidth)
    {
            rotate([0,0,-15]){
                difference(){
                    union(){
                        hull(){
                            pseudostrahl();
                            rotate([0,0,30])
                                mirror([1,0,0])
                                    pseudostrahl(offset=1); 
                         }
                    //     zaehne
                        saegezahnstrahl();
                        rotate([0,0,30])
                            mirror([1,0,0])
                                saegezahnstrahl(offset=1); 
                     }
                circle(d=32);
                translate([-7,49,0])
                 circle(d=5);
                translate([-19,46,0])
                 circle(d=5);
             }
         }
     }
 }
  
 
// anstellwinkel2=8.88;
//color("red",.5)
//rotate([anstellwinkel2,0,0]) 
//        saegezahndreieck();
//color("green",.5)
//    rotate([anstellwinkel2,240,0]) 
//        saegezahndreieck();
//color("blue",.5)
//    rotate([anstellwinkel2,120,0]) 
// linear_extrude(1)
 
 scale([.5,.5,.5])
 difference(){
        saegezahndreieck();
// color("orange")
//    linear_extrude(3)
        translate([40,220,0])
            rotate([0,0,170])
                scale([2,2,2])
                    import("diver3.svg");
//        translate([35,225,0])
//            rotate([0,0,175])
//                scale([2,2,2])
//                    import("diver2.svg");
//        translate([42,240,0])
//            rotate([0,0,175])
//                scale([2,2,2])
//                    import("diver1.svg");
 }

 


fieldwidth=40;
inner_fieldwidth=fieldwidth-.5;
innerst_fieldwidth=fieldwidth-2;
acrylwidth=6;
height=100;
resolution=200;

m8width=8.3;

module blackfield(){  
    difference(){
        square([inner_fieldwidth,inner_fieldwidth],center=true);
        square([innerst_fieldwidth,innerst_fieldwidth],center=true);
    }
}
module whitefield() {
    color("pink",.2)
    difference(){
        circle(d=inner_fieldwidth,$fn=resolution);
        circle(d=innerst_fieldwidth,$fn=resolution);
    }
}

module field (match=0){
        translate([-.5*fieldwidth,-.5*fieldwidth])  
//        linear_extrude(acrylwidth){
//            translate([-6,-6])
                difference(){
                    circle(30,$fn=resolution);
                    translate([.2,.2])
                        square(60,center=true);
                }
//            }
    for(i=[0:4]){   
        for(j=[0:4]){ 
            translate([i*fieldwidth,j*fieldwidth])
                if ((i+j)%2!=match){
                    color("blue",.2)
//                    linear_extrude(acrylwidth)
                    blackfield();
                }
                else{
                    color("pink",.2)
//                    linear_extrude(acrylwidth)
                    whitefield();
                }
        }
    }
//    color("green",.1)
//    linear_extrude(acrylwidth){
//        hull(){
//        translate([-.5*fieldwidth,-.5*fieldwidth])
//            circle(10,$fn=resolution);
//        translate([-.5*fieldwidth,4.5*fieldwidth])
//            circle(10,$fn=resolution);
//        translate([4.5*fieldwidth,-.5*fieldwidth])
//            circle(10,$fn=resolution);
//        translate([4.5*fieldwidth,4.5*fieldwidth])
//            circle(10,$fn=resolution);
//        }
//    }
//    color("green",.1)
//    linear_extrude(acrylwidth){ 
//        translate([-.5*fieldwidth,-.5*fieldwidth])
//            difference(){
//                circle(30,$fn=resolution);
//                translate([-12,-12])
//                    circle(d=m8width,$fn=resolution);
//            }
//        translate([-.5*fieldwidth,4.5*fieldwidth])
//            difference(){
//                circle(30,$fn=resolution);
//                translate([-12,12])
//                    circle(d=m8width,$fn=resolution);
//            }
//        translate([4.5*fieldwidth,-.5*fieldwidth])
//            difference(){
//                circle(30,$fn=resolution);
//                translate([12,-12])
//                    circle(d=m8width,$fn=resolution);
//            }
//        translate([4.5*fieldwidth,4.5*fieldwidth])
//            difference(){
//                circle(30,$fn=resolution);
//                translate([12,12])
//                    circle(d=m8width,$fn=resolution);
//            }
//    }
}

//for(i=[0:4]){
//    translate([0,0,(acrylwidth+height)*i])    
//            field(match=i%2);
//}


//translate([-32,-32])
//    cylinder(h=430,d=10);
//translate([5*fieldwidth-8,-32])
//    cylinder(h=430,d=10);
//translate([-32,5*fieldwidth-8])
//    cylinder(h=430,d=10);
//translate([5*fieldwidth-8,5*fieldwidth-8])
//    cylinder(h=430,d=10);
field();

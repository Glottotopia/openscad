//
//translate([0,0,1.5])
//color("red"){
//    linear_extrude(1.5)
//    difference(){
//    circle(d=85,$fn=6);
//    circle(d=80,$fn=6);
//    }
//    for (i=[0:5])
//    rotate([0,0,30+i*60])
//        translate([0,40,-1])
//            cylinder(h=2,r=1,$fn=20);
//} 
color("blue",.5)
difference(){    
linear_extrude(1.5)
    circle(d=85,$fn=6);
    for (i=[0:5])
    rotate([0,0,30+i*60])
        translate([0,40,.5])
            cylinder(h=2,r=1,$fn=20);
}
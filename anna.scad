cube(1);
translate([0,0,30])
{
a(d=20,a=45,t="A");
a(d=20,a=15,t="N");
a(d=20,a=-15,t="N");
a(d=20,a=-45,t="A");
}
//rotate([0,0,-5])
//a();
//rotate([0,0,5])
//a();
//rotate([0,0,15])
//a();

//{
//    rotate([90,0,-40])
//    translate([-15,10,0])
//
//    rotate([90,0,-20])
//    translate([-5,10,0])
//    linear_extrude(height=3)
//        text("N");
//    rotate([90,0,0])
//    translate([5,10,0])
//    linear_extrude(height=3)
//        text("N");
//    rotate([90,0,0])
//    translate([15,10,0])
//    linear_extrude(height=3)
//        text("A");
//}

module a(d=1,a=0,t=""){ 
   rotate([0,0,a])
   translate([d,0,0])
   rotate([90,0,100])
   linear_extrude(height=3)
   text(t); 
}
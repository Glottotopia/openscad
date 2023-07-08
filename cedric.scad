translate([0,0,2])
difference(){
        cylinder(h=18,d=24,$fn=100);
        cylinder(h=20.1,d=20,$fn=100);
    }
    
translate([0,0,18])
difference(){
        cylinder(h=2,d=30,$fn=100);
        cylinder(h=20.1,d=20,$fn=100);
    }
//translate([0,0,2]);
//    cylinder(h=18,d=20,$fn=100);

difference(){
    cylinder(h=2,d=30,$fn=100);
    translate([0,0,-1])
        cylinder(h=30,d=2,$fn=100);
}

    
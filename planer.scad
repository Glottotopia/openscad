module stl(){ 
    difference(){
    import("planer.stl");
    translate([40,60,60])
        rotate([60,0,0])
            cylinder(h=10,d=3,$fn=20);
    }
    }
//lid();
//slot();

difference(){
    stl();   
    translate([10,80,1.7])
    rotate([-90,0,0])
    {
    sphere(d=6);
    cylinder(d=4,h=6);
        } 
    translate([70,80,1.7])
    rotate([-90,0,0])
    {
    sphere(d=6);
    cylinder(d=4,h=6);
        }
}
translate([7,-22,10])
linear_extrude(1){
    text("    xHain",font="Linux Biolinum O");
}


translate([7,-35,10])
linear_extrude(1){
    text("Hobelhöhle",font="Linux Biolinum O");
}

color("red")
translate([0,-10,0])
cube([80,10,1.5]);

module einschub(){
    cube([70,104,3]);
}


module leiste(){
    cube([5,110,5]);
}

color("blue")
translate([5,2,2])
rotate([45,0,0])
einschub();

difference(){
   union(){
        translate([5,4,-3])
            rotate([45,0,0])
                leiste(); 
       
        translate([70,4,-3])
            rotate([45,0,0])
                leiste();
       
    translate([40,80,72.8])
        difference(){
            cube([70,10,3],center=true);
            cube([40,6,4],center=true);
        }
    translate([40,86,58.5])
        rotate([88,0,0])
            cube([70,32,3],center=true);
        }
        translate([0,0,-10])
            cube([1000,1000,10]);
        translate([0,0,74.5])
            cube([1000,1000,10]);
}




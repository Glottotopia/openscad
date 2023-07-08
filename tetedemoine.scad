module head(){    
    scale([.36,.36,.36])
        translate([0,0,-45])
            completed_head();         
}

module completed_head(){
    base_head();
    hull(){
        intersection(){
            base_head();
            color("red")
                translate([-15,35,135]) 
                    rotate([100,0,22])
                        cylinder(h=8,d=100);
        }
    }
}

module base_head(){
   intersection(){
        translate([-112,-114])
        import("priest.stl");
            translate([0,-10,50])
                cylinder(d=130,h=200);
    } 
}


difference(){ 
    union(){
        head();  
        hull(){
            intersection(){ 
                head();  
                translate([0,0,2])
                    cylinder(h=.1,d=60);
            }  
            translate([0,0,-10])  
                sphere(5,$fn=100)    ;
        }
    }
    translate([0,0,-18])
        cylinder(h=40,d=8.2,$fn=100);
}


    
    

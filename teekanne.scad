wandstaerke=3;
basisgroesse=170;
flaechen = 8;
scheibenhoehe=.1;
epsilon = .001;
tuellenstaerke=2;

module kanne(){
difference(){
scale([1,.8,0.5])
    rotate([0,0,360/(2*flaechen)])
    difference(){
        minkowski(){
            sphere(d=basisgroesse, $fn=flaechen);
            sphere(d=wandstaerke*2);
        }        
        minkowski(){
            sphere(d=basisgroesse-50, $fn=flaechen);
            sphere(d=40,$fn=100);
        }
    }     
    translate([0,0,15])
    cylinder(d=53,h=120);
    translate([35,0,15])
    cylinder(d=8,h=120);
    translate([-35,0,15])
    cylinder(d=8,h=120);
}
}

module ring(d,fn,hollow=true){
    if (hollow){
        difference(){
            cylinder(h=scheibenhoehe,d=d,$fn=fn);
            translate([0,0,-epsilon])
                cylinder(h=scheibenhoehe+2*epsilon,d=d-tuellenstaerke*2,$fn=fn);
            }
        }
    else{ 
        cylinder(h=scheibenhoehe,d=d,$fn=fn);
    }
}

//ring(24);

module tuelle(hollow=true){
    for (i=[0:700]){
        translate([0,0,i/10])
            rotate([0,i/20,i/100])
            scale([1,1,.95])
            ring(30-i/40,floor(84-i/10),hollow=hollow);
    }
}

difference(){
    kanne();
    translate([-50,0,0])
        rotate([0,-55,0]) 
            cylinder(d1=30-2,d2=30-750/40,h=75,$fn=100);
}
    
difference(){
    translate([-50,0,0])
        rotate([0,-55,0])
            color("red")
            tuelle();
            scale([1,.8,0.5])
                rotate([0,0,360/(2*flaechen)])
                    difference(){    
                        minkowski(){
                            sphere(d=basisgroesse-50, $fn=flaechen);
                            sphere(d=40,$fn=100);
                        }    
        }     
}

//color("blue")
//    translate([100,0,40])
//        rotate([90,55,0])
//            rotate_extrude(angle=200,$fn=100)
//                translate([50,0,0])
//                    scale([.8,2])
//                        circle(d=13);
            
        



wandstaerke=2;
basisgroesse=170;
flaechen = 8;
scheibenhoehe=.1;
epsilon = .001;
tuellenstaerke=2;
tuellenwinkel=-70;
tuellenlaenge = 140;

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
//    translate([35,0,15])
//    cylinder(d=8,h=120);
//    translate([-35,0,15])
//    cylinder(d=8,h=120);
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
    difference(){
            cylinder(d1=30,d2=8,h=tuellenlaenge,$fn=100);
            translate([0,0,-epsilon])
            cylinder(d1=30-wandstaerke,d2=8-wandstaerke,h=tuellenlaenge+2*epsilon,$fn=100);
    }
}

difference(){
    kanne();
    translate([-50,0,0])
        rotate([0,tuellenwinkel,0]) 
            cylinder(d1=30-2,d2=30-750/40,h=75,$fn=100);
}
    
difference(){
    translate([-50,0,0])
        rotate([0,tuellenwinkel,0])
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
        translate([-185,-25,40])
        cube([100,100,50]);
}

translate([80,0,11])
    rotate([90,0,0])
        rotate_extrude(angle=360)
            translate([40,0,0])
                rotate([0,0,360/16])
                    circle(d=25,$fn=8);

//translate([0,0,-142])
//cube([200,200,200],center=true);


//color("blue")
//    translate([100,0,40])
//        rotate([90,55,0])
//            rotate_extrude(angle=200,$fn=100)
//                translate([50,0,0])
//                    scale([.8,2])
//                        circle(d=13);
            
        



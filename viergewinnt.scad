//TODO check all joints

mdfwidth = 3;
diameter = 30;
columns = 7;
rows = 6;
querspiel = 15;
hochspiel = 0;
discspiel = .5;
zwischenspiel = 3.5;
plattenhoehe = rows*diameter;
plattenbreite = columns*diameter+(columns-1)*zwischenspiel+2*querspiel;
wannenbreite = 120;
fallhoehe = 1.5*diameter;
stopperbreite = 16;
stopperspiel = 8;
stopperlaenge = plattenbreite + 2 * stopperspiel;
randhoehe = 20;

module disc(){
    linear_extrude(mdfwidth) 
        circle(d=diameter);
}

module disc1(){ 
//    color("red")
//        linear_extrude(mdfwidth)  
            difference(){
                circle(d=diameter);
                difference(){
                    circle(d=diameter/2);
                    circle(d=diameter/1.9,$fn=4);                    
                }
                circle(d=diameter/6,$fn=8);
            }
}


module disc2(){
//    color("yellow")
//        linear_extrude(mdfwidth) 
        union(){
            difference(){
                circle(d=diameter);
                circle(d=diameter/1.2,$fn=3);
                rotate([0,0,60])
                circle(d=diameter/1.2,$fn=3);
            }
            circle(d=diameter/1.8);
        }
}

module minicircle(){ 
        circle(d=diameter/1.5);
}
  

module blade(){
//    linear_extrude(mdfwidth)
        translate([0,-querspiel,0]){
        difference(){
            square([plattenhoehe,plattenbreite]);  
            translate([mdfwidth,0,0])
                square([plattenhoehe-2*mdfwidth,mdfwidth]);
            translate([mdfwidth,plattenbreite-mdfwidth,0]) 
                    square([plattenhoehe-2*mdfwidth,mdfwidth]);
            for (i=[0:rows-1]){
                for (j=[0:columns-1]){ 
                    translate([(i+.5)*diameter,(j+.5)*diameter+j*zwischenspiel,0])   
                    translate([0,querspiel,0])
                        minicircle();   
                }
            }
            for (j=[0:columns]){ 
                translate([0,(j+.5)*diameter+(j-1)*zwischenspiel,0]) 
                    square([mdfwidth,mdfwidth]);
                translate([plattenhoehe-mdfwidth,(j+.5)*diameter+(j-1)*zwischenspiel,0]) 
                    square([mdfwidth,mdfwidth]);
            }
        }
    }
}
    
 
module discset(){
    for (i=[0:rows-1]){
        for (j=[0:columns-1]){ 
            single_rand = rands(0,10,1)[0]; 
            translate([(i+.5)*diameter,(j+.5)*diameter+j*zwischenspiel,0])            
            if (single_rand > 5){
                    disc1();
            }
            else{
                    disc2();
            }
        }
    }
}


module abstandhalterset(){ 
        for (j=[0:columns]){  
            translate([0,(j)*diameter+j*zwischenspiel-zwischenspiel,0])            
                abstandhalter();
        }
}

module abstandhalter(){
    rotate([0,90,90])
    linear_extrude(mdfwidth)
        translate([-mdfwidth/2,-.5*plattenhoehe,0])
            difference(){
            square([mdfwidth*3+2*discspiel,plattenhoehe],center=true);
            translate([mdfwidth+discspiel,0,0])
                square([mdfwidth*1.2,plattenhoehe-2*mdfwidth],center=true);   
            translate([-mdfwidth-discspiel,0,0])
                square([mdfwidth*1.2,plattenhoehe-2*mdfwidth],center=true);                
            }
}

module wanne(){
    color("blue")
    translate([-fallhoehe+mdfwidth,0,(mdfwidth/2-discspiel/2)-wannenbreite/2])
    rotate([0,-90,0])
//    linear_extrude(mdfwidth)
    translate([0,-querspiel,0])
        linear_extrude(mdfwidth)
            square([wannenbreite,plattenbreite]);
}


module wannenbegrenzung(){
    translate([-fallhoehe,-querspiel,0])
    square([randhoehe,plattenbreite]);
}

module stopper(){ 
    color("blue")
    translate([0,-stopperspiel,(mdfwidth/2-discspiel/2)-stopperbreite/2])
    rotate([0,-90,0]) 
    translate([0,-querspiel,0])
    linear_extrude(mdfwidth)
        square([stopperbreite,stopperlaenge]);
}

module staender(){
    translate([-fallhoehe,0,-wannenbreite/2])
        rotate([90,0,0])
            linear_extrude(mdfwidth)
                difference(){
                square([fallhoehe+plattenhoehe,wannenbreite]);  
//                    Löcher
                translate([fallhoehe,wannenbreite/2-mdfwidth,0])                  
                    square([mdfwidth,mdfwidth]);
                translate([fallhoehe,wannenbreite/2+mdfwidth,0])                  
                    square([mdfwidth,mdfwidth]);
                translate([fallhoehe+plattenhoehe-mdfwidth,wannenbreite/2-mdfwidth,0])                  
                    square([mdfwidth,mdfwidth]);
                translate([fallhoehe+plattenhoehe-mdfwidth,wannenbreite/2+mdfwidth,0])                  
                    square([mdfwidth,mdfwidth]);
//                    stopperschlitz
                translate([fallhoehe-mdfwidth,wannenbreite/2-stopperbreite/2+discspiel*2,0])                
                    square([mdfwidth,stopperbreite]);
                    
                translate([randhoehe,0,0])
                    rotate([180,0,10])
                        square([1.3*fallhoehe+plattenhoehe,wannenbreite]);
                translate([randhoehe,wannenbreite,0])
                    mirror([0,10,0])
                        rotate([180,0,10])
                            square([1.3*fallhoehe+plattenhoehe,wannenbreite]); 
                }
    }

//discset();
//abstandhalterset();
//translate([0,,0,-mdfwidth/2+.5*discspiel])
//wanne();
//    
//translate([0,,0,wannenbreite/2])
//wannenbegrenzung();
//translate([0,,0,-wannenbreite/2])
//wannenbegrenzung();
//    
//stopper();
//     
//translate([0,-querspiel+mdfwidth,0])
//    staender(); 
//    
//translate([0,plattenbreite-querspiel,0])
//    staender();    

translate([0,0,mdfwidth+discspiel])
    color("brown",.7)
    blade();
//translate([0,0,-(mdfwidth+discspiel)])
//    color("brown",.7)
//    blade();

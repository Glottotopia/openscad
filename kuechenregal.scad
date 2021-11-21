jarwidth=90;
jarbottomwidth=60;
jarheight=70;
mdfwidth=3;
spiel=2;
schlitzwidth=30;

module jar(){
    color("beige",.7)
    translate([jarwidth/2,jarwidth/2])
    cylinder($fn=20,h=jarheight, r1=jarbottomwidth/2, r2=jarwidth/2);
}

module jarrow(){
    for (i=[0:3]){
        translate([i*2*jarwidth+i*mdfwidth,0,0])
            jar();
        translate([i*2*jarwidth+i*mdfwidth+jarwidth,0,0])
            jar();
    }
}

module brett(length){   
    color("#aa8800")
    square([length,jarwidth]);
}

module hbrett(length){
    linear_extrude(mdfwidth)
        brett(length);
}

module hbrett_long_left(){
    linear_extrude(mdfwidth)
    union(){
        difference(){    
            brett(4*jarwidth+mdfwidth); 
            translate([jarwidth*2,10])    
                square([mdfwidth,schlitzwidth]); 
            translate([jarwidth*2,jarwidth-10-schlitzwidth])       
                square([mdfwidth,schlitzwidth]);
        }
        translate([-mdfwidth,jarwidth/2-schlitzwidth/2])
            square([mdfwidth,schlitzwidth]);  
       translate([0,schlitzwidth/2-1.5*mdfwidth]){
        difference(){
            translate([-2*mdfwidth,jarwidth/2-schlitzwidth/2])
                square([mdfwidth,3*mdfwidth]);   
            translate([-2*mdfwidth,jarwidth/2-schlitzwidth/2+mdfwidth])
                square([mdfwidth,mdfwidth]);       
        }
        translate([-3*mdfwidth,jarwidth/2-schlitzwidth/2])
            square([mdfwidth,3*mdfwidth]); 
       }    
//        
        translate([4*jarwidth+mdfwidth,0])
            square([mdfwidth,schlitzwidth/2]); 
        translate([4*jarwidth+mdfwidth,jarwidth-schlitzwidth/2])
            square([mdfwidth,schlitzwidth/2]);  
    }
}


module hbrett_long_right(){
    linear_extrude(mdfwidth)
    union(){
        difference(){    
            brett(4*jarwidth+mdfwidth); 
            translate([jarwidth*2,10])    
                square([mdfwidth,schlitzwidth]); 
            translate([jarwidth*2,jarwidth-10-schlitzwidth])       
                square([mdfwidth,schlitzwidth]);
        }
        translate([4*jarwidth+mdfwidth,jarwidth/2-schlitzwidth/2])
            square([mdfwidth,schlitzwidth]); 
        translate([-mdfwidth,jarwidth/2+schlitzwidth/2])
            square([mdfwidth,schlitzwidth/2]); 
        translate([-mdfwidth,schlitzwidth/2])
            square([mdfwidth,schlitzwidth/2]);        
//        
   translate([0,schlitzwidth/2-1.5*mdfwidth]){
        difference(){
            translate([4*jarwidth+2*mdfwidth,jarwidth/2-schlitzwidth/2])
                square([mdfwidth,3*mdfwidth]);   
            translate([4*jarwidth+2*mdfwidth,jarwidth/2-schlitzwidth/2+mdfwidth])
                square([mdfwidth,mdfwidth]);       
        }
        translate([4*jarwidth+3*mdfwidth,jarwidth/2-schlitzwidth/2])
            square([mdfwidth,3*mdfwidth]); 
       }  
    }
}


module hbrett_kurz(){
    linear_extrude(mdfwidth)
    union(){    
        brett(2*jarwidth); 
        translate([2*jarwidth,jarwidth/2-schlitzwidth/2])
            square([mdfwidth,schlitzwidth]);
        translate([-mdfwidth,jarwidth/2-schlitzwidth/2])
            square([mdfwidth,schlitzwidth]);
        translate([0,schlitzwidth/2-1.5*mdfwidth]){
            difference(){
                translate([-2*mdfwidth,jarwidth/2-schlitzwidth/2])
                    square([mdfwidth,3*mdfwidth]);   
                translate([-2*mdfwidth,jarwidth/2-schlitzwidth/2+mdfwidth])
                    square([mdfwidth,mdfwidth]);       
            }
            translate([-3*mdfwidth,jarwidth/2-schlitzwidth/2])
                square([mdfwidth,3*mdfwidth]); 
           }  
        }    
}
    
module hbrett_middle(){
    linear_extrude(mdfwidth)
    union(){
        difference(){    
            brett(4*jarwidth+mdfwidth); 
            translate([jarwidth*2,jarwidth/2-schlitzwidth/2])    
                square([mdfwidth,schlitzwidth]);  
            }
            translate([-mdfwidth,0])
                square([mdfwidth,schlitzwidth/2]); 
            translate([-mdfwidth,jarwidth-schlitzwidth/2])
                square([mdfwidth,schlitzwidth/2]); 
            translate([4*jarwidth+mdfwidth,0])
                square([mdfwidth,schlitzwidth/2]); 
            translate([4*jarwidth+mdfwidth,jarwidth-schlitzwidth/2])
                square([mdfwidth,schlitzwidth/2]);          
        }
}


module vbrett_aussen(){   
color("yellow",.2)    
rotate([0,-90,0])
linear_extrude(mdfwidth)
    difference(){    
    brett(5*jarheight+2*mdfwidth+2*spiel); 
    translate([jarheight*2+spiel,jarwidth/2-schlitzwidth/2])    
        square([mdfwidth,schlitzwidth]);
    translate([jarheight*4+spiel*2+mdfwidth,jarwidth/2-schlitzwidth/2])    
        square([mdfwidth,schlitzwidth]);
    }
}


module vbrett_mitte(){   
rotate([0,-90,0])
linear_extrude(mdfwidth)
    difference(){   
    brett(4*jarheight+2*mdfwidth+2*spiel);
    translate([jarheight*2+spiel,jarwidth/2-schlitzwidth/2])    
        square([mdfwidth,schlitzwidth]);
    translate([jarheight*4+spiel*2+mdfwidth,0])    
        square([mdfwidth,schlitzwidth]);
    translate([jarheight*4+spiel*2+mdfwidth,jarwidth-schlitzwidth])    
        square([mdfwidth,schlitzwidth]);
    }
}


module vbrett_innen(){   
rotate([0,-90,0])
linear_extrude(mdfwidth)
    brett(jarheight*2+spiel);
}


module vbrett_innen_bottom(){   
rotate([0,-90,0])
linear_extrude(mdfwidth)
    union(){
        brett(jarheight*2+spiel);
        translate([jarheight*2+spiel,10])
            square([mdfwidth,schlitzwidth]);
    }
}

module vbrett_innen_mitte(){   
rotate([0,-90,0])
linear_extrude(mdfwidth)
    union(){
        brett(jarheight*2+spiel);
        translate([-mdfwidth,jarwidth/2+schlitzwidth/2-10])
            square([mdfwidth,schlitzwidth]);
        translate([jarheight*2+spiel,jarwidth/2+schlitzwidth/2])
            square([mdfwidth,schlitzwidth/2]);   
        translate([jarheight*2+spiel,schlitzwidth/2])
            square([mdfwidth,schlitzwidth/2]);        
    }    
}



module joint(){
    color("white")
        difference(){
                union(){
                        cube([mdfwidth*3,jarwidth+2,mdfwidth*3]); 
                    translate([4.5,1,4.5])
                sphere(3,$fn=60);
                    }
                translate([-10,1,mdfwidth])
                cube([100,jarwidth,mdfwidth]);
                translate([mdfwidth*2,1,-10])
                rotate([0,-90,0])
                cube([100,jarwidth,mdfwidth]);
    }
}


module joint2(){
    color("white")
    difference(){
        union(){
            joint();
            translate([0.5,jarwidth/2+1,1.5*mdfwidth])
                sphere(6,center=true);
        }
        translate([-mdfwidth,1,mdfwidth])
            cube([100,jarwidth,mdfwidth]);
        translate([-.01,jarwidth/2-.5,-5])
            cube([mdfwidth+.1,mdfwidth+.1,20]);
        translate([mdfwidth*2,1,-10])
                rotate([0,-90,0])
                cube([100,jarwidth,mdfwidth]);
    }
}


module spiess(){
    translate([0,mdfwidth,0])
    rotate([90,0,0])
    linear_extrude(mdfwidth){
        square([mdfwidth,5*jarheight+2*mdfwidth+2*spiel]);
        }
}
    
//joint();



translate([0,0,0])    
    jarrow();
//translate([0,0,1*jarheight])    
//    jarrow();
//translate([0,0,2*jarheight+mdfwidth+spiel])    
//    jarrow();
//translate([0,0,3*jarheight+mdfwidth+spiel])    
//    jarrow(); 
//translate([0,0,4*jarheight+mdfwidth*2+spiel*2])    
//    jarrow();
// 
//translate([4*jarwidth+mdfwidth,0,0])
//{
//translate([0,0,0])    
//    jarrow();
//translate([0,0,1*jarheight])    
//    jarrow();
//translate([0,0,2*jarheight+mdfwidth+spiel])    
//    jarrow();
//translate([0,0,3*jarheight+mdfwidth+spiel])    
//    jarrow(); 
//translate([0,0,4*jarheight+mdfwidth*2+spiel*2])    
//    jarrow();
//}


color("black")
translate([-2*mdfwidth,jarwidth/2-mdfwidth/2,0])
spiess();

color("yellow",.6)
translate([0,0])
vbrett_aussen();

color("grey")
translate([0,0,2*jarheight+spiel])
    hbrett_long_left();

color("pink")    
translate([0,0,4*jarheight+spiel*2+mdfwidth])
    hbrett_kurz();
    
color("brown")    
translate([2*jarwidth+mdfwidth,0,4*jarheight+spiel*2+mdfwidth])
    hbrett_middle();

color("red")    
translate([2*jarwidth+mdfwidth,0,0])    
vbrett_innen_bottom();

color("green")    
translate([2*jarwidth+mdfwidth,0,jarheight*2+spiel+mdfwidth])    
vbrett_innen_mitte();


translate([mdfwidth+4*jarwidth+mdfwidth,0,0])    
vbrett_mitte();

color("grey")
translate([4*jarwidth+2*mdfwidth,0,2*jarheight+spiel])
    hbrett_long_right();

color("pink")    
translate([6*jarwidth+3*mdfwidth,0,4*jarheight+spiel*2+mdfwidth])
    hbrett_kurz(2*jarwidth);
//    
color("brown")    
translate([2*jarwidth,0,4*jarheight+spiel*2+mdfwidth])
    hbrett(4*jarwidth);


color("red")    
translate([mdfwidth*2+6*jarwidth+mdfwidth,0,0])    
vbrett_innen_bottom();

color("green")    
translate([mdfwidth*2+6*jarwidth+mdfwidth,0,jarheight*2+spiel+mdfwidth])    
vbrett_innen_mitte();


translate([8*jarwidth+4*mdfwidth,0,0])  
vbrett_aussen();

for(i=[0:4]){
    translate([-2*mdfwidth+2*i*jarwidth+i*mdfwidth,-1,2*jarheight-1])
    joint2();
    translate([-2*mdfwidth+2*i*jarwidth+i*mdfwidth,-1,4*jarheight+mdfwidth+spiel-1])
    joint();  
} 
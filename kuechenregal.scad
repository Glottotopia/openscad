jarwidth=90;
jarbottomwidth=60;
jarheight=70;
mdfwidth=3;
spiel=2;

module jar(){
    color("beige",.7)
    translate([jarwidth/2,jarwidth/2])
    cylinder($fn=20,h=jarheight, r1=jarbottomwidth/2, r2=jarwidth/2);
}

module jarrow(){
    for (i=[0:3]){
        translate([i*jarwidth,0,0])
            jar();
    }
}

module brett(length){   
    color("#aa8800")
linear_extrude(mdfwidth)
    square([length,jarwidth]);
}


module vbrett_aussen(){   
rotate([0,-90,0])
    brett(5*jarheight+2*mdfwidth+2*spiel);
}


module vbrett_mitte(){   
rotate([0,-90,0])
    brett(4*jarheight+2*mdfwidth+2*spiel);
}


module vbrett_innen(){   
rotate([0,-90,0])
    brett(jarheight*2+spiel);
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
    
//joint();


translate([0,0,0])    
    jarrow();
translate([0,0,1*jarheight])    
    jarrow();
translate([0,0,2*jarheight+mdfwidth+spiel])    
    jarrow();
translate([0,0,3*jarheight+mdfwidth+spiel])    
    jarrow(); 
translate([0,0,4*jarheight+mdfwidth*2+spiel*2])    
    jarrow();
 
translate([4*jarwidth+mdfwidth,0,0])
{
translate([0,0,0])    
    jarrow();
translate([0,0,1*jarheight])    
    jarrow();
translate([0,0,2*jarheight+mdfwidth+spiel])    
    jarrow();
translate([0,0,3*jarheight+mdfwidth+spiel])    
    jarrow(); 
translate([0,0,4*jarheight+mdfwidth*2+spiel*2])    
    jarrow();
}


vbrett_aussen();

color("black")
translate([0,0,2*jarheight+spiel])
    brett(4*jarwidth);

color("pink")    
translate([0,0,4*jarheight+spiel*2+mdfwidth])
    brett(2*jarwidth);
    
color("brown")    
translate([2*jarwidth,0,4*jarheight+spiel*2+mdfwidth])
    brett(4*jarwidth+mdfwidth);

color("red")    
translate([2*jarwidth,0,0])    
vbrett_innen();

color("green")    
translate([2*jarwidth,0,jarheight*2+spiel+mdfwidth])    
vbrett_innen();


translate([4*jarwidth,0,0])    
vbrett_mitte();

color("grey")
translate([4*jarwidth,0,2*jarheight+spiel])
    brett(4*jarwidth);

color("pink")    
translate([6*jarwidth,0,4*jarheight+spiel*2+mdfwidth])
    brett(2*jarwidth);
    
color("brown")    
translate([2*jarwidth,0,4*jarheight+spiel*2+mdfwidth])
    brett(4*jarwidth);


color("red")    
translate([6*jarwidth,0,0])    
vbrett_innen();

color("green")    
translate([6*jarwidth,0,jarheight*2+spiel+mdfwidth])    
vbrett_innen();


translate([8*jarwidth,0,0])  
vbrett_aussen();

for(i=[0:4]){
    translate([-mdfwidth*2+2*i*jarwidth,-1,2*jarheight])
    joint();
    translate([-mdfwidth*2+2*i*jarwidth,-1,4*jarheight+mdfwidth])
    joint();  
}
//
//    
//translate([-mdfwidth*2,-1,2*jarheight])
//joint();
//translate([-mdfwidth*2,-1,4*jarheight+mdfwidth])
//joint();    
////translate([-mdfwidth*2,-1,5*jarheight+mdfwidth])
////joint();
//    
//translate([-mdfwidth*2+2*jarwidth,-1,2*jarheight])
//joint();
//translate([-mdfwidth*2+2*jarwidth,-1,4*jarheight+mdfwidth])
//joint();    
////translate([-mdfwidth*2+2*jarwidth,-1,5*jarheight+mdfwidth])
////joint();
//        
//
//translate([-mdfwidth*2+4*jarwidth,-1,2*jarheight])
//joint();
//translate([-mdfwidth*2+4*jarwidth,-1,4*jarheight+mdfwidth])
//joint();    
////translate([-mdfwidth*2+4*jarwidth,-1,5*jarheight+mdfwidth])
////joint();
//                

spurweite=10; 
gleisdicke=2;
fluegelbreite=10;
fluegelhoehe=5;
fluegeldicke=1;
schwellenbreite=10;
schwellensafety=6;// Abstand zwischen Hakenansatz und erster Schwelle
rotationangle=80;
hakenrotationradius=5;
sechseckkantenlaenge=35;
sechseckhoehe=2*sqrt(sechseckkantenlaenge*sechseckkantenlaenge-(0.5*sechseckkantenlaenge)*(0.5*sechseckkantenlaenge));
fn=60;
plaettchenhoehe=10;

module prism(w,d,h,extraw=0){
//   polyhedron(
////           points=[[0,0,0], [0,0,h], [w,0,0], [0,d,0], [0,d,h], [w,d,0]],
////           faces=[[0,1,2],[3,4,5],[0,1,4,3],[1,2,5,4],[2,0,3,5]]
//           points=[
//                [0,0,0], [0,0,h], [extraw,0,h], [w,0,0],
//                [0,d,0], [0,d,h], [extraw,d,h], [w,d,0]
//            ],
//           faces=[[0,1,2,3],[4,5,6,7],
//                  [0,1,5,4],[1,2,6,5],[2,3,7,6],[3,4,0,7]]
//           );  
   polyhedron( 
           points=[
                [0,0,0], [0,0,h], [extraw,0,h], [w,0,0],
                [0,d,0], [0,d,h], [extraw,d,h], [w,d,0]
            ],
           faces=[[0,1,2,3],[4,5,6,7],
                  [0,1,5,4],[1,2,6,5],[2,3,7,6],[3,4,0,7]]
           ); 
    cube([w,d,h*.66]);
   }
       

module gleis(laenge, spurweite, extra_schwellen=0){
    schiene(laenge-hakenrotationradius);
    translate([0,spurweite, 0])
    schiene(laenge-hakenrotationradius);
    faecher=1+extra_schwellen; 
    schwellenoffset=(laenge-2*schwellensafety-10)/faecher;
    for (i=[0:faecher]){
        translate([schwellensafety+schwellenoffset*i-hakenrotationradius/2,0,0])
        schwelle(spurweite);
    }     
//    color("red")
//    translate([laenge-schwellensafety,0,0])
//    schwelle(spurweite);
    translate([-hakenrotationradius/2,0,0])
    fluegel();
//       
    translate([laenge-hakenrotationradius/2,0,0])//mirrored on y axis, hence safety offset already included
    mirror([1,0,0])
    fluegel();
//     
    translate([-hakenrotationradius/2,spurweite,0])
    mirror([0,1,0])
    fluegel();
//    
    translate([laenge-hakenrotationradius/2,spurweite,0])
    mirror([1,0,0])
    mirror([0,1,0])
    fluegel();
}

module schiene(laenge, radius=gleisdicke/2){
    stange(laenge,radius=radius);
    color("red")
    haken(xoffset=laenge);
    rotatehaken(xoffset=0);
}

module stange(laenge,radius=gleisdicke/2){
    rotate([0,90,0])
    cylinder(r=radius, h=laenge, $fn=fn);     
}


module schwelle(spurweite){
    translate([0,0,gleisdicke/48])
    color("green")
    rotate([-90,0,0])
    cube([schwellenbreite,1,spurweite]);     
}

module haken(xoffset=0){   
    translate([xoffset,0,-5])
    rotate([90,270+rotationangle,0])
    rotate_extrude(convexity = 10, angle=rotationangle, $fn=fn)
    translate([hakenrotationradius, 0, 0])
    circle(r = gleisdicke/2, $fn=fn); 
}

module rotatehaken(xoffset=0){
    translate([xoffset,0,0])
    mirror([1,0,0]){
        haken();
    }
}

module fluegel(){
    color("blue")
    translate([schwellensafety,0,0])
    rotate([30,0,0])    
//    cube([fluegelbreite,fluegelhoehe,1]); 
    prism(10,1,6,extraw=3);
}


module scheibe(){ 
    circle(d=gleisdicke);
}


module doppelscheibe(abstand=spurweite){
    translate([-abstand/2,0,0])
    scheibe();
    translate([abstand/2,0,0])
    scheibe();
}
 
module kurve(winkel=120,scope=1){
    rotate([0,0,270])
    translate([0,.5*spurweite,0])
    haken();
    rotate([0,0,270])
    translate([0,-.5*spurweite,0])
    haken();
    translate([-scope*0.5*sechseckkantenlaenge, 0])
    rotate_extrude(convexity = 10, angle=winkel, $fn=fn)
    translate([scope*.5*sechseckkantenlaenge, 0])
    doppelscheibe();
//    translate([-schwellenbreite/2,0])
//    schwelle();
}

module loecher(angle=0){     
    translate([-spurweite/2,sechseckhoehe/2-hakenrotationradius,0])
    linear_extrude(height=plaettchenhoehe)
    circle(d=3,$fn=20);
//    translate([-spurweite/2-1.5,sechseckhoehe/2-hakenrotationradius+1,0])    
//    rotate([0,0,0])
//    square([3,3.5]);
    
    translate([+spurweite/2,sechseckhoehe/2-hakenrotationradius,0])
    linear_extrude(height=plaettchenhoehe)
    circle(d=3,$fn=20); 
//    translate([spurweite/2-1.5,sechseckhoehe/2-hakenrotationradius+1,0])    
//    rotate([0,0,0])
//    square([3,3.5]);
    
}module hakenfill(angle=0){          
    rotate([0,0,30]) 
    translate([sechseckhoehe/2,spurweite/2,0])
    rotate([0,0,180])
    color("red")
    haken();
    rotate([0,0,30]) 
    translate([sechseckhoehe/2,-spurweite/2,0])
    rotate([0,0,180])    
    color("red")
    haken();
}

module canal(){ 
    translate([-spurweite/2,sechseckhoehe/2,0])  
    rotate ([90,0,0]) cylinder (h = 10.5, r=1.5, center = true, $fn=10);
    translate([-spurweite/2,sechseckhoehe/2-hakenrotationradius,0])  
    rotate ([0,0,0]) cylinder (h = 8, r=1.5, center = true, $fn=10);
    
    translate([+spurweite/2,sechseckhoehe/2,0])  
    rotate ([90,0,0]) cylinder (h = 10.5, r=1.5, center = true, $fn=10);
    translate([+spurweite/2,sechseckhoehe/2-hakenrotationradius,0])  
    rotate ([0,0,0]) cylinder (h = 8, r=1.5, center = true, $fn=10);
      
}

module canals(){
    for(i=[0:5]){
        rotate([0,0,60*i]) 
        canal();
    }    
}

module lochset(){
    for(i=[0:5]){
        rotate([0,0,60*i]) 
        loecher();
    }
}

module hakenfillset(positionen=[0,1,2,3,4,5]){
    for(i=positionen){
        rotate([0,0,60*i]) 
        hakenfill();
    }
}

module plaettchen(hex_x=0, hex_y=0, color="orange",kantenlaenge=sechseckkantenlaenge,hakenpositionen=[]){     
//    color(color,0.6)    
    x_offset=hex_x*1.5*sechseckkantenlaenge;
    y_offset=hex_x*0.5*sechseckhoehe+hex_y*sechseckhoehe;
    color([cos((hex_x+1)*122)/2+0.5,
            cos((hex_y+1)*104)/2+0.5,
            cos((hex_x+hex_y+1)*133)/2+0.5],0.8) 
    difference() {
    translate([x_offset,y_offset,-plaettchenhoehe])
    linear_extrude(height=plaettchenhoehe)
    circle($fn=6,r=sechseckkantenlaenge);
    translate([x_offset,y_offset,0])
    canals();    
    } 
    translate([x_offset,y_offset])
    hakenfillset(positionen=hakenpositionen);  
}

 

 

plaettchen(-1,2,hakenpositionen=[0,1]);
plaettchen(0,1);
plaettchen(1,-2);
plaettchen(1,1,hakenpositionen=[5]);
plaettchen(2,-1);
plaettchen(4,-1);

translate([132,10,0]) 
rotate([0,0,30])
gleis(2*sechseckkantenlaenge,spurweite,extra_schwellen=1);


//enge kurve
translate([0,sechseckhoehe*1.5])
kurve(120); 


//weite kurve
translate([sechseckkantenlaenge*3,sechseckhoehe/2])
kurve(60,scope=3); 

//U-turn
translate([sechseckkantenlaenge*1.5,2*sechseckhoehe])
kurve(180,scope=3); 
 

//S-Kurve
translate([sechseckkantenlaenge*1.5,-sechseckhoehe])
kurve(60,scope=3); 
rotate([0,0,180])
translate([0,-sechseckhoehe/2])
kurve(60,scope=3); 











































 


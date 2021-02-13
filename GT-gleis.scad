module prism(w,d,h,extraw=0){
   polyhedron(
//           points=[[0,0,0], [0,0,h], [w,0,0], [0,d,0], [0,d,h], [w,d,0]],
//           faces=[[0,1,2],[3,4,5],[0,1,4,3],[1,2,5,4],[2,0,3,5]]
           points=[
                [0,0,0], [0,0,h], [extraw,0,h], [w,0,0],
                [0,d,0], [0,d,h], [extraw,d,h], [w,d,0]
            ],
           faces=[[0,1,2,3],[4,5,6,7],
                  [0,1,5,4],[1,2,6,5],[2,3,7,6],[3,4,0,7]]
           ); 
   }
       
spurweite=10; 
gleisdicke=2;
fluegelbreite=10;
fluegelhoehe=5;
fluegeldicke=1;
schwellenbreite=10;
schwellensafety=6;// Abstand zwischen Hakenansatz und erster Schwelle
rotationangle=70;
rotationradius=5;

module gleis(laenge, spurweite, extra_schwellen=0){
    schiene(laenge);
    translate([0,spurweite, 0])
    schiene(laenge);
    faecher=1+extra_schwellen; 
    schwellenoffset=(laenge-2*schwellensafety-10)/faecher;
    for (i=[0:faecher]){
        translate([schwellensafety+schwellenoffset*i,0,0])
        schwelle(spurweite);
    }     
//    color("red")
//    translate([laenge-schwellensafety,0,0])
//    schwelle(spurweite);
    fluegel();
//       
    translate([laenge,0,0])//mirrored on y axis, hence safety offset already included
    mirror([1,0,0])
    fluegel();
//     
    translate([0,spurweite,0])
    mirror([0,1,0])
    fluegel();
//    
    translate([laenge,spurweite,0])
    mirror([1,0,0])
    mirror([0,1,0])
    fluegel();
}

module schiene(laenge, radius=gleisdicke/2){
    stange(laenge,radius=radius);
    haken(laenge);
    rotatehaken(0);
}

module stange(laenge,radius=gleisdicke/2){
    rotate([0,90,0])
    cylinder(r=radius, h=laenge, $fn=10);     
}


module schwelle(spurweite){
    translate([0,0,gleisdicke/48])
    color("green")
    rotate([-90,0,0])
    cube([schwellenbreite,1,spurweite]);     
}

module haken(xoffset){   
    translate([xoffset,0,-5])
    rotate([90,270+rotationangle,0])
    rotate_extrude(convexity = 100, angle=rotationangle)
    translate([rotationradius, 0, 0])
    circle(r = gleisdicke/2, $fn=10); 
}

module rotatehaken(xoffset){
    translate([xoffset,0,-5])
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



//gleis(70,spurweite,extra_schwellen=2);
gleis(70,spurweite,extra_schwellen=0);

 


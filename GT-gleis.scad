
include <dimensions.scad>;
include <gleise.scad>;
include <plaettchen.scad>;

include <sculpts.scad>;

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
       


//module loecher(angle=0){     
//    translate([-spurweite/2,sechseckhoehe/2-hakenrotationradius,fahrbahnhoehe])
//    linear_extrude(height=plaettchenhoehe)
//    circle(d=13,$fn=20);
////    translate([-spurweite/2-1.5,sechseckhoehe/2-hakenrotationradius+1,0])    
////    rotate([0,0,0])
////    square([3,3.5]);
//    
//    translate([+spurweite/2,sechseckhoehe/2-hakenrotationradius,fahrbahnhoehe])
//    linear_extrude(height=plaettchenhoehe)
//    circle(d=3,$fn=20); 
////    translate([spurweite/2-1.5,sechseckhoehe/2-hakenrotationradius+1,0])    
////    rotate([0,0,0])
////    square([3,3.5]);
//    
//}

module hakenfill(angle=0){          
    rotate([0,0,30]) 
    translate([sechseckhoehe/2,spurweite/2,fahrbahnhoehe])
    rotate([0,0,180])
    color("red")
    haken();
    rotate([0,0,30]) 
    translate([sechseckhoehe/2,-spurweite/2,fahrbahnhoehe])
    rotate([0,0,180])    
    color("red")
    haken();
}



// good

plaettchen(0,0,geometry="",runwayrotate=0,solid=true);
plaettchen(-1,2,geometry="Cc",runwayrotate=0,solid=true);
plaettchen(0,-1,hakenpositionen=[],geometry="I",solid=true,runwayrotate=180);
plaettchen(0,-2,hakenpositionen=[],geometry="*",solid=true,runwayrotate=180);
plaettchen(1,-2,geometry="I",runwayrotate=240);
plaettchen(1,1,hakenpositionen=[5],geometry="C",runwayrotate=180, solid=false);
plaettchen(2,-1,geometry="cC",runwayrotate=180);
plaettchen(4,-1,geometry="X",runwayrotate=120);


//gleis2
////translate([132,10,0]) 
//rotate([0,0,30])
//gleis2();
//gleis4();
//gleis5();
//gleis(0.1*sechseckhoehe+sechseckhoehe,spurweite);

  

 
//enge kurve
//translate([0,sechseckhoehe*1.5])
//kurve(240); 


//weite kurve
//translate([sechseckkantenlaenge*3,sechseckhoehe/2])
//kurve(60,scope=3); 
//
////U-turn
//translate([sechseckkantenlaenge*1.5,2*sechseckhoehe])
//kurve(180,scope=3); 
// 
//
//S-Kurve
//translate([sechseckkantenlaenge*1.5,-sechseckhoehe])
//kurve(60,scope=3); 
//rotate([0,0,180])
//translate([0,-sechseckhoehe/2])
//kurve(60,scope=3); 
////



//rotate([0,0,120])
haube(durchschuss=true, safety=true);

//trichterplaettchen();
//translate([0,0,30])
//plaettchen(geometry="Cc");
//
//color("brown",.9)

//translate([0,-20,9])
//sphere(d=10);

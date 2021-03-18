
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

//plaettchen(0,0,geometry="",runwayrotate=0,solid=true);
//plaettchen(-1,2,geometry="Cc",runwayrotate=0,solid=true);
//plaettchen(0,-1,hakenpositionen=[],geometry="I",solid=true,runwayrotate=180);
//plaettchen(0,-2,hakenpositionen=[],geometry="*",solid=true,runwayrotate=180);
//plaettchen(1,-2,geometry="I",runwayrotate=240);
//plaettchen(1,1,hakenpositionen=[5],geometry="C",runwayrotate=180, solid=false);
//plaettchen(2,-1,geometry="cC",runwayrotate=180);
//plaettchen(4,-1,geometry="X",runwayrotate=120);


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
//haube(durchschuss=true, safety=true);

//trichterplaettchen();
//translate([0,0,30])
//plaettchen(geometry="Cc");
//
//color("brown",.9)

//translate([0,-20,9])
//sphere(d=10);

difference() {
        union() {
            difference (){
                plaettchen();
                translate([0,-8,15])
                    rotate([0,0,-90])
                    rotate([0,100,0])
                        cylinder(h=20,d=fahrbahnbreite);
                rotate([5,0,240])
                translate([0,0,plaettchenhoehe+2])
                    for (i=[1:18]){
                        translate([0,0,i/2])
                        rotate([0,0,10*i+60])
                            rotate([90,0,0])
                            translate([15,0,0])
                            rotate([0,0,i*35])
                            color("red")
                            linear_extrude(height=10) 
                                        circle(d=fahrbahnbreite);
                                    }
                
            }
            rotate([5,0,240])
                translate([0,0,plaettchenhoehe+2])
                    union(){
                    for (i=[1:58]){
                        translate([0,0,i/2])
                        rotate([0,0,10*i+60])
                            rotate([90,0,0])
                            translate([15,0,0])
                            rotate([0,0,i*35])
                            color("red")
                            linear_extrude(height=3)
                                    difference(){
                                        circle(d=fahrbahnbreite+3);
                                        circle(d=fahrbahnbreite);
                    //                    translate([fahrbahnbreite/2,0,0])
                    //                    circle(d=5,$fn=4);
                                    }
                                } 
                                translate([24,-17,22])
                                rotate([0,0,60])
                                cube([11,4,3]);
                            }
                                
                 
                                
        translate([-31.5,-7,41.5])
        rotate([0,0,300])   
                            
        difference() {
            union (){ 
            translate([0, 0, -1]) 
        rotate_extrude(convexity = 10,angle=45)
            translate([10, 0, 0]) 
            difference(){
                    circle(d=fahrbahnbreite+3);
                    circle(d=fahrbahnbreite);
            }
        
//            anschlussstueck        
        color("green")
            translate([-6,20.5,-1.5])
                rotate([0,88,313])  
                linear_extrude(height=23.5) 
            difference(){
                    circle(d=fahrbahnbreite+3);
                    circle(d=fahrbahnbreite);
            } 
        }
            translate([9,0,3])
            sphere(11);
        } 
                                
//        color("blue")
//        rotate_extrude(angle=90)     
//        rotate([0,0,90])
//        difference(){
//            circle(d=fahrbahnbreite+3);
//            circle(d=fahrbahnbreite);               
//
//        }                                

        }
    //    rotate([10,0,0])
    //        translate([0,4,plaettchenhoehe*1.5])
    //            resize(newsize=[sechseckhoehe*.95,sechseckhoehe*1.25,plaettchenhoehe*2])
    //                sphere(sechseckhoehe/2);
//        translate([0,5.5-sechseckhoehe/2,11.5])
//            rotate([10,0,0])
//                rotate ([-90,45,0])
    //                cylinder (h = sechseckhoehe*.55, d=fahrbahnbreite+4, center = true, $fn=4);
//                    cylinder (h = sechseckhoehe, d=15, $fn=100);
//        exit
        translate([0,0,10])
            canals(slots=[3]);
        translate([0,0,42.7])
            difference(){
            canals(slots=[2]);
            translate([-40,-30,-6.1])
                cube([40,40,20]);
          }
//        entry
//        translate([-25,-13,35]) 
//        rotate([0,0,-60])
//        union(){
//        translate([spurweite/2,0,0])
//            sphere(d=gleisdicke+1,$fn=20);
//        translate([-spurweite/2,0,0])
//            sphere(d=gleisdicke+1,$fn=20);
//        }
//        cutoff excess
        translate([-35,-22,30])
            rotate([0,0,30])
            cube([10,20,20]);
} 
   

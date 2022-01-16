
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

//plaettchen(0,0,geometry="Cc",runwayrotate=0,solid=true);
//plaettchen(0,1,geometry="C",runwayrotate=120,solid=true);
//plaettchen(0,-1,hakenpositionen=[],geometry="I",solid=true,runwayrotate=180);
//plaettchen(0,-2,hakenpositionen=[],geometry="*",solid=true,runwayrotate=180);
//plaettchen(1,-1,geometry="I",runwayrotate=0);
//plaettchen(2,-1,geometry="cC",runwayrotate=180);
//plaettchen(4,-1,geometry="X",runwayrotate=120);
//plaettchen(1,1,geometry="c",runwayrotate=0);
//plaettchen(1,0,geometry="X",runwayrotate=120);
//plaettchen(1,-2,geometry="cC",runwayrotate=60);





//gleis2
//translate([132,10,0]) 
//rotate([0,0,30])
//translate([0,0,0])
//gleis1(); 
//translate([0,-30,0])
//gleis2();
//translate([0,-60,0])
//gleis3();
//translate([0,-90,0])
//gleis4();
//translate([0,-120,0])
//gleis5();
//gleis(0.1*sechseckhoehe+sechseckhoehe,spurweite); 

  
//
//plaettchen(0,0,geometry="I",runwayrotate=0);
//plaettchen(1,-1,geometry="I",runwayrotate=0);
//plaettchen(2,-2,geometry="I",runwayrotate=0);
//plaettchen(3,-3,geometry="I",runwayrotate=0);
//
//
//plaettchen(-1,1,geometry="C",runwayrotate=120);
////plaettchen(1,-1,geometry="I",runwayrotate=0);
//plaettchen(1,1,geometry="I",runwayrotate=0);
//plaettchen(4,-1,geometry="I",runwayrotate=0);
//
////enge kurve
//translate([0,sechseckhoehe*.5])
//kurve(120); 
//
//
////weite kurve
//translate([sechseckkantenlaenge*1.5,0])
//kurve(60,scope=3); 
////
//////U-turn
////translate([sechseckkantenlaenge*1.5,2*sechseckhoehe])
////kurve(180,scope=3); 
//// 
////
//S-Kurve
//translate([sechseckkantenlaenge*1.5,sechseckhoehe*.5])
//{
//translate([sechseckkantenlaenge*1.5,-sechseckhoehe])
//kurve(60,scope=3); 
//rotate([0,0,180])
//translate([0,-sechseckhoehe/2])
//kurve(60,scope=3); 
//}
//
//translate([210,0,0])
//mirror([1,0,0])
//{
//translate([sechseckkantenlaenge*1.5,-sechseckhoehe])
//kurve(60,scope=3); 
//rotate([0,0,180])
//translate([0,-sechseckhoehe/2])
//kurve(60,scope=3); 
//}
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

//mirror([0,1,0])
//spirale();
//translate([0,0,30])
//plaettchen(-1,1,geometry="I",runwayrotate=60,slots=[1,2,3,4,5,6]);


module loopscheibe(r=20, spread){
    rotate([1,0,0])
    rotate([0,90,0])
    linear_extrude(height = spread, center = true, convexity = 10, twist = 350)
    translate([r, 0, 0])
    rotate([45,45,0])
    square(1.5);
}

module loopgleis(r=20, spread=spread){
    loopscheibe();
    for (i =[0:10]){
        translate([.1*i,0,0])
        loopscheibe(r=r,spread=spread);
    }
}

module stuetzgleis(extra=0,spread){
//    loopscheibe();
    for (i =[0:10]){
        translate([.1*i,0,0])
        loopscheibe(r=20+extra,spread=spread);
    }
}



module looping(rotate=0,spread=20,safety=false,x_offset=0,y_offset=0){
    difference(){
        plaettchen();
//        translate([0,-3,fahrbahnhoehe+spurweite/2+1])
//            runways(geometry="c",rotate=120);
//        translate([0,0,fahrbahnhoehe+spurweite/2+1])
//            runways(geometry="I");
        
        translate([3,47,10])
        rotate([90,0,-8])
        cylinder(d=fahrbahnbreite,h=65.5);
        translate([17,13.5,11.5])
            rotate([91,0,-21])
                cylinder(d=fahrbahnbreite,h=49);
//        translate([0,-8,20])
//        intersection(){
//            sphere(26);
//            translate([0,0,-3])
//            mirror([0,0,1])
//            plaettchen();
//            translate([-0,-30,-17])
//            cube(50);
//        }
        translate([0,0,fahrbahnhoehe+5])
        canals([0,3]);
    }
    translate([x_offset,y_offset,25])
        rotate([0,0,rotate])
        union(){        
//            translate([0,0,0])
//                stuetzgleis(extra=3,spread=spread);
//            
//            translate([1,0,0])
//                stuetzgleis(extra=2.5,spread=spread);
//            translate([-1,0,0])
//                stuetzgleis(extra=2.5,spread=spread);
            
//            translate([2,0,0])
//                stuetzgleis(extra=2.5,spread=spread);
//            translate([-2,0,0])
//                stuetzgleis(extra=2.5,spread=spread);
            
            translate([3,0,0])
                stuetzgleis(extra=2,spread=spread);
            translate([-3,0,0])
                stuetzgleis(extra=2,spread=spread);
            
            translate([4,0,0])
                stuetzgleis(extra=1.5,spread=spread);
            translate([-4,0,0])
                stuetzgleis(extra=1.5,spread=spread); 
            
            translate([5,0,0])
                stuetzgleis(extra=1,spread=spread);
            translate([-5,0,0])
                stuetzgleis(extra=1,spread=spread);
                
            translate([6,0,0])
                stuetzgleis(extra=1,spread=spread);
            translate([-6,0,0])
                stuetzgleis(extra=1,spread=spread);
                
//            translate([7,0,0])
//                stuetzgleis(extra=0,spread=spread);
//            translate([-7,0,0])
//                stuetzgleis(extra=0,spread=spread);
//            translate([7,0,0])
//                stuetzgleis(extra=-1,spread=spread);
//            translate([-7,0,0])
//                stuetzgleis(extra=-1,spread=spread);
//            translate([7,0,0])
//                stuetzgleis(extra=-2,spread=spread);
//            translate([-7,0,0])
//                stuetzgleis(extra=-2,spread=spread);
//            translate([7,0,0])
//                stuetzgleis(extra=-3,spread=spread);
//            translate([-7,0,0])
//                stuetzgleis(extra=-3,spread=spread);
//            translate([7,0,0])
//                stuetzgleis(extra=-4,spread=spread);
//            translate([-7,0,0])
//                stuetzgleis(extra=-4,spread=spread);                   
        }
        if (safety==true){
            translate([35,-3,10])
            rotate([0,0,145])
            intersection(){
                difference(){
                    sphere(25,$fn=100);
                    sphere(24,$fn=100); 
                    translate([-1,-1,0])
                        cylinder(r=46,h=40,$fn=3);
                }
            translate([0,0,-1])
                cube(29);
            }
        }
}        
        
        
//looping(rotate=-18,spread=20, safety=true,x_offset=8.5,y_offset=-2);
//translate([50,50,0])
//looping(rotate=-18,spread=16, safety=false,x_offset=3,y_offset=-2);


//haengebruecke

//trichter

//module torus(dicke=1.1, durchmesser=4, angle=360){   
//    
//    rotate_extrude(convexity = 10, angle=angle, $fn=8)
//        translate([durchmesser/2, 0])
//                circle(d=dicke,$fn=10);
//}
// 
//
//module crown(r=9.5){
//    for (i = [0:5]){
////        rotate([0,0,30*i])
////            translate([0,r,0])
////                torus();
//        rotate([0,0,30+60*i])
//            translate([0,r,0])
//                rotate([0,90,30])
//                    scale([2,1,1])
//                        torus();
//        rotate([0,0,30+60*i])
//            translate([0,r,5.8])
//                rotate([0,90,120])
//                    scale([2,1,1])
//                        torus();        
//        rotate([0,0,30+60*i])
//            translate([0,r,-5])
//                cylinder(d=.4,h=15);
//    }    
//}
//
//module stabilisator(){
//    difference(){
//        cylinder(d=3,h=60,$fn=20);
//        translate([0,0,-5])
//        cylinder(d=2.5,h=70,$fn=20);
//    }
//}
//
//translate([0,0,60])
//    rotate([0,0,120])
//        plaettchen(geometry="I");
//
//translate([-34,-19.75,0])
//union(){
//    for (i=[0:5]){
//        translate([0,0,i*11.5])
//            crown();
//    }
//
//    for (j=[0:1]){
//        translate([0,0,15+23*j])
//            difference(){
//                cylinder(d=fahrbahnbreite+6, h=4);
//                translate([0,0,-.5])
//                cylinder(d=fahrbahnbreite+5, h=5);
//            }         
//    }
//}

//rotate_extrude(angle=90)
//rotate([90,90,0]) 

//anschluss
//translate([-24,-14,59])
//    rotate([90,-90,30])
//        rotate_extrude(convexity = 10, angle=90, $fn=20)
//            translate([12, 0])
//                    difference(){
//                        circle(d=fahrbahnbreite+3);
//                        circle(d=fahrbahnbreite+2);
//                    }
//                    
//            
//            
//translate([-44,-26,0])
//    union(){            
//        rotate([90,-180,210])
//            rotate_extrude(convexity = 10, angle=90, $fn=20)
//                translate([12, 0])
//                        difference(){
//                            circle(d=fahrbahnbreite+3);
//                            circle(d=fahrbahnbreite+2);
//                        } 
//                        
//                translate([-0,5.75,-19]) 
//                rotate([0,0,210])
//                        {
//                schiene(5,double=false);
//                translate([0,spurweite, 0])
//                schiene(5,double=false);
//                    }
//                    
//    }
//    
    
//translate([-28,-9.5,.1])
//    stabilisator();
//
//translate([-22,-19.5,.1])
//    stabilisator();
//
//translate([-23.8,-13.8,.1])
//    stabilisator();

//trichterplaettchen();
//
//haube();

//spirale();

loopingplaettchen();























   

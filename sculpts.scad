
module haube(hoehe=2*plaettchenhoehe,r=sechseckkantenlaenge,wandstaerke=2,hoehenfaktor=1.75,durchschuss=false,safety=true){
rotate([0,0,-60])
    difference (){
        union() {
          difference () {
            plaettchen();
            translate([0,0,10])
                    canals(slots=[1]);
            }
            union() {
            translate([0,0,plaettchenhoehe])
    //        aussenpyramide
                cylinder(h=hoehe, r1=r, r2=stopfengroesse/2+2*wandstaerke, center=false, $fn=6);
//                if(safety){
//                    rotate([0,0,90])
//                        translate([-sechseckhoehe/2,-sechseckkantenlaenge/2,-plaettchenhoehe])
//                            cube([wandstaerke,sechseckkantenlaenge,plaettchenhoehe]);
//                }
            }
        }
//        innenpyramide
        translate([0,0,plaettchenhoehe-1])
            cylinder(h=hoehe-wandstaerke, r1=r-wandstaerke, r2=r/hoehenfaktor-wandstaerke, center=false, $fn=6);
//        aussparung
        translate([0,sechseckhoehe/2,plaettchenhoehe+wandstaerke])
            rotate([0,0,30])
                linear_extrude(0,0,hoehe*1.1)
                    circle(r = sechseckkantenlaenge, $fn=3);
//negatives inset
        translate([0,0,hoehe+plaettchenhoehe-wandstaerke-2])
            linear_extrude(plaettchenhoehe)
                circle(d=stopfengroesse,$fn=6);
//        mulde
        rotate([-5,0,60])
            translate([0,0,plaettchenhoehe+1])
               resize(newsize=[sechseckhoehe*.85,sechseckhoehe*.85,plaettchenhoehe])
                    sphere(r=sechseckkantenlaenge-wandstaerke);
    translate([0,0,plaettchenhoehe+3.45])
        rotate([0,93,150])
            translate([0,0,1])
            cylinder(h=30,$fn=20,d=15);
    }
}

module trichter(hoehe=40,r=30,wandstaerke=3){
    translate([0,7,31.8])
    rotate([130,0,0])
        difference (){
            cylinder(h=hoehe, r1=r, r2=0, center=false, $fn=100);
            translate([0,0,-2])
                cylinder(h=hoehe, r1=r, r2=0, center=false, $fn=100);
//            translate([0,-5,25])
//                rotate([-20,0,0])
//                    cylinder(d=16,h=35);
        }
}

module trichterklein(hoehe=30,r=15,wandstaerke=3){
    translate([0,7,20.8])
    rotate([130,0,0])
        difference (){
            cylinder(h=hoehe, r1=r, r2=0, center=false, $fn=100);
            translate([0,0,-2])
                cylinder(h=hoehe, r1=r, r2=0, center=false, $fn=100);
            translate([0,-5,25])
                rotate([-20,0,0])
                    cylinder(d=16,h=35);
        }
}

module trichterplaettchen(){
    difference() {
        union() {
            trichter();
            plaettchen(geometry="i");
        }
    //    rotate([10,0,0])
    //        translate([0,4,plaettchenhoehe*1.5])
    //            resize(newsize=[sechseckhoehe*.95,sechseckhoehe*1.25,plaettchenhoehe*2])
    //                sphere(sechseckhoehe/2);
        translate([0,5.5-sechseckhoehe/2,11.5])
            rotate([10,0,0])
                rotate ([-90,45,0])
    //                cylinder (h = sechseckhoehe*.55, d=fahrbahnbreite+4, center = true, $fn=4);
                    cylinder (h = sechseckhoehe, d=15, $fn=100);
        translate([0,0,10])
            canals(slots=[3]);
}
  }



module spirale() {
    difference() {
            union() {
                difference (){
                    plaettchen();
    //                exit
                    translate([0,-8,15])
                        rotate([0,0,-90])
                        rotate([0,100,0])
                            difference() {
                            cylinder(h=20,d=fahrbahnbreite);
                            translate([-1,-10,-1])
                            rotate([0,0,0])
                            rotate([0,90,0])
                            cylinder($fn=4,h=10,r=15)    ;
                            }
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
                //stuetzbogen
                //translate([0,-11,2])
                //rotate([90,0,-15])
                //linear_extrude(height=8)
                //    difference() {
                //        circle(20);
                //        circle(18);
                //        translate([-25,-50])
                //        square(50);
                //    }
                //spirale
                translate([0,0,2])
                rotate([5,0,240])
                    translate([0,0,plaettchenhoehe+2])
                        union(){
                        for (i=[1:58]){
                            translate([0,0,i/2.2])
                            rotate([0,0,10*i+60])
                                rotate([90,0,0])
                                translate([15,0,0])
                                rotate([0,0,i*35])
                                color("red")
                                linear_extrude(height=3)
                                        difference(){
                                            circle(d=fahrbahnbreite+1);
                                            circle(d=fahrbahnbreite);
                        //                    translate([fahrbahnbreite/2,0,0])
                        //                    circle(d=5,$fn=4);
                                        }
                                    }
                                    //translate([24,-17,20])
                                    //rotate([0,0,60])
                                    //cube([11,4,3]);
                                }



            translate([-31.5,-7,41.5])
            rotate([0,0,300])

            difference() {
                union (){
                    translate([0, 0, -3])
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
               // translate([9,0,3])
               //     sphere(11);
                translate([12,-15,0])
                    rotate([0,0,45])
                        cube([30,30,20]);
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
            translate([0,0,40.7])
                difference(){
                canals(slots=[2]);
                translate([-40,-30,-5.1])
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
            translate([-27,-22,35])
                rotate([0,0,30])
                cube([10,40,20],center=true);
    }

}

module looping2(){
    breite = fahrbahnbreite;
    radius = 25;
    umfang = 2 * 3.1415 * radius; 
    steps = 120;
    bandenbreite = 1;
    shift = breite-bandenbreite;
    bandenhoehe = spurweite*.66;
    fahrbahndicke = 1;

    for (i=[0:steps]){
        rotate([i*360/steps,0,0])    
            translate([-i*shift/steps,0,-radius])
                    element();
    }


    module element(){
        linear_extrude(fahrbahndicke)
            square([breite,umfang/steps]);
        linear_extrude(bandenhoehe)
            square(bandenbreite,umfang/steps);
        translate([breite-bandenbreite,0,0])
            linear_extrude(bandenhoehe)
                square(bandenbreite,umfang/steps);
    }
}

module loopingplaettchen(){
//    difference() {
        union() {
            plaettchen(geometry="X");
            rotate([0,0,50])
            translate([-4,0,35])            
            looping2();
        }
    //    rotate([10,0,0])
    //        translate([0,4,plaettchenhoehe*1.5])
    //            resize(newsize=[sechseckhoehe*.95,sechseckhoehe*1.25,plaettchenhoehe*2])
    //                sphere(sechseckhoehe/2);
//        translate([0,5.5-sechseckhoehe/2,11.5])
//            rotate([10,0,0])
//                rotate ([-90,45,0])
//    //                cylinder (h = sechseckhoehe*.55, d=fahrbahnbreite+4, center = true, $fn=4);
//                    cylinder (h = sechseckhoehe, d=15, $fn=100);
//        translate([0,0,10])
//            canals(slots=[3]);

  }
  
  
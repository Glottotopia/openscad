
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

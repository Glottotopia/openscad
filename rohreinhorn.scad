wandstaerke=2;
rohrdicke=20;
epsilon=0.01;
cliplaenge=25;
lochabstand=10;
lochdurchmesser=3;
lochdurchmesser_intended=lochdurchmesser*1.4142*1.1;

difference(){
    cylinder(d=rohrdicke+2*wandstaerke, h=cliplaenge,$fn=100);
    translate([0,0,-epsilon])
    cylinder(d=rohrdicke, h=cliplaenge+2*epsilon,$fn=100);
    translate([0,10,-epsilon])
    cylinder(d=rohrdicke+2*wandstaerke+epsilon, h=cliplaenge+2*epsilon,$fn=100);
    translate([0,0,cliplaenge/2-lochabstand/2-lochdurchmesser_intended/2.83])
        rotate([90,45,0])
            cylinder(d=lochdurchmesser_intended,h=20,$fn=4);
    translate([0,0,cliplaenge/2+lochabstand/2+lochdurchmesser_intended/2.83])
        rotate([90,45,0])
            cylinder(d=lochdurchmesser_intended,h=20,$fn=4);
    translate([0,-12,cliplaenge/2-lochabstand/2-lochdurchmesser_intended])
        rotate([0,0,45])
            cylinder(d=lochdurchmesser_intended,$fn=4,h=lochabstand+2*lochdurchmesser_intended);
}

//rotate([97,0,0])
//translate([0,30,4])
//scale([3,3,3])
//import("Dolphin.stl");
//130

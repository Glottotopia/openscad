staerke = 3;
spiel = 3;
buchbreite  = 50;
aussenbreite = buchbreite + 2 * staerke + spiel;
xoffset1 = 23;
zoffset1 = 20;
xoffset2 = 45;
zoffset2 = 40;

module hole(){
    translate([-5,0,0])
    rotate([90,0,0])
    cylinder(h=200,d=4,$fn=24,center=true);
    translate([-5,4,0])
    sphere(d=8,$fn=22);
}

module element(){
difference(){
    cube([50,aussenbreite,50]);
    translate([staerke, staerke, staerke])
        cube([50,buchbreite+spiel/2,50]);
    translate([0, buchbreite+staerke-.1, buchbreite+staerke])
        rotate([0,45,0])
            cube([150,aussenbreite,50]);
//    translate([xoffset1,0,zoffset1])
//        hole();
    translate([xoffset1,0,zoffset2])
        hole();
    translate([xoffset2,0,zoffset1])
        hole();
//    translate([xoffset2,0,zoffset2])
//        hole();
}
}

element();

//translate([-2,0,0])
//mirror([[0,1,0]])
//    element();
    
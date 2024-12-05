staerke = 2.5;
minko_radius=staerke/3;
spiel = 1;
//buchbreite  = 20;
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



module element(buchbreite){
    aussenbreite = buchbreite + 2 * staerke + spiel;
    translate([minko_radius,minko_radius,minko_radius])
        difference(){
            minkowski(){
                sphere(r=minko_radius,$fn=20);
                cube([50-2*minko_radius,aussenbreite-2*minko_radius,50-2*minko_radius]);
            }
                translate([staerke, staerke, staerke])
                    cube([50,buchbreite+spiel/2,50]);
                translate([0, buchbreite+staerke+.49, 50+staerke/1.5])
                    rotate([0,45,0])
                        cube([150,aussenbreite,50]);  
            translate([xoffset1,0,zoffset2])
                hole();
            translate([xoffset2,0,zoffset1])
                hole(); 
            translate([25,buchbreite/2,2])
                linear_extrude(12)
                text(str(buchbreite));
        }
    }
 
 module double(breite){
        element(breite);
        translate([105,0,0])
        mirror([[0,-1,0]])
            element(breite);
}
    
for (i=[2]){
    translate([ i*110,0])
        double(i*10);
}
a6laenge = 20; 
a6hoehe =14; 
stangendurchmesser = 5; 
wandstaerke = 1; 
zylinderfuehrung = 10;

module zylinder(hoehe=zylinderfuehrung){
    difference(){
        cylinder(d=stangendurchmesser+2*wandstaerke,h=hoehe,$fn=20);
        translate([0,0,-1])
        cylinder(d=stangendurchmesser,h=hoehe+2,$fn=20); 
    }
}

module tstueck(){
    zylinder();
    translate([0,zylinderfuehrung,0])
        zylinder();
    rotate([0,90,0])
        zylinder();
    
}

tstueck();

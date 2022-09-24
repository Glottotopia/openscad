breite = 25;
radius = 30;
umfang = 2 * 3.1415 * radius; 
steps = 555;
bandenbreite = 1;
shift = breite-bandenbreite;
bandenhoehe = 10;
fahrbahndicke = 1;

//translate([0,0,-radius])
//    square([breite,umfang/steps]);

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
    
    
    


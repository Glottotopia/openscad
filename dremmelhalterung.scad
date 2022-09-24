durchmesser_innen_start = 60;
durchmesser_innen_end = 55;
wandstaerke = 5;
fusslaenge = 150;
bandbreite = 25; 
fussbreite = bandbreite;
fussstaerke = 15;
tunnellaenge=80;
plattenlaenge = tunnellaenge;
plattenbreite=70;
plattenstaerke=3;
halterstaerke = 5;
haltertiefe = 21;

color("pink")
difference(){ 
    union(){
        cylinder(h=tunnellaenge,d1=durchmesser_innen_start+wandstaerke,d2=durchmesser_innen_end+wandstaerke,$fn=100);  
        translate([15-halterstaerke/2,11,5.5])
        rotate([-10,0,0])   
        cube([halterstaerke,haltertiefe,plattenlaenge-5]);    
        translate([-15-halterstaerke/2,11,5.5])
        rotate([-10,0,0])   
        cube([halterstaerke,haltertiefe,plattenlaenge-5]);    
    }
    translate([0,0,-1])
    cylinder(h=tunnellaenge+2,d1=durchmesser_innen_start,d2=durchmesser_innen_end,$fn=100);     
}

translate([0,2.5,5.5])
rotate([-10,0,0])
difference(){
    translate([-plattenbreite,durchmesser_innen_start/2-plattenstaerke/2,0])        
    cube([plattenbreite*2,plattenstaerke,plattenlaenge]);    
    
    translate([durchmesser_innen_start/2+12,durchmesser_innen_start/2+plattenstaerke,plattenbreite/2+25])   
    rotate([90,0,0])
    cylinder(d=4,h=plattenstaerke+3,$fn=100);
    translate([-durchmesser_innen_start/2-12,durchmesser_innen_start/2+plattenstaerke,plattenbreite/2+25])   
     rotate([90,0,0])
    cylinder(d=4,h=plattenstaerke+3,$fn=100);
    translate([durchmesser_innen_start/2+12,durchmesser_innen_start/2+plattenstaerke,plattenbreite/2-25])   
    rotate([90,0,0])
    cylinder(d=4,h=plattenstaerke+3,$fn=100);
    translate([-durchmesser_innen_start/2-12,durchmesser_innen_start/2+plattenstaerke,plattenbreite/2-25])   
     rotate([90,0,0])
    cylinder(d=4,h=plattenstaerke+3,$fn=100);
}


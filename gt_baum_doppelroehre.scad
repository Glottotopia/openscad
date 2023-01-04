inner_diameter = 14;
winkel_oberroehre = 4; 
winkel_unterrroehre = 12; 
wandstaerke = 2; 
outer_diameter = inner_diameter + 2 * wandstaerke; 
muffenweite = 3; 
resolution = 120;
epsilon = .001;

oberlaenge = 124;
unterlaenge = 170;

delta_z = 18;

module muffe(){ 
    rotate([0,90,0])
    difference(){
        cylinder(h=wandstaerke,d=outer_diameter+2*muffenweite,$fn=resolution);
        translate([-epsilon,0,0])
            cylinder(h=wandstaerke+2*epsilon,d=(outer_diameter+inner_diameter)/2,$fn=resolution);
    }
}

module minimuffe(){ 
    rotate([0,90,0])
    difference(){
        cylinder(h=wandstaerke,d=8,$fn=resolution);
        translate([-epsilon,0,0])
            cylinder(h=wandstaerke+2*epsilon,d=4,$fn=resolution);
    }
}
         









 rotate([0,-90,90])
{
 rotate([0,90,0])
    rotate([90,0,0])
    difference(){
        rotate_extrude(angle=180,$fn=resolution)
            translate([11.2,0,0])
                difference(){
                    circle(d=outer_diameter);
                    circle(d=inner_diameter); 
                    translate([6,5])
                    circle(d=4.2,$fn=4); 
                    translate([6,-5])
                    circle(d=4.2,$fn=4);    
                    translate([-3,7])
                    circle(d=4.2,$fn=4);   
                    translate([-3,-7])
                    circle(d=4.2,$fn=4);    
                }    
//                translate([4.5,0,-14])
//                cylinder(d=16,h=30);
            } 
translate([wandstaerke/2,0,0])
cube([wandstaerke,16,6],center=true);
translate([0,10,0])
    minimuffe();      
translate([0,-10,0])
    minimuffe();           ;

translate([0,0,12])
muffe();  
translate([0,0,-12])
muffe();    

translate([0,0,25])
minimuffe();
translate([0,0,-25])
minimuffe();   
}          
            
            

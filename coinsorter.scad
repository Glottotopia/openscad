d_twoEUR = 25.75;
d_oneEUR = 23.25;
d_fiftyC = 24.25;
d_twentyC = 22.25;
d_tenC = 19.75;
d_fiveC = 21.25;
d_twoC = 18.75;
d_oneC =16.25;
coin_width=2;
spacing = 10;
totallength = d_twoEUR+d_oneEUR+d_fiftyC+d_twentyC+d_tenC+d_fiveC+d_twoC+d_oneC+7*spacing;
resolution=1000;

targetheight=120; 
rail_start=d_twoEUR;
rail_end=d_oneC/2-5;
rail_delta=rail_start-rail_end;

wall_thickness=1.5;
rail_thickness=1;

pi=3.1415;

degrees = 360;
steps = 1000;
slope = 45; 
radius = 70; 
circumference=pi*2*radius;
lattenbreite=circumference/steps*1.7;

step_angle = degrees/steps;
step_height = targetheight/steps;
step_rail = rail_delta/steps;
 
module zylinder(resolution=100){ 
//color("blue",.5)
difference(){
    cylinder(h=targetheight,r=radius,$fn=resolution);
    translate([0,0,-1])
    cylinder(h=targetheight+2,r=radius-wall_thickness,$fn=resolution);
}
}

module spirale(){
    for (i = [0:steps]){
        this_anglestep = i * step_angle;
        this_heightstep = i * step_height;
        this_length = rail_end+i*step_rail; 
        rotate([0,0,this_anglestep])
            translate([radius+wall_thickness,0,0])
                cylinder(d=6,h=this_heightstep,$fn=3);
        translate([0,0,i*step_height])
        rotate([0,0,this_anglestep])
            translate([radius+wall_thickness,0,3])
                union(){
                rotate([0,-slope,0]) 
//                        translate([wall_thickness,0,0])
//                                cube([coin_width*.3,lattenbreite,2]);                
                        translate([wall_thickness/2-1.5,0,-2]) 
                                cube([this_length,lattenbreite,rail_thickness]);
                rotate([0,slope-180,0]) 
//                        translate([wall_thickness,0,0])
//                                cube([coin_width*.3,lattenbreite,2]);                
                        translate([wall_thickness/2-1.5,0,2]) 
                                cube([this_length/2,lattenbreite,rail_thickness]);
                    }
        
    }
}

difference(){
    union(){
//        zylinder(resolution=resolution);
        translate([0,0,2])
        spirale();
    }
//    translate([0,0,targetheight])
//    cylinder(r=radius*2,h=targetheight);
}


//square([totallength,10]);
//cylinder(d1=20,d2=7,h=8);
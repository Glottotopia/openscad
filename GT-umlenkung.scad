include <gleise.scad>;
include <dimensions.scad>;
include <gleise.scad>;
include <plaettchen.scad>;

boardheight = 56;//50
boardddepth = 300;
armierungsstaerke = 10;
epsilon=0.01;
inner_diameter = 15;
wandstaerke = 2;
outer_diameter = inner_diameter + 2*wandstaerke;
resolution = 120;

module board(){
    translate([0,-boardddepth/2,-boardheight/2])
    color("#996633",.2)
    cube([800,300,boardheight]);
    
}

module clamp(){
    difference(){
        minkowski(){
        cube([28,20,boardheight+2*armierungsstaerke],center=true);
            sphere(6);
        }
        translate([25+epsilon,0,0])
        cube([50,50,boardheight],center=true);
        grumbl(solid=true);
    }
}

module roehre(laenge,solid=false){
    difference(){
        cylinder(h=laenge,d=outer_diameter,$fn=resolution);
        translate([0,0,-epsilon])
            cylinder(h=laenge+2*epsilon,d=solid?0:inner_diameter,$fn=resolution);
    }
}

module scheibe(solid=false){ 
    difference(){
        circle(d=outer_diameter,$fn=resolution);
//        translate([0,0,-epsilon])
            circle(d=solid?0:inner_diameter,$fn=resolution);
    }
}
        
    
    
//board();



     

steps = 100;   
module connector(){
    degree_step=90/steps;
    height_step=(boardheight/2+outer_diameter/2)/steps;
    width_step=(outer_diameter/2)/steps;
    depth_step=(offset/2)/steps;
    for (i=[0:steps])
        translate([width_step*i,depth_step*i,height_step*i])
        rotate([0,0,-i*degree_step])
                rotate([90,0,0])
                    translate([-30,0,0])
                        roehre(1);
    
}

module connector2(winkel=90,kruemmungsradius=10,solid=false){
    echo(solid)
    rotate_extrude(angle=winkel)
        translate([-kruemmungsradius,0,0])
            scheibe(solid=solid);
}
 

offset=50;

module grumbl(solid=false){
//    translate([0,0,3])
    union(){
        translate([0,0,boardheight/2+outer_diameter/2+3])
            rotate([0,90,0])
                roehre(25+epsilon,solid=solid);
        translate([0,-7.7,8])
        {
        translate([-outer_diameter/2-.5,-offset+10,15.5])
            rotate([0,90,90])
                roehre(10,solid=solid);
        translate([0,0,boardheight/2-wandstaerke]) 
            rotate([-140,0,0])    
                connector2(solid=solid);   
        translate([-outer_diameter/2-0.5,-30.5,65.5])
            rotate([180,-90,0])  
                connector2(winkel=40,kruemmungsradius=50,solid=solid,$fn=resolution);
        }
    }
}


module doppelring(){ 
    difference(){
        union(){
            difference(){
                cylinder(d=outer_diameter+4,h=8);
                translate([0,0,-epsilon])
                    cylinder(d=outer_diameter+.1,h=8+2*epsilon,$fn=resolution);
            }
            translate([0,0,3])
                difference(){
                    cylinder(d=outer_diameter+.01,h=5);
                    translate([0,0,-epsilon])
                        cylinder(d=inner_diameter+.1,h=5+2*epsilon,$fn=resolution);
                }      
        } 
        translate([0,-7.5,4])
            gleislochpaar();
        translate([0,6.4,4])
            gleislochpaar();
    }
}

module gleisloch(){
    cylinder(d=gleisdicke*1.02,h=8,$fn=resolution);
}


module gleislochpaar(){
        translate([5,0,0]) 
            gleisloch();
        translate([-5,0,0])    
            gleisloch();
}

module peg(height=10){
    cylinder(h=height,d=6, $fn=resolution);
}

module pegs(height=20){
   x=25;
   y=30;
    translate([0,0,-height]){
   peg(height=height);
   translate([x,0]) 
    peg(height=height);
   translate([0,y]) 
    peg(height=height);
   translate([x,y]) 
    peg(height=height);
    }
}
    
   


//translate([-14.9,-47,9])
//rotate([0,0,-90])
//gleis_mm(140);
//
//color("blue",.5)
//translate([-10,-45,23])
//rotate([90,0,0])
//doppelring();

//pegs();
//translate([-5,-20,0])
//    difference(){ 
//        cube([42,70,30]);  
//        translate([11-epsilon,12,0])  
//        union(){
//            translate([-10,-10,0])
//                translate([-1,40,15])
//                    rotate([0,0,90])
//                        connector2(kruemmungsradius=30,winkel=90,solid=true);
//            translate([19,30,30+epsilon])
//                rotate([0,-90,180])
//                connector2(kruemmungsradius=15,solid=true);
//        }
//        translate([30,48,24])
//            gleislochpaar();
//        
//        translate([-epsilon,2,15])
//            rotate([0,90,0])
//                gleislochpaar();
//}

translate([5,5,10])
rotate([0,90,0])
roehre(30);
//rotate([180,0,0])
gleis_mm(500,hooks=true,fluegel=false,double=false);




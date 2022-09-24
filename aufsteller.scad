mdfwidth=3;

bookwidth=185; //5 spiel
bookheight=245;
bookthickness=40;
stuetzenhoehe=140;

module book(){
    cube([bookwidth,bookheight,bookthickness]);
}

module fuss(){
    color("brown",.5)
//    linear_extrude(mdfwidth)
    difference(){
       union(){
           square([bookthickness+10,stuetzenhoehe+40]); 
           translate([40,28,0]) 
                square([100,50]);
        }       
        translate([0,40-mdfwidth]) 
            square([bookthickness/2,mdfwidth+.1]);
        rotate([0,0,-60])
            square([200,200]); 
        translate([bookthickness-mdfwidth*2,bookheight/2-20-4])
            square([mdfwidth+.1,bookheight/2+.1]);
    }    
}

module ruecken(){
    color("green",.5)
//    linear_extrude(mdfwidth)
    translate([-6,0,0])
    difference(){
        union(){
            square([bookwidth+12+mdfwidth+mdfwidth,stuetzenhoehe]);
        translate([mdfwidth+bookwidth/2-bookwidth/6,-2*mdfwidth])
            square([bookwidth/3,2*mdfwidth]);
        }     
        translate([2*mdfwidth,0])
            square([mdfwidth+.1,bookheight/4+.1]);
        translate([bookwidth+12-mdfwidth,0])
            square([mdfwidth+.1,bookheight/4+.1]);
        translate([130,80,0])
        scale([2,2])
        langsci();
    }
}

module langsci(){
    import("langsci_logo_nocolor.svg");
}
    

module unterseite(){
    color("red",.5)
//    linear_extrude(mdfwidth)
    translate([-6,0,0])
    difference(){
    square([bookwidth+12+mdfwidth+mdfwidth,bookthickness]);
    translate([mdfwidth+bookwidth/2-bookwidth/6-.1,mdfwidth])
        square([bookwidth/3+.1,mdfwidth+.1]);
    translate([2*mdfwidth,0])
        square([mdfwidth+.1,bookthickness/2+2]);
    translate([bookwidth+12-mdfwidth,0])
        square([mdfwidth+.1,bookthickness/2+2]);
    }
}


//rotate([60,0,0])
//book();
 
//rotate([56,0,0])
//union(){
//translate([0,0,bookthickness])
//rotate([0,90,0]) 
//fuss();
//    
    
//translate([bookwidth+mdfwidth,0,bookthickness])
//rotate([0,90,0]) 
//fuss();
//
//
//
//
//
//translate([0,40,mdfwidth]) 
//ruecken();


//translate([0,40,0])
//rotate([90,0,0])
//unterseite();
//} 
translate([140,6,0]) 
{
rotate([0,0,90])
ruecken();
translate([47,0])
rotate([0,0,90])
unterseite();
translate([228,0])
rotate([0,0,90])
fuss();
translate([257,220])
rotate([0,0,-90])
mirror([0,1,0])
fuss(); 
}





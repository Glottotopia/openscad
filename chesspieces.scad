kantenlaenge=200;
eckendurchmesser=2*kantenlaenge;
kante_bis_mitte=sqrt(kantenlaenge*kantenlaenge-(kantenlaenge/2)*(kantenlaenge/2)); 
echo(kante_bis_mitte);
kantendurchmesser = kante_bis_mitte*2;
feldhoehe = kante_bis_mitte/4;
feldbreite_grundlinie=kantenlaenge/8;
feldreieckhoehe=sqrt(feldhoehe*feldhoehe-feldhoehe/2*feldhoehe/2);
epsilon=0.01;

pawnheight=35;
officer_height=45;
royalty_height=55;
pawnbase_diameter=15;
pawnhead_diameter=12;
officerhead_diameter=15;
officer_base_diameter=20;

module pawn(){
    cylinder(d1=pawnbase_diameter,d2=0,h=pawnheight);
    translate([0,0,pawnheight-pawnhead_diameter/2]) 
        difference(){
            sphere(d=pawnhead_diameter);
            rotate([0,90,0])
                translate([0,0,-30])
                    cylinder(d=3,h=60,$fn=20);
            rotate([0,90,90])
                translate([0,0,-30])
                    cylinder(d=3,h=60,$fn=20);
        }
}


module bishop(){
    cylinder(d1=officer_base_diameter,d2=0,h=officer_height);
    translate([0,0,officer_height-officerhead_diameter/2]) 
        difference(){
            sphere(d=officerhead_diameter);
            translate([-5,0,5])
            rotate([0,60,0])
            cylinder(d=20,h=2);            
            rotate([0,90,0])
                translate([0,0,-30])
                    cylinder(d=3,h=60,$fn=20);
            rotate([0,90,90])
                translate([0,0,-30])
                    cylinder(d=3,h=60,$fn=20);
        }
}


module knight(){
    cylinder(d1=officer_base_diameter,d2=0,h=officer_height*.8);
    difference(){
        hull(){
            translate([0,0,officer_height*.7]) 
                    sphere(d=officerhead_diameter);     
            translate([0,12,officer_height-officerhead_diameter/2-15]) 
                sphere(d=6,$fn=8);
        }
        translate([2.5,5,officer_height-officerhead_diameter/2-3]) 
            sphere(d=4,$fn=80);
        translate([-2.5,5,officer_height-officerhead_diameter/2-3]) 
            sphere(d=4,$fn=80);
        translate([0,0,pawnheight*.9]){
        rotate([0,90,0])
            translate([0,0,-30])
                cylinder(d=3,h=60,$fn=20);
        rotate([0,90,90])
            translate([0,0,-30])
                cylinder(d=3,h=60,$fn=20);
        }
    }
}


module unicorn(){
    union(){
     knight();
        translate([0,6,pawnheight*.7])
            rotate([-50,0,0])
                cylinder(d1=8,d2=1,$fn=8,h=15); 
        translate([0,0,pawnheight])
            cylinder(d1=8,d2=12,h=5,$fn=8);
        
    }
}
    


module rook(){
    difference(){
        union(){
    rotate([0,0,45])
    cylinder(d1=officer_base_diameter,d2=officer_base_diameter,h=officer_height*.8,$fn=4); 
    rotate([0,0,45])
    cylinder(h=6,d=officer_base_diameter+3,$fn=4);
    translate([0,0,officer_height*.7])
        rotate([0,0,45])
        difference(){
            cylinder(h=6,d=officer_base_diameter+3,$fn=4);
            translate([0,0,2])
            cylinder(h=6,d=officer_base_diameter,$fn=4);
        }
    }    
    translate([0,0,30]){
    rotate([0,90,0])
        translate([0,0,-30])
            cylinder(d=3,h=60,$fn=20);
    rotate([0,90,90])
        translate([0,0,-30])
            cylinder(d=3,h=60,$fn=20);
    }
    }
}

module king(){
    cylinder(d1=officer_base_diameter,d2=officer_base_diameter,h=royalty_height);
    translate([0,0,pawnheight+pawnhead_diameter/2]) 
        cylinder(d1=officerhead_diameter,d2=officerhead_diameter+15,h=10);    
    translate([0,0,pawnheight+pawnhead_diameter+12])
        rotate([90,0,0])
            union(){
            difference(){
                cylinder(d=15,h=3,center=true,$fn=12);
                translate([3,3,-6/2])
                    cylinder(d=3,h=6,$fn=8);
                translate([3,-3,-6/2])
                    cylinder(d=3,h=6,$fn=8);
                translate([-3,3,-6/2])
                    cylinder(d=3,h=6,$fn=8);
                translate([-3,-3,-6/2])
                    cylinder(d=3,h=4,$fn=8);
            }   
            rotate([0,90,0])
                difference(){
                    cylinder(d=15,h=3,center=true,$fn=12);
                    translate([3,3,-6/2])
                        cylinder(d=3,h=6,$fn=8);
                    translate([3,-3,-6/2])
                        cylinder(d=3,h=6,$fn=8);
                    translate([-3,3,-6/2])
                        cylinder(d=3,h=6,$fn=8);
                    translate([-3,-3,-6/2])
                        cylinder(d=3,h=6,$fn=8);
                }    
        }           
}


module queen(){
    difference(){
        union(){
        cylinder(d1=officer_base_diameter,d2=officer_base_diameter,h=royalty_height); 
        translate([0,0,pawnheight+pawnhead_diameter-13]) 
            cylinder(d1=officerhead_diameter,d2=officerhead_diameter+15,h=20,$fn=6);
        }
        translate([0,0,officer_height]){
        rotate([0,90,30])
            translate([0,0,-30])
                cylinder(d=3,h=60,$fn=20);
        rotate([0,90,90])
            translate([0,0,-30])
                cylinder(d=3,h=60,$fn=20);
        rotate([0,90,150])
            translate([0,0,-30])
                cylinder(d=3,h=60,$fn=20);
        }
    }
}



module aufstellung(){ 

translate([-kantenlaenge/2+officer_base_diameter/2,-kante_bis_mitte+officer_base_diameter/2+2]) 
    queen();
translate([kantenlaenge/2-officer_base_diameter/2,-kante_bis_mitte+officer_base_diameter/2+2]) 
    king();

translate([-kantenlaenge/2+feldbreite_grundlinie+officer_base_diameter/2,-kante_bis_mitte+officer_base_diameter/2+4]) 
    bishop();
translate([kantenlaenge/2-feldbreite_grundlinie-officer_base_diameter/2,-kante_bis_mitte+officer_base_diameter/2+4]) 
    bishop();

translate([kantenlaenge/2-2*feldbreite_grundlinie-officer_base_diameter/2,-kante_bis_mitte+officer_base_diameter/2+8]) 
    rotate([0,0,90])
    knight();
translate([-kantenlaenge/2+2*feldbreite_grundlinie+officer_base_diameter/2,-kante_bis_mitte+officer_base_diameter/2+8]) 
    rotate([0,0,90])
    knight();

translate([kantenlaenge/2-3*feldbreite_grundlinie-officer_base_diameter/2-3,-kante_bis_mitte+officer_base_diameter/2+10]) 
    rook();    
translate([-kantenlaenge/2+3*feldbreite_grundlinie+officer_base_diameter/2,-kante_bis_mitte+officer_base_diameter/2+10]) 
    rook();
 
 
translate([-340,-35]){
translate([-kantenlaenge/2+3*feldbreite_grundlinie+officer_base_diameter/2,-kante_bis_mitte+feldhoehe+officer_base_diameter/2+5]) 
    pawn();
translate([-kantenlaenge/2+2*feldbreite_grundlinie+officer_base_diameter/2-4,-kante_bis_mitte+feldhoehe+officer_base_diameter/2-2]) 
    pawn();
translate([-kantenlaenge/2+1*feldbreite_grundlinie+officer_base_diameter/2-9,-kante_bis_mitte+feldhoehe+officer_base_diameter/2-9]) 
    pawn();
translate([-kantenlaenge/2+0*feldbreite_grundlinie+officer_base_diameter/2-12,-kante_bis_mitte+feldhoehe+officer_base_diameter/2-16]) 
    pawn();
// 
translate([kantenlaenge/2-3*feldbreite_grundlinie-officer_base_diameter/2,-kante_bis_mitte+feldhoehe+officer_base_diameter/2+5]) 
    pawn();
translate([kantenlaenge/2-2*feldbreite_grundlinie-officer_base_diameter/2+4,-kante_bis_mitte+feldhoehe+officer_base_diameter/2-2]) 
    pawn();
translate([kantenlaenge/2-1*feldbreite_grundlinie-officer_base_diameter/2+9,-kante_bis_mitte+feldhoehe+officer_base_diameter/2-9]) 
    pawn();
    
}
}



color("grey")
//aufstellung();

//color("brown")
//rotate([0,0,120])
//    aufstellung();
//
//color("beige")
//rotate([0,0,-120])
//    aufstellung();

//translate([-180,-70]){
//translate([33,-90])
//    rotate([0,0,90])
//unicorn();
//translate([-33,-90])
//    rotate([0,0,90])
//unicorn();
//translate([55,-100])
//pawn();
//translate([0,-88])
//pawn();
translate([-55,-100])
pawn(); 
//}

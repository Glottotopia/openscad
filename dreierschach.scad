kantenlaenge=200;
eckendurchmesser=2*kantenlaenge;
kante_bis_mitte=sqrt(kantenlaenge*kantenlaenge-(kantenlaenge/2)*(kantenlaenge/2)); 
echo(kante_bis_mitte);
kantendurchmesser = kante_bis_mitte*2;
feldhoehe = kante_bis_mitte/4;
feldbreite_grundlinie=kantenlaenge/8;
feldreieckhoehe=sqrt(feldhoehe*feldhoehe-feldhoehe/2*feldhoehe/2);
epsilon=0.01;
  

module dot(){
//color("red")
//circle(1,$fn=20);    
}

module speiche(){
    translate([0,-feldhoehe*0]) dot();
    translate([0,-feldhoehe*1]) dot();
    translate([0,-feldhoehe*2]) dot();
    translate([0,-feldhoehe*3]) dot();
    translate([0,-feldhoehe*4]) dot();
}


module viereck_1(){
        linear_extrude(rands(.9,1.1,1)[0])
            polygon([
           [0,0],
           [-4*feldbreite_grundlinie,0],
           [-4.5*feldbreite_grundlinie,kante_bis_mitte/8],
           [0,feldhoehe],
           [0,0]
        ]);
}


module viereck_2(){
        linear_extrude(rands(.9,1.1,1)[0])
            polygon([
           [0,feldhoehe],
           [-4.5*feldbreite_grundlinie,kante_bis_mitte/8],
           [-5*feldbreite_grundlinie,2*kante_bis_mitte/8],
           [0,2*feldhoehe],
           [0,feldhoehe]
        ]);
}


module viereck_3(){
        linear_extrude(rands(.9,1.1,1)[0])
            polygon([
           [0,2*feldhoehe],
           [-5*feldbreite_grundlinie,2*kante_bis_mitte/8],
           [-5.5*feldbreite_grundlinie,3*kante_bis_mitte/8],
           [0,3*feldhoehe],
           [0,2*feldhoehe]
        ]);
}



module viereck_4(){
        linear_extrude(rands(.9,1.1,1)[0])
            polygon([
           [0,3*feldhoehe],
           [-5.5*feldbreite_grundlinie,3*kante_bis_mitte/8],
           [-6*feldbreite_grundlinie,4*kante_bis_mitte/8],
           [0,4*feldhoehe],
           [0,4*feldhoehe]
        ]);
}

module grundlinie(){ 
    translate([0,-feldhoehe*4]){
        translate([-4*feldbreite_grundlinie,0]) dot();
        translate([-3*feldbreite_grundlinie,0]) dot();
        translate([-2*feldbreite_grundlinie,0]) dot();
        translate([-1*feldbreite_grundlinie,0]) dot();
        translate([-0*feldbreite_grundlinie,0]) dot();
//        
        translate([-4.5*feldbreite_grundlinie,kante_bis_mitte/8]) dot();
        translate([-5*feldbreite_grundlinie,2*kante_bis_mitte/8]) dot();
        translate([-5.5*feldbreite_grundlinie,3*kante_bis_mitte/8]) dot();
        translate([-6*feldbreite_grundlinie,4*kante_bis_mitte/8]) dot();
        color("green",.3)
            viereck_1();
        color("blue",.3)
        mirror([1,0])
            viereck_1();
//        
        color("blue",.3)
            viereck_2();
        color("green",.3)
        mirror([1,0])
            viereck_2();
//            
        color("green",.3)
            viereck_3();
        color("blue",.3)
        mirror([1,0])
            viereck_3();
    
        color("blue",.3)
            viereck_4();
        color("green",.3)
        mirror([1,0])
            viereck_4();
//        
}
}

for (i=[0:5]){
    rotate([0,0,i*60]){
       speiche();
       grundlinie();
    }
}


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
        sphere(d=pawnhead_diameter);
}


module bishop(){
    cylinder(d1=officer_base_diameter,d2=0,h=officer_height);
    translate([0,0,officer_height-officerhead_diameter/2]) 
        difference(){
            sphere(d=officerhead_diameter);
            translate([-5,0,5])
            rotate([0,60,0])
            cylinder(d=20,h=2);
        }
}


module knight(){
    cylinder(d1=officer_base_diameter,d2=0,h=officer_height*.8);
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
}


module rook(){
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

module king(){
    cylinder(d1=officer_base_diameter,d2=officer_base_diameter,h=royalty_height);
    translate([0,0,pawnheight+pawnhead_diameter/2]) 
        cylinder(d=officerhead_diameter+15,h=10);    
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
    cylinder(d1=officer_base_diameter,d2=officer_base_diameter,h=royalty_height); 
    translate([0,0,pawnheight+pawnhead_diameter-13]) 
        cylinder(d1=officerhead_diameter,d2=officerhead_diameter+15,h=20,$fn=6);
}

module aufstellung(){ 

translate([-kantenlaenge/2+officer_base_diameter/2,-kante_bis_mitte+officer_base_diameter/2+2]) 
    rook();
translate([kantenlaenge/2-officer_base_diameter/2,-kante_bis_mitte+officer_base_diameter/2+2]) 
    rook();

translate([-kantenlaenge/2+feldbreite_grundlinie+officer_base_diameter/2,-kante_bis_mitte+officer_base_diameter/2+4]) 
    bishop();
translate([kantenlaenge/2-feldbreite_grundlinie-officer_base_diameter/2,-kante_bis_mitte+officer_base_diameter/2+4]) 
    bishop();

translate([kantenlaenge/2-2*feldbreite_grundlinie-officer_base_diameter/2,-kante_bis_mitte+officer_base_diameter/2+8]) 
    knight();
translate([-kantenlaenge/2+2*feldbreite_grundlinie+officer_base_diameter/2,-kante_bis_mitte+officer_base_diameter/2+8]) 
    knight();

translate([kantenlaenge/2-3*feldbreite_grundlinie-officer_base_diameter/2,-kante_bis_mitte+officer_base_diameter/2+10]) 
    king();    
translate([-kantenlaenge/2+3*feldbreite_grundlinie+officer_base_diameter/2,-kante_bis_mitte+officer_base_diameter/2+10]) 
    queen();
 
 
 
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
translate([kantenlaenge/2-0*feldbreite_grundlinie-officer_base_diameter/2+12,-kante_bis_mitte+feldhoehe+officer_base_diameter/2-16]) 
    pawn();
    
}


//color("grey")
//aufstellung();
//
//color("brown")
//rotate([0,0,120])
//    aufstellung();
//
//color("beige")
//rotate([0,0,-120])
//    aufstellung();

rook();


//translate([-100,-10]) 
//    pawn();

//bishop();
 





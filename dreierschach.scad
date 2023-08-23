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


color("grey")
aufstellung();

color("brown")
rotate([0,0,120])
    aufstellung();

color("beige")
rotate([0,0,-120])
    aufstellung();

//rook();


//translate([-100,-10]) 
//    pawn();

//bishop();
 





//kantenlaenge=200;
kantenlaenge=220;
mdf_width=3;
aussen_extra=mdf_width*1;
kantenlaenge_schachtel=kantenlaenge+(2*aussen_extra);
eckendurchmesser=2*kantenlaenge;
kante_bis_mitte=sqrt(kantenlaenge*kantenlaenge-(kantenlaenge/2)*(kantenlaenge/2)); 
kurzer_durchmesser = kante_bis_mitte*2;
echo(kurzer_durchmesser);
kantendurchmesser = kante_bis_mitte*2;
feldhoehe = kante_bis_mitte/4;
feldbreite_grundlinie=kantenlaenge/8;
feldreieckhoehe=sqrt(feldhoehe*feldhoehe-feldhoehe/2*feldhoehe/2);
epsilon=0.01;
inner_height=18;
extra_hoehe=3;
outer_height=inner_height+extra_hoehe;
middle_hole_width=mdf_width*1.8;
aussparung_breite=20;
bodenplatte_hoehe=12;
  

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
        color("green",.3)
        mirror([1,0])
            viereck_1();
//        
        color("green",.3)
            viereck_2();
        color("green",.3)
        mirror([1,0])
            viereck_2();
//            
        color("green",.3)
            viereck_3();
        color("green",.3)
        mirror([1,0])
            viereck_3();
    
        color("green",.3)
            viereck_4();
        color("green",.3)
        mirror([1,0])
            viereck_4();
//        
}
}

//rotate([0,0,30])
//    for (i=[0:5]){
//        rotate([0,0,i*60]){
//           speiche();
//           grundlinie();
//        }
//    }



//module aufstellung(){ 
//
//translate([-kantenlaenge/2+officer_base_diameter/2,-kante_bis_mitte+officer_base_diameter/2+2]) 
//    rook();
//translate([kantenlaenge/2-officer_base_diameter/2,-kante_bis_mitte+officer_base_diameter/2+2]) 
//    rook();
//
//translate([-kantenlaenge/2+feldbreite_grundlinie+officer_base_diameter/2,-kante_bis_mitte+officer_base_diameter/2+4]) 
//    bishop();
//translate([kantenlaenge/2-feldbreite_grundlinie-officer_base_diameter/2,-kante_bis_mitte+officer_base_diameter/2+4]) 
//    bishop();
//
//translate([kantenlaenge/2-2*feldbreite_grundlinie-officer_base_diameter/2,-kante_bis_mitte+officer_base_diameter/2+8]) 
//    knight();
//translate([-kantenlaenge/2+2*feldbreite_grundlinie+officer_base_diameter/2,-kante_bis_mitte+officer_base_diameter/2+8]) 
//    knight();
//
//translate([kantenlaenge/2-3*feldbreite_grundlinie-officer_base_diameter/2,-kante_bis_mitte+officer_base_diameter/2+10]) 
//    king();    
//translate([-kantenlaenge/2+3*feldbreite_grundlinie+officer_base_diameter/2,-kante_bis_mitte+officer_base_diameter/2+10]) 
//    queen();
// 
// 
// 
//translate([-kantenlaenge/2+3*feldbreite_grundlinie+officer_base_diameter/2,-kante_bis_mitte+feldhoehe+officer_base_diameter/2+5]) 
//    pawn();
//translate([-kantenlaenge/2+2*feldbreite_grundlinie+officer_base_diameter/2-4,-kante_bis_mitte+feldhoehe+officer_base_diameter/2-2]) 
//    pawn();
//translate([-kantenlaenge/2+1*feldbreite_grundlinie+officer_base_diameter/2-9,-kante_bis_mitte+feldhoehe+officer_base_diameter/2-9]) 
//    pawn();
//translate([-kantenlaenge/2+0*feldbreite_grundlinie+officer_base_diameter/2-12,-kante_bis_mitte+feldhoehe+officer_base_diameter/2-16]) 
//    pawn();
//// 
//translate([kantenlaenge/2-3*feldbreite_grundlinie-officer_base_diameter/2,-kante_bis_mitte+feldhoehe+officer_base_diameter/2+5]) 
//    pawn();
//translate([kantenlaenge/2-2*feldbreite_grundlinie-officer_base_diameter/2+4,-kante_bis_mitte+feldhoehe+officer_base_diameter/2-2]) 
//    pawn();
//translate([kantenlaenge/2-1*feldbreite_grundlinie-officer_base_diameter/2+9,-kante_bis_mitte+feldhoehe+officer_base_diameter/2-9]) 
//    pawn();
//translate([kantenlaenge/2-0*feldbreite_grundlinie-officer_base_diameter/2+12,-kante_bis_mitte+feldhoehe+officer_base_diameter/2-16]) 
//    pawn();
//    
//}


//color("grey")
//aufstellung();

//color("brown")
//rotate([0,0,120])
//    aufstellung();
//
//color("beige")
//rotate([0,0,-120])
//    aufstellung();

//rook();


//translate([-100,-10]) 
//    pawn();

//bishop();

module durchbrett(offset1,offset2){
    color("blue",.3)
    translate([-kurzer_durchmesser/2-mdf_width,mdf_width/2,0])
        rotate([90,0,0])
            linear_extrude(mdf_width)
                difference(){
                    square([kurzer_durchmesser+2*mdf_width,inner_height]);
                        translate([kurzer_durchmesser/2+mdf_width-middle_hole_width/2,offset1*inner_height/3])
                            square([middle_hole_width,inner_height/3+.1]);
                        translate([kurzer_durchmesser/2+mdf_width-middle_hole_width/2,offset2*inner_height/3])
                            square([middle_hole_width,inner_height/3+.1]);
                        translate([mdf_width/2,0])
                            rotate([0,0,90])
                                saegezahn(width=3,odd=true);
                        translate([kurzer_durchmesser+mdf_width+mdf_width/2,0])
                            rotate([0,0,90])
                                saegezahn(width=3,odd=true);
                }
}

module saegezahn(count=6,step=6,width=3,odd=false){   
    for (i=[0:count]){
        translate([(i-2)*step*2-(odd?step:0),-width/2])
            square([step,width]);
    }    
}


//translate([142,186])
//rotate([0,0,90])
//    durchbrett(0,1);
//translate([161,186])
//rotate([0,0,90])
//    durchbrett(1,2);
//translate([180,186])
//rotate([0,0,90])
//    durchbrett(2,0);

difference(){
    color("red",.4)            
translate([212,-mdf_width/2,10])
cylinder(h=8,$fn=6,d=30);


color("blue",.4)            
translate([200,-mdf_width/2,10])
cylinder(h=8,$fn=6,d=30);

rotate([0,0,90])
for (i=[0:5]){
    rotate([0,0,i*60])
//    translate([0,i*33.5,0])
    boxseite();
}
}

module boxseite(){
    translate([kante_bis_mitte-epsilon,-kantenlaenge/2,0])
        rotate([90,0,90])
            linear_extrude(mdf_width)
                difference(){
                        translate([-aussen_extra,-bodenplatte_hoehe])
                            square([kantenlaenge_schachtel,outer_height+bodenplatte_hoehe]);
//                    
                        translate([-mdf_width,outer_height-extra_hoehe*2+epsilon])
                            square([aussparung_breite,extra_hoehe*2]);
                        translate([kantenlaenge-aussparung_breite+epsilon,outer_height-extra_hoehe*2+epsilon])
                            square([aussparung_breite+mdf_width,extra_hoehe*2]);
//                    
                        translate([kantenlaenge_schachtel/2-mdf_width,0])
                            rotate([0,0,90])
                                saegezahn(width=3);
//                    
                        translate([-aussen_extra/2,0])
                            rotate([0,0,90])
                                saegezahn(width=3);
                        translate([kantenlaenge+aussen_extra+mdf_width/2-3,0])
                            rotate([0,0,90])
                                saegezahn(width=6,odd=true);
//                    
                    translate([kantenlaenge_schachtel/4,38])
                    circle(30);
                    translate([3*kantenlaenge_schachtel/4-mdf_width*2,38])
                    circle(30);
                }
            }
            




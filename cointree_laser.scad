include <saegezahn.scad>;

max_=30;
d_2EUR=25.75;
d_50c=24.25;
d_1EUR=23.25;
d_20c=22.25;
d_5c=21.25;
d_10c=19.75;
d_2c=18.75;
d_1c=16.25;
max_muenzendicke=2.125;
rinnenbreite=2.5;
mdf_width=3;
anlauf=20;
//auslauf=20;
auslauf=3;
breite = 303;

function reverse(list) = [for (i = [len(list)-1:-1:0]) list[i]];
    
coins1 = [max_,d_2EUR, d_50c,d_1EUR,d_20c,d_5c,d_10c,d_2c,d_1c];

coins = reverse(coins1);
hoehezuschlag_unten = 3;
hoehezuschlag_oben = 3;

//anstellwinkel_x = -20; 
anstellwinkel_x = -50;  //20 is not enough
anstellwinkel_y = -17;  //-7 is not enough

spacing = 9; 
spielfaktor=1.02;


height = hoehezuschlag_unten + d_2EUR + hoehezuschlag_oben;

epsilon=0.001;

cylinder_height=40;
//wandstaerke=2;
wandstaerke=0;

function cat(L1, L2) = [for(L=[L1, L2], a=L) a];
    
function sum(v, i = 0, r = 0) = i < len(v) ? sum(v, i + 1, r + v[i]) : r;

 function partial(list,start,end) = [for (i = [start:end]) list[i]];
  
c2 = [for (i=[0:8]) sum(partial(coins,0,i))+i*spacing] ; 

total_length_coin_holes = c2[8]+15;

module roehre(d,wandstaerke,h){
//    difference(){
        cylinder(d=d+wandstaerke,h=cylinder_height,$fn=100);
//        translate([0,0,-epsilon])
//        cylinder(d=d,h=cylinder_height+2*epsilon);
//    }´
}
 



module muenzrutsche(){
    translate([0,-30,0])
          rotate([anstellwinkel_x,-anstellwinkel_y,0]){
            rotate([90,0,0]){ 
                    linear_extrude(3)
                       difference(){
                           translate([0,-14,0])
                                square([anlauf+total_length_coin_holes+auslauf,54]);     
//                        translate([-38,20])
//                            rotate([0,0,-78])
//                                square([140,39]);
                           translate([0,0,0])
                                square([anlauf,3]);     
                            translate([total_length_coin_holes+auslauf,0])
                                square([auslauf,3]);     
                         //saegezaehne
                        translate([0,-14+4,0])
                            rotate([0,0,-90])
                                saegezahnstrahl(4,20,400,offset=0) ;
                        translate([0,30+14-4,0])
                            rotate([0,0,-90])
                                saegezahnstrahl(4,20,400,offset=0) ;
                        //roehren 
                        translate([anlauf,0,0])
                            for (i=[0:len(coins)-1]){ 
                                length = coins[i]*spielfaktor;
                                current_length=c2[i];
                                translate([current_length,hoehezuschlag_unten+length/2])
                                    circle(d=length,$fn=100);   
                            }
                        }  
                    } 
            color("blue")
                translate([0,0,3])
                    rotate([180,0,0])
                        linear_extrude(3)
                            difference(){
                                square([anlauf+total_length_coin_holes+auslauf,13.75]);    
                                translate([anlauf,0])
                                    square([total_length_coin_holes,3]);             
                            }
//                            
        } 
//         rotate([anstellwinkel_x,-anstellwinkel_y,0])
//                translate([0,8,-80])
//                    cube([anlauf+total_length_coin_holes+5,80,100]); 
        }  
//    aufhänglöcher 
//    translate([50,0,10])   
//        rotate([-90,0,0])    
//            cylinder(h=50,d=4,$fn=100);  
//    translate([150,0,-20])   
//        rotate([-90,0,0])    
//            cylinder(h=50,d=4,$fn=100);
//    translate([265,0,-54.5])   
//        rotate([-90,0,0])    
//            cylinder(h=50,d=4,$fn=100); 

muenzrutsche();         
color("brown")
translate([0,0,-130])
    rotate([90.0,0])        
        linear_extrude(mdf_width)        
            difference(){
                square([breite,160]);
//                umrahmung
                translate([0,0,0])
                    saegezahnstrahl(mdf_width,20,400,offset=0) ;                
                translate([360-mdf_width,0,0])
                    saegezahnstrahl(mdf_width,20,400,offset=0) ;     
//                translate([0,mdf_width,0])
//                    rotate([0,0,-90])
//                        saegezahnstrahl(mdf_width,20,400,offset=0) ;
                translate([0,160,0])
                    rotate([0,0,-90])
                        saegezahnstrahl(mdf_width,20,400,offset=0) ;
//                schienenloecher
                translate([0,160,0])
                    rotate([0,0,-107.1])
                        saegezahnstrahl(6,20,400,offset=-2.56) ;
//                  aufhaengloecher
                translate([30,30])
                    circle(1,$fn=100);
                translate([270,30])
                    circle(1,$fn=100);
                translate([30,130])
                    circle(1,$fn=100);
                translate([270,130])
                    circle(1,$fn=100);
            }
color("grey",.25)
translate([0,-39,-130])
    rotate([90.0,0])        
        linear_extrude(mdf_width)        
            difference(){
                square([breite,160]);
                    saegezahnstrahl(mdf_width,20,400,offset=0) ;      
//                umrahmung          
                translate([breite-mdf_width,0,0])
                    saegezahnstrahl(mdf_width,20,400,offset=0) ;
//                translate([0,mdf_width,0])
//                    rotate([0,0,-90])
//                        saegezahnstrahl(mdf_width,20,400,offset=0) ;
                translate([0,160,0])
                    rotate([0,0,-90])
                        saegezahnstrahl(mdf_width,20,400,offset=0) ;
//                schienenloecher
                translate([-2,126.9,0])
                    rotate([0,0,-107.1])
                        saegezahnstrahl(5.5,20,370,offset=-2.95) ;
            }
color("green")            
        translate([0,-39-mdf_width,30-mdf_width])
            linear_extrude(mdf_width)
                difference(){
                    square([breite,39+mdf_width]);
                    translate([0,mdf_width,0])
                        rotate([0,0,-90])
                            saegezahnstrahl(mdf_width,20,400,offset=1) ;
                    translate([0,39+mdf_width,0])
                        rotate([0,0,-90])
                            saegezahnstrahl(mdf_width,20,400,offset=1) ;
//                    schlitz
                    translate([5,10])
                        square([d_2EUR*spielfaktor,max_muenzendicke*spielfaktor]);
                }
color("orange",.95)            
        translate([mdf_width,0,30])
        rotate([0,90,180])
            linear_extrude(mdf_width)
                difference(){
                    square([160,39+mdf_width]);
                    translate([0,mdf_width,0])
                        rotate([0,0,-90])
                            saegezahnstrahl(mdf_width,20,400,offset=0) ;
                    translate([0,39+mdf_width,0])
                        rotate([0,0,-90])
                            saegezahnstrahl(mdf_width,20,400,offset=0) ;
                    translate([0,-4])
                        rotate([0,0,46.5])
                            square([55,44]);
                }
color("pink",.95)            
        translate([breite,0,30])
        rotate([0,90,180])
            linear_extrude(mdf_width)
                difference(){
                    square([160,39+mdf_width]);
                    translate([0,mdf_width,0])
                        rotate([0,0,-90])
                            saegezahnstrahl(mdf_width,20,400,offset=0) ;
                    translate([0,39+mdf_width,0])
                        rotate([0,0,-90])
                            saegezahnstrahl(mdf_width,20,400,offset=0) ; 
                    translate([98,0])
                        rotate([0,0,52])
                            square([30,4.5]);
//                 abschlussnegativ
                   translate([mdf_width,0])
                        rotate([0,0,90])
                            square([39+mdf_width,mdf_width]);
                }
translate([20,-30,15])
    rotate([90,0,0])                
        linear_extrude(max_muenzendicke)                
            circle(d=d_2EUR,$fn=100);
color("brown")
translate([20,-31,15])
    rotate([90,0,0])                
        linear_extrude(max_muenzendicke)                
            circle(d=d_1c,$fn=100);
 
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
anlauf=17;
//auslauf=20;
auslauf=17;
breite = 300;
tiefe = 39;
offsets=[25,48,75,102,131,161,191,222,256,292] ;
kamin_hoehe=[];

function reverse(list) = [for (i = [len(list)-1:-1:0]) list[i]];
    
coins1 = [max_,d_2EUR, d_50c,d_1EUR,d_20c,d_5c,d_10c,d_2c,d_1c];

coins = reverse(coins1);
hoehezuschlag_unten = 3;
hoehezuschlag_oben = 3;

//anstellwinkel_x = -20; 
anstellwinkel_x = -50;  //20 is not enough
anstellwinkel_y = -17;  //-7 is not enough

spacing = 8; 
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


kamin_start_height=114;
kamin_reduction_factor=.31;


module roehre(d,wandstaerke,h){
//    difference(){
        cylinder(d=d+wandstaerke,h=cylinder_height,$fn=100);
//        translate([0,0,-epsilon])
//        cylinder(d=d,h=cylinder_height+2*epsilon);
//    }´
}
 

module reling(){    
            color("blue")
                translate([0,3,3])
                    rotate([90,0,0])
                        linear_extrude(3)
                            difference(){
                                union(){
                                    square([anlauf+total_length_coin_holes+auslauf,10.75]);    
                                    translate([10,-mdf_width])
                                        square([15,3]);             
                                    translate([breite-9.5,-mdf_width])
                                        square([15,3]);             
                                }
                                translate([-14,-10])
                                    rotate([0,0,14])
                                        square([20,20]);
                                translate([breite+auslauf-7,-5])
                                    rotate([0,0,14])
                                        square([20,20]);
                            }
}

module muenzrutsche(){
    translate([0,-30,0])
          rotate([anstellwinkel_x,-anstellwinkel_y,0])
    {
            rotate([90,0,0])
        { 
                    linear_extrude(3)
                       difference(){
                           translate([0,-14,0])
                                square([anlauf+total_length_coin_holes+auslauf,54]);     
//                           anschraegung links
                        translate([-40,20])
                            rotate([0,0,-78])
                                square([140,39]);
//                           anschraegung rechts
                        translate([breite,50])
                            rotate([0,0,-79])
                                square([140,39]);
//                           relingloecher
                           translate([10,0,0])
                                square([15,3]);     
                            translate([total_length_coin_holes+10,0])
                                square([15,3]);     
                         //saegezaehne
                        translate([0,-14+4,0])
                            rotate([0,0,-90])
                                saegezahnstrahl(5,20,400,offset=0) ;
                        translate([0,30+14-4,0])
                            rotate([0,0,-90])
                                saegezahnstrahl(5,20,400,offset=0) ;
                        //roehren 
                        translate([anlauf,0,0])
                            for (i=[0:len(coins)-1]){ 
                                length = coins[i]*spielfaktor;
                                current_length=c2[i];
                                translate([current_length,hoehezuschlag_unten+length/2])
                                    circle(d=length,$fn=100);   
                            }
//                    einhaengloecher
                        translate([anlauf,0,0])
                            for (i=[0:len(coins)-1]){ 
                                length = coins[i]*spielfaktor;
                                current_length=c2[i];
                                translate([current_length-coins[i]/2,-7])
                                    square([2,3]);   
                                translate([current_length+coins[i]/2,-7])
                                    square([2,3]);   
                                translate([current_length-coins[i]/2,30])
                                    square([2,3]);   
                                translate([current_length+coins[i]/2,30])
                                    square([2,3]);   
                            }
                        }                       
                            reling();          
                    } 
        }  
    }  
    
module einwurf(){
    color("red",.8)
    translate([20,-20,30]){
        difference(){
            scale([1,1,2])
                sphere(20,$fn=100);
                translate([-20,-20,-40])
                    cube([40,40,40]);
            rotate([-30,0,0])
                translate([-20,-40,-20])
                    cube([40,40,80]);
    //        rotate([0,0,10])
            rotate([-110,0,0])
                translate([0,-5,-0.5])
                    linear_extrude(7)
                        square([30,100],center=true);        
        }
        translate([-7.5,10,-3])
        cube([15,3,3]);
    }
}
 
    
module braune_platte(){
    color("brown")
    translate([0,0,-130])
        rotate([90.0,0])        
            linear_extrude(mdf_width)
    {        
                difference(){
                union(){
                    square([breite,160]);
                    for (o=offsets){ 
                        translate([o,-1]) 
                        difference(){
                                circle(8);
                            translate([0,-2]) 
                                circle(3,$fn=100) ; 
                        }
                    }
                }
    //                umrahmung
                    translate([0,0,0])
                        saegezahnstrahl(mdf_width,20,400,offset=0) ;                
                   translate([breite-mdf_width,0,0])
                        saegezahnstrahl(mdf_width,20,400,offset=0) ;     
    //                translate([0,mdf_width,0])
    //                    rotate([0,0,-90])
    //                        saegezahnstrahl(mdf_width,20,400,offset=0) ;
                    translate([0,160,0])
                        rotate([0,0,-90])
                            saegezahnstrahl(mdf_width,20,400,offset=0) ;
                    translate([0,2*mdf_width,0])
                        rotate([0,0,-90])
                            saegezahnstrahl(mdf_width,20,400,offset=0) ;
    //                schienenloecher
                    translate([0,160,0])
                        rotate([0,0,-107.1])
                            saegezahnstrahl(6,20,400,offset=-2.56) ;
                    for (o=offsets){    
                        this_height=kamin_start_height-o*kamin_reduction_factor; 
                        translate([o-mdf_width,2])  
                            difference(){                
                                saegezahnstrahl(mdf_width,20,370,offset=-2.95) ;    
                                translate([0,this_height])
                                    square([12,200]);
                            }
                    }                   
    //                  aufhaengloecher
                    translate([145,42])
                        circle(1.5,$fn=100); 
                    }                    
                    translate([50,160]) 
                            difference(){
                                circle(10,$fn=100);
                                translate([0,4])
                                    circle(1.5,$fn=100);
                            }                                
                    translate([250,160]) 
                            difference(){
                            circle(10,$fn=100);
                            translate([0,4])
                                circle(1.5,$fn=100);
                            }
            }
        }

module plexi_platte(){
    color("grey",.25)
    translate([0,-39,-130])
        rotate([90.0,0]){        
            linear_extrude(mdf_width)  {    
                difference(){
                    union(){
                        square([breite,160]);                                  
                        for (o=offsets){ 
                            translate([o,-1]) 
                            difference(){
                                    circle(8);
                                translate([0,-2]) 
                                    circle(3,$fn=100) ; 
                            }
                        }
                    }
                        saegezahnstrahl(mdf_width,20,400,offset=1) ;      
    //                umrahmung          
                    translate([breite-mdf_width,0,0])
                        saegezahnstrahl(mdf_width,20,400,offset=0) ; 
                    translate([0,160,0])
                        rotate([0,0,-90])
                            saegezahnstrahl(mdf_width,20,400,offset=0) ;
                    translate([0,2*mdf_width,0])
                        rotate([0,0,-90])
                            saegezahnstrahl(mdf_width,20,400,offset=0) ;
    //                schienenloecher
                    translate([-2,126.9,0])
                        rotate([0,0,-107.1])
                            saegezahnstrahl(5.5,20,370,offset=-2.95) ;    
            for (o=offsets){    
                this_height=kamin_start_height-o*kamin_reduction_factor; 
                translate([o-mdf_width,2])  
                    difference(){                
                        saegezahnstrahl(mdf_width,20,370,offset=-2.95) ;    
                        translate([0,this_height])
                            square([12,200]);
                    }
            }         
            translate([145,42])
                circle(5,$fn=100);  
//                translate([-100,-88])
//                    rotate(anstellwinkel_y)
//                        square([400,200]);
            }
        }
    }
}
        
module gruene_platte(){        
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
                    translate([5,25])
                        square([30,4]);
//                    schlitz
                    translate([12.5,32])
                        square([15,3]);
//                    anschluss orange
                    translate([0,0])
                        square([mdf_width+.01,9.5]);
                    translate([0,29.5+mdf_width])
                        square([mdf_width+.01,9.5]);
//                    anschluss pink
                    translate([breite-mdf_width-.01,0])
                        square([mdf_width+.01,9.5]);
                    translate([breite-mdf_width-.01,29.5+mdf_width])
                        square([mdf_width+.01,9.5]);
                }
            }      
  

module orangene_platte(){
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
                            translate([0,-320])
                                saegezahnstrahl(mdf_width,20,400,offset=1) ;
//                 abschlussnegativ
                   translate([mdf_width,9.5])
                        rotate([0,0,90])
                            square([20+mdf_width,mdf_width+epsilon]); 
                   translate([160-mdf_width,9.5])
                        rotate([0,0,90])
                            square([20+mdf_width,mdf_width+epsilon]); 
                }
            }
            
module pinke_platte(){            
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
//                    translate([98,0])
//                        rotate([0,0,52])
//                            square([30,4.5]);
//                 abschlussnegativ
                   translate([mdf_width,9.5])
                        rotate([0,0,90])
                            square([20+mdf_width,mdf_width+epsilon]);
                   translate([160-mdf_width,9.5])
                        rotate([0,0,90])
                            square([20+mdf_width,mdf_width+epsilon]); 
                }       
            }
            


module bac(width,height){
    difference(){
        minkowski(){
           difference(){
                cube([width-2,tiefe-mdf_width-2,height-2]) ;
                translate([mdf_width-1,mdf_width-1,mdf_width-1])
                    cube([width-2*mdf_width,tiefe-3*mdf_width,height]);
           }
           sphere(1);
//           sphere(1,$fn=33);
           }
       translate([-1,18,7])
            rotate([0,90,0])
                cylinder(h=1000,d=6,$fn=30);
       }
}


module lila_platte(){      
    color("purple")            
        translate([0,-39-mdf_width,-130+mdf_width])
            linear_extrude(mdf_width)
                difference(){
                    square([breite,39+mdf_width]);
                    translate([0,mdf_width,0])
                        rotate([0,0,-90])
                            saegezahnstrahl(mdf_width,20,400,offset=1) ;
                    translate([0,39+mdf_width,0])
                        rotate([0,0,-90])
                            saegezahnstrahl(mdf_width,20,400,offset=1) ;
//                    anschluss orange
                    translate([0,0])
                        square([mdf_width+.01,9.5]);
                    translate([0,29.5+mdf_width])
                        square([mdf_width+.01,9.5]);
//                    anschluss pink
                    translate([breite-mdf_width-.01,0])
                        square([mdf_width+.01,9.5]);
                    translate([breite-mdf_width-.01,29.5+mdf_width])
                        square([mdf_width+.01,9.5]);     
                    translate([22,7.5])
                        square([breite-2*12-6,27]);
//                    for (o=offsets){
//                        translate([o+13.5,7.5+13.5,0])
//                            square([27,27]);
//                            circle(13.5);
//                        translate([o-3,7.5-3])
//                            square([3,3]);
//                        translate([o+27,7.5-3,])
//                            square([3,3]);
//                        translate([o-3,27+7.5])
//                            square([3,3]);
//                        translate([o+27,27+7.5])
//                            square([3,3]);
//                        }
                }
            }                


module kamin(height){
    color("black"){
        translate([0,-tiefe,-130+mdf_width])
            rotate([0,-90,0])
                linear_extrude(3)
                    difference(){
                        translate([0,-3])
                            square([height+3,42]);    
                        translate([0,-3])
                            square([3,7.5]);
                        translate([0,30+1.5])
                            square([3,9]); 
                        rotate([0,0,-90])
                            saegezahnstrahl(mdf_width,20,400,offset=0) ; 
                        translate([0,39])
                            rotate([0,0,-90])
                                saegezahnstrahl(mdf_width,20,400,offset=0) ; 
                    }
//        translate([27+mdf_width,-tiefe+1.5,-130-mdf_width])
//            rotate([0,-90,0])
//                linear_extrude(3)
//                    difference(){
//                        translate([0,0])
//                            square([height+3,33]);    
//                        translate([0,3])
//                            square([3,27]);
//                    }
//                }
//                
//    color("black",.3){
//        translate([mdf_width+27,-tiefe+mdf_width+1.5,-130])
//            rotate([0,-90,90])
//                linear_extrude(3)
//                    square([height,33]);   
//        translate([mdf_width+27,-mdf_width-1.5,-130])
//            rotate([0,-90,90])
//                linear_extrude(3)
//                    square([height,33]);    
    }
}

//color("gray",.5)
//translate([mdf_width+2,-tiefe+1,-130]){
//    translate([15,0,0])
//        bac(25,108);
//    translate([40,0,0])
//        bac(25,97);
//    translate([65,0,0])
//        bac(30,86);
//    translate([95,0,0])
//        bac(30,75);
//    translate([125,0,0])
//        bac(30,64);
//    translate([155,0,0])
//        bac(30,53);
//    translate([185,0,0])
//        bac(30,42);
//    translate([215,0,0])
//        bac(77,31); 
//}
 
 
            
muenzrutsche();   
//////reling();    
//braune_platte();       
plexi_platte();
gruene_platte();    
einwurf();        
//orangene_platte();   
pinke_platte();       
lila_platte();   
         
for (o=offsets){
    this_height=kamin_start_height-o*kamin_reduction_factor;
    translate([o,0,0]) 
        kamin(this_height);
}
//
//translate([20,-18,18])
//    rotate([70,0,0])                
//        linear_extrude(max_muenzendicke)                
//            circle(d=d_2EUR,$fn=100);
//color("brown")
//translate([20,-18.5,17])
//    rotate([66,0,0])                      
//        linear_extrude(max_muenzendicke)                
//            circle(d=d_1c,$fn=100);
 
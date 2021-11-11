mdfwidth = 3;
schlitztwidth = mdfwidth*.97;
separatorwidth = mdfwidth; 
//contentlength = 3000;
mdfpercardheight = 29;
plaettchenperhex = 8; 
pseudohexforplaettchen = 6;
totalplaettchen = 108;
plaettchendurchmesser1 = 76;
plaettchendurchmesser2 = 86;
spiel=3;
plaettchendurchmesser3 = plaettchendurchmesser2+spiel+mdfwidth*2;
hexpileheight = 55;
pseudohexheight = 21;
cardheight = 91;
cardwidth = 60;
cardthickness = .32;
cardnumber = 110;
cardpilethickness = cardnumber*cardthickness; 
numberofhextiles = 18;
trapezeupperwidth=22;
trapezelowerwidth=39;
trapezeheight=15;
trapezecolors = ["yellow","orange","brown","red"];
totalheight = pseudohexheight+hexpileheight+cardheight;
kantenlaenge= 45;


module wanne(){
    translate([-kantenlaenge/2-mdfwidth,plaettchendurchmesser1/2+mdfwidth,-mdfwidth])
        rotate([90,0,0])
            linear_extrude(mdfwidth)
                union(){
                        translate([0,0,mdfwidth])
                            difference(){
                                translate([mdfwidth,0])
                                square([kantenlaenge,totalheight]);                     
//                                translate([1.5,0])
//                                    square([mdfwidth,50]);
//                                translate([kantenlaenge+1.5,0])
//                                    square([mdfwidth,50]);
                                translate([4,73])
                                    square([schlitztwidth,15]);
                                translate([44,73])
                                    square([schlitztwidth,15]);
                                translate([4,142])
                                    square([schlitztwidth,15]);
                                translate([44,142])
                                    square([schlitztwidth,15]);
                            }
                            translate([kantenlaenge/2-4,-mdfwidth]) //#FIXME
                                square([15,mdfwidth]);
                            translate([kantenlaenge/2-4,totalheight]) //#FIXME
                                square([15,mdfwidth]);
                        }
    rotate([0,0,60])
        translate([-kantenlaenge/2-mdfwidth,plaettchendurchmesser1/2+mdfwidth,-mdfwidth])
            rotate([90,0,0])
                linear_extrude(mdfwidth)
                    union(){
                        translate([0,0,mdfwidth])
                            translate([mdfwidth,0])
                            difference(){
                                square([kantenlaenge,totalheight]);                     
//                                translate([1.5,0])
//                                    square([mdfwidth,pseudohexheight/2+mdfwidth/2]);
//                                translate([kantenlaenge+1.5,50])
//                                    square([mdfwidth,200]);             
//                                translate([1.5,125])
//                                    square([mdfwidth,130]);
                            }
                            translate([kantenlaenge/2-4,-mdfwidth]) //#FIXME
                                square([15,mdfwidth]);
                            translate([kantenlaenge/2-4,totalheight]) //#FIXME
                                square([15,mdfwidth]);
                        }
    rotate([0,0,-60])
        translate([-kantenlaenge/2-mdfwidth,plaettchendurchmesser1/2+mdfwidth,-mdfwidth])
            rotate([90,0,0])
                linear_extrude(mdfwidth)
                    union(){
                        translate([0,0,mdfwidth])
                            translate([mdfwidth,0])
                            difference(){
                                square([kantenlaenge,totalheight]);                     
//                                translate([1.5,50])
//                                    square([mdfwidth,200]);                
//                                translate([kantenlaenge,125])
//                                    square([mdfwidth,130]);
//                                translate([kantenlaenge+1.5,0])
//                                    square([mdfwidth,pseudohexheight/2+mdfwidth/2]);
                            }
                            translate([kantenlaenge/2-4,-mdfwidth]) //#FIXME
                                square([15,mdfwidth]);
                            translate([kantenlaenge/2-4,totalheight]) //#FIXME
                                square([15,mdfwidth]);
                        }
}

module antiwanne(){
    rotate([0,0,180])
        translate([-kantenlaenge/2-mdfwidth,plaettchendurchmesser1/2+mdfwidth,0])
            rotate([90,0,0])
                linear_extrude(mdfwidth)
                    union(){
                        translate([0,0,mdfwidth])
                            difference(){
                                square([kantenlaenge,totalheight]);
                                //aussparungen
//                                translate([1.5,pseudohexheight/2+mdfwidth/2])
//                                    square([mdfwidth,pseudohexheight/2+mdfwidth/2]);
//                                translate([kantenlaenge+1.5,pseudohexheight/2+mdfwidth/2])
//                                    square([mdfwidth,pseudohexheight/2+mdfwidth/2]);
                                //oberseite
//                                    translate([-1,pseudohexheight+mdfwidth])
//                                        square([kantenlaenge+3*mdfwidth,hexpileheight]);  
//                                    translate([-1,pseudohexheight+mdfwidth+hexpileheight])
//                                        square([kantenlaenge+3*mdfwidth,cardheight+mdfwidth*2]);   
                            }
                        translate([kantenlaenge/2-4,-2*mdfwidth]) //#FIXME
                            square([15,mdfwidth*2]); 
                        translate([kantenlaenge/2-4,totalheight]) //#FIXME
                            square([15,mdfwidth*2]);
                    }
    rotate([0,0,120])
        translate([-kantenlaenge/2-mdfwidth,plaettchendurchmesser1/2+mdfwidth,0])
            rotate([90,0,0])
                linear_extrude(mdfwidth)  
                    union(){
                        translate([0,0,mdfwidth])                  
                            difference(){
                                square([kantenlaenge,totalheight]);
                                //aussparungen
//                                translate([1.5,0])
//                                    square([mdfwidth,pseudohexheight/2+mdfwidth/2]);
//                                translate([kantenlaenge+1.5,pseudohexheight/2+mdfwidth/2])
//                                    square([mdfwidth,pseudohexheight/2+mdfwidth/2]);
                                //oberseite
//                                translate([-1,pseudohexheight+mdfwidth])
//                                    square([kantenlaenge+3*mdfwidth,hexpileheight]);   
//                                translate([kantenlaenge+1,pseudohexheight+pseudohexheight+mdfwidth])
//                                    square([mdfwidth*1.2,80]);
                            }
                        translate([kantenlaenge/2-4,-2*mdfwidth]) //#FIXME
                            square([15,mdfwidth*2]);
                        translate([kantenlaenge/2-4,totalheight]) //#FIXME
                            square([15,mdfwidth*2]);
                        }
    rotate([0,0,-120])
        translate([-kantenlaenge/2-mdfwidth,plaettchendurchmesser1/2+mdfwidth,0])
            rotate([90,0,0])
                linear_extrude(mdfwidth)  
                    union(){
                        translate([0,0,mdfwidth])                  
                            difference(){
                                square([kantenlaenge,totalheight]);
                                //aussparungen
//                                translate([1.5,pseudohexheight/2+mdfwidth/2])
//                                    square([mdfwidth,pseudohexheight/2+mdfwidth/2]);
//                                translate([kantenlaenge+1.5,0])
//                                    square([mdfwidth,pseudohexheight/2+mdfwidth/2]);
                                //oberseite
//                                translate([-1,pseudohexheight+mdfwidth])
//                                    square([kantenlaenge+3*mdfwidth,hexpileheight]);    
//                                translate([2,pseudohexheight+pseudohexheight+mdfwidth])
//                                    square([mdfwidth*1.2,80]);                     
                            }
                        translate([kantenlaenge/2-4,-2*mdfwidth]) //#FIXME
                            square([15,mdfwidth]);
                        translate([kantenlaenge/2-4,totalheight]) //#FIXME
                            square([15,mdfwidth*2]);
                        }
}

module hextileseparator(){
//    cube([trapezelowerwidth,mdfwidth,(1+pseudohexforplaettchen)*mdfwidth]); 
    rotate([90,0,0])
    linear_extrude(mdfwidth)
        union(){
        square([trapezelowerwidth, (1+pseudohexforplaettchen)*mdfwidth]);
            translate([-0,-mdfwidth])
            square([15,mdfwidth]);
        }
    }
   
xoffset = -8;
yoffset = -20.5;  
    
module hextileseparatorstar(){ 
    rotate([0,0,0])
        color("blue")
        translate([xoffset,yoffset+mdfwidth,0]) 
                hextileseparator();
    rotate([0,0,60])
        translate([xoffset,yoffset+mdfwidth,0]) 
                hextileseparator();
    rotate([0,0,120])
        translate([xoffset,yoffset+mdfwidth,0]) 
                hextileseparator();
    rotate([0,0,180])
        translate([xoffset,yoffset+mdfwidth,0]) 
                hextileseparator();
    rotate([0,0,240])
        translate([xoffset,yoffset+mdfwidth,0]) 
                hextileseparator();
    rotate([0,0,300])
        translate([xoffset,yoffset+mdfwidth,0]) 
                hextileseparator();  
} 
    
module cardholder(){
    translate([-mdfwidth/2,-15.5,-mdfwidth])
    rotate([90,0])
    rotate([0,90])
    linear_extrude(mdfwidth)
    union(){
        square([53,cardheight+mdfwidth]);
        translate([53,0])
            square([mdfwidth,15]);
        translate([53,cardheight+mdfwidth-15-10])
            square([mdfwidth,15]);
        translate([53/2-15/2,cardheight+mdfwidth])
            square([15,mdfwidth]);
    }
}

module cardlid(){
    color("green", .6)
    translate([-54/2,-24,-pseudohexheight+hexpileheight+cardheight/2-mdfwidth])
    rotate([90,0,0])
        linear_extrude(mdfwidth)
            difference(){
            union(){
                square([54,cardheight]);
                translate([54/2-15/2,cardheight-.1])
                square([15,mdfwidth+1]);
            }            
            translate([30,2,0])
            rotate([0,0,90])
            scale(.85)
            text("Alternative Facts");
            }    
}

module trapeze(){
    translate([trapezeheight/2,0,mdfwidth/2])
    difference(){
        cube([trapezeheight,trapezelowerwidth,mdfwidth],center=true);
        translate([12,17,0])
            rotate([0,0,60])        
                cube([trapezeheight,trapezelowerwidth,mdfwidth+1],center=true);
        translate([12,-17,0])
            rotate([0,0,-60])        
                cube([trapezeheight,trapezelowerwidth,mdfwidth+1],center=true);
    }
}
 


module trapezepile(){

    for (i=[0:mdfpercardheight]){
        index = i%4;
        translate([0,0,mdfwidth*i])
            color(trapezecolors[index],.8)
                trapeze();
    }
}

module trapezepseudotile(){
xoffset = 21;
yoffset = 12;    
    rotate([0,0,0])
        translate([xoffset,yoffset,0])
            color(trapezecolors[0],.8)
                trapeze();
    rotate([0,0,60])
        translate([xoffset,yoffset,0])
            color(trapezecolors[1],.8)
                trapeze();
    rotate([0,0,120])
        translate([xoffset,yoffset,0])
            color(trapezecolors[2],.8)
                trapeze();
    rotate([0,0,180])
        translate([xoffset,yoffset,0])
            color(trapezecolors[3],.8)
                trapeze();
    rotate([0,0,240])
        translate([xoffset,yoffset,0])
            color(trapezecolors[0],.8)
                trapeze();
    rotate([0,0,300])
        translate([xoffset,yoffset,0])
            color(trapezecolors[1],.8)
                trapeze(); 
    translate([1,0,0])//keep order of translate rotate here
        rotate([0,0,0])
            color(trapezecolors[2],.8)
                trapeze();
    translate([-1,0,0])//keep order of translate rotate here
        rotate([0,0,180])
            color(trapezecolors[3],.8)
                trapeze();
}

module trapezepseudotilepile(){ 
        for (i=[0:pseudohexforplaettchen]){
            rotate([0,0,i*60+30])
                translate([0,0,mdfwidth*i])        
                    trapezepseudotile();
        }
}
    
module hextile(){
     cylinder(h=mdfwidth,$fn=6,d=plaettchendurchmesser2);     
}

module hextilepile(){
    colors = ["pink","gray","beige"];
    for (i=[0:numberofhextiles-1]){
        index = i%3;
        translate([0,0,mdfwidth*i])
            color(colors[index],.5)
                hextile();
    }
}

module card(){
    cube([cardthickness,cardwidth,cardheight],center=true);
}

module deck(){
    colors = ["red","yellow","blue","white"];
    for (i=[-cardnumber/2:cardnumber/2]){
        index = (i+cardnumber/2)%4;
        translate([i*cardthickness,0,cardheight/2])
            color(colors[index])
                card();
    }
}

module separator(height=0){
    color("#664422",.4)
        translate([0,0,height])
            cylinder(h=mdfwidth,$fn=6,d=plaettchendurchmesser3);
}



module topseparator(height=0){
    color("#884422",.94)
    difference(){
        translate([0,0,height])
            linear_extrude(mdfwidth)
                difference(){
                    circle($fn=6,d=plaettchendurchmesser3+2*mdfwidth);
//                    cardholders
                    translate([-22,3.7])
                        square([mdfwidth,15]);
                    translate([22-mdfwidth,3.7])
                        square([mdfwidth,15]);
//                    hex slots
                    translate([-7.1,37.4])
                        square([15,schlitztwidth]);
                    rotate([0,0,60])
                        translate([-7.1,37.4])
                            square([15,schlitztwidth]);   
                    rotate([0,0,-60])
                        translate([-7.1,37.4])
                            square([15,schlitztwidth]);    
                    rotate([0,0,120])
                        translate([-7.1,37.4])
                            square([15,schlitztwidth]);   
                    rotate([0,0,-120])
                        translate([-7.1,37.4])
                            square([15,schlitztwidth]);  
                    rotate([0,0,180])
                        translate([-7.1,37.4])
                            square([15,schlitztwidth]);    
////    lid                
//                    translate([-8.2,-27.25])
//                        square([16,mdfwidth*1.2]);
                }      
        translate([0,0,totalheight-1])
        linear_extrude(mdfwidth+2)
//            rotate([180,0])
            translate([-60,0])
            square([120,120]);
        }
}
    

module topseparator2(height=0){
//    color("#884422",.94)
    difference(){
        translate([0,0,height])
            linear_extrude(mdfwidth)
                difference(){
                    circle($fn=6,d=plaettchendurchmesser3+2*mdfwidth);
//                    cardholders
                    translate([-22,3.7])
                        square([mdfwidth,15]);
                    translate([22-mdfwidth,3.7])
                        square([mdfwidth,15]);
//                    hex slots
                    translate([-7.1,37.4])
                        square([15,schlitztwidth]);
                    rotate([0,0,60])
                        translate([-7.1,37.4])
                            square([15,schlitztwidth]);   
                    rotate([0,0,-60])
                        translate([-7.1,37.4])
                            square([15,schlitztwidth]);    
                    rotate([0,0,120])
                        translate([-7.1,37.4])
                            square([15,schlitztwidth]);   
                    rotate([0,0,-120])
                        translate([-7.1,37.4])
                            square([15,schlitztwidth]);    
//    lid                
//                    translate([-8.2,-27.25])
//                        square([16,mdfwidth*1.2]);
                }      
        translate([0,0,totalheight-1])
        linear_extrude(mdfwidth+2)
            rotate([180,0])
            translate([-60,0])
            square([120,120]);
        }
}
    




module bottomseparator(height=0){
//    color("#664422",.4)
        translate([0,0,height])
            linear_extrude(mdfwidth)
                difference(){
                    circle($fn=6,d=plaettchendurchmesser3+2*mdfwidth);
//                    inner circle
//                    rotate([0,0,0])
//                        color("blue")
//                            translate([xoffset,yoffset]) 
//                                    square([15,schlitztwidth]);
//                        rotate([0,0,60])
//                            translate([xoffset,yoffset]) 
//                                    square([15,schlitztwidth]);
//                        rotate([0,0,120])
//                            translate([xoffset,yoffset]) 
//                                    square([15,schlitztwidth]);
//                        rotate([0,0,180])
//                            translate([xoffset,yoffset]) 
//                                    square([15,schlitztwidth]);
//                        rotate([0,0,240])
//                            translate([xoffset,yoffset]) 
//                                    square([15,schlitztwidth]);
//                        rotate([0,0,300])
//                            translate([xoffset,yoffset]) 
//                                    square([15,schlitztwidth]);
//                        outer circle
                    rotate([0,0,0])
                        color("blue")
                            translate([xoffset,yoffset-20]) 
                                    square([15,schlitztwidth]);
                        rotate([0,0,60])
                            translate([xoffset,yoffset-20]) 
                                    square([15,schlitztwidth]);
                        rotate([0,0,120])
                            translate([xoffset,yoffset-20]) 
                                    square([15,schlitztwidth]);
                        rotate([0,0,180])
                            translate([xoffset,yoffset-20]) 
                                    square([15,schlitztwidth]);
                        rotate([0,0,240])
                            translate([xoffset,yoffset-20]) 
                                    square([15,schlitztwidth]);
                        rotate([0,0,300])
                            translate([xoffset,yoffset-20]) 
                                    square([15,schlitztwidth]);
            }
                    
}

module bottomseparatorhalf(width){
    difference(){
        bottomseparator(width);
        translate([0,0,width-1])
        linear_extrude(mdfwidth+2)
            translate([-60,0])
            square([120,120]);
        }
}




rotate([0,90,0])
translate([0,0,-100])
{
bottomseparator(-2*mdfwidth);
bottomseparatorhalf(-mdfwidth);
//rotate([0,0,180])
//bottomseparatorhalf(-mdfwidth);
//hextileseparatorstar();
//trapezepseudotilepile();
//color("yellow",.2)
//    cylinder(h=pseudohexheight,$fn=6,d=plaettchendurchmesser3);              
//separator(pseudohexheight);
//translate([0,0,pseudohexheight])
//    hextilepile(); 
degenerateseparator(pseudohexheight+separatorwidth+hexpileheight);
translate([0,0,pseudohexheight+hexpileheight]){
//    translate([0,-kantenlaenge/2+cardwidth/2,0])
//    deck();
    translate([cardnumber/2*cardthickness+mdfwidth/2+1,0,0])
        color("red")
            cardholder();  
    translate([-(cardnumber/2*cardthickness+mdfwidth/2+1),0,0])
        color("red")
            cardholder();  
//    translate([0,-22.5,0])
//        rotate([0,0,-90])
//        trapezepile();
//    translate([-22.5,0,0])
//        rotate([0,0,180])
//        trapezepile();
//    translate([22.5,0,0])
//        rotate([0,0,0])
//        trapezepile();
////    color("green",.2)
////        cylinder(h=cardheight,$fn=6,d=plaettchendurchmesser3);
}

//color("blue")
//topseparator2(pseudohexheight+hexpileheight+cardheight);
//color("red")
topseparator(pseudohexheight+hexpileheight+cardheight);
bottomseparator(pseudohexheight+hexpileheight+cardheight+mdfwidth);
// 
//translate([0,0,-0*mdfwidth])
////color("#664422",.9)
////    wanne();
//color("#664422",.7)
//    antiwanne();

//cardlid();
}

//wanne();
mdfwidth = 3;
schlitztwidth = mdfwidth*.999;
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
////    translate([-kantenlaenge/2-mdfwidth,plaettchendurchmesser1/2+mdfwidth,-mdfwidth])
////        rotate([90,0,0])
////            linear_extrude(mdfwidth)
//                union(){
//                        translate([0,0,0])
//                            difference(){
//                                translate([mdfwidth,pseudohexheight])
//                               square([kantenlaenge*.97,totalheight-pseudohexheight]);                     
////                                translate([1.5,0])
////                                    square([mdfwidth,50]);
////                                translate([kantenlaenge+1.5,0])
////                                    square([mdfwidth,50]);
//                                translate([4,73])
//                                    square([schlitztwidth,15]);
//                                translate([44,73])
//                                    square([schlitztwidth,15]);
//                                translate([4,142])
//                                    square([schlitztwidth,15]);
//                                translate([44,142])
//                                    square([schlitztwidth,15]);
//                            }
//                            translate([kantenlaenge/2-4,pseudohexheight-mdfwidth]) //#FIXME
//                                square([15,mdfwidth]);
//                            translate([kantenlaenge/2-4,totalheight]) //#FIXME
//                                square([15,mdfwidth]);
//                        }
//    rotate([0,0,60])
//        translate([-kantenlaenge/2-mdfwidth,plaettchendurchmesser1/2+mdfwidth,-mdfwidth])
//            rotate([90,0,0])
//               linear_extrude(mdfwidth)
//                    union(){
//                        translate([0,0,mdfwidth])
//                            difference(){
//                            translate([mdfwidth,pseudohexheight])
//                                square([kantenlaenge*.97,totalheight-pseudohexheight]);                     
////                                translate([1.5,0])
////                                    square([mdfwidth,pseudohexheight/2+mdfwidth/2]);
////                                translate([kantenlaenge+1.5,50])
////                                    square([mdfwidth,200]);             
////                                translate([1.5,125])
////                                    square([mdfwidth,130]);
//                            }
//                            translate([kantenlaenge/2-4,pseudohexheight-mdfwidth]) //#FIXME
//                                square([15,mdfwidth]);
//                            translate([kantenlaenge/2-4,totalheight]) //#FIXME
//                                square([15,mdfwidth]);
//                        }
//    rotate([0,0,-60])
//        translate([-kantenlaenge/2-mdfwidth,plaettchendurchmesser1/2+mdfwidth,-mdfwidth])
//            rotate([90,0,0])
//                linear_extrude(mdfwidth)
                    union(){
                        translate([0,0,mdfwidth])
                            difference(){
                            translate([mdfwidth,pseudohexheight])
                                square([kantenlaenge*.97,totalheight-pseudohexheight]);                     
//                                translate([1.5,50])
//                                    square([mdfwidth,200]);                
//                                translate([kantenlaenge,125])
//                                    square([mdfwidth,130]);
//                                translate([kantenlaenge+1.5,0])
//                                    square([mdfwidth,pseudohexheight/2+mdfwidth/2]);
                            }
                            translate([kantenlaenge/2-4,pseudohexheight-mdfwidth]) //#FIXME
                                square([15,mdfwidth]);
                            translate([kantenlaenge/2-4,totalheight]) //#FIXME
                                square([15,mdfwidth]);
                        }
}

module antiwanne(){
////    rotate([0,0,180])
////        translate([-kantenlaenge/2-mdfwidth,plaettchendurchmesser1/2+mdfwidth,0])
////            rotate([90,0,0])
////                linear_extrude(mdfwidth)
                    union(){
//                        translate([0,0,mdfwidth])
                            translate([mdfwidth,pseudohexheight])
                            difference(){
                                square([kantenlaenge*.97,totalheight-pseudohexheight]);
//                                translate([17,20])
//                                rotate([180,0,90])                                
//                                text("Alternative Facts");    
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
                            translate([22.5,44.5])//A
                            square([2,2]);                            
                            translate([22.5,60])//e
                            square([2,2]);                        
                            translate([22.5,79])//a
                            square([2,2]);                      
                            translate([22.5,100.5])//e
                            square([2,2]);                      
                            translate([22.5,120])//a
                            square([2,2]);       
                        translate([kantenlaenge/2-4,pseudohexheight-2*mdfwidth]) //#FIXME
                            square([15,mdfwidth*2]); 
                        translate([kantenlaenge/2-4,totalheight]) //#FIXME
                            square([15,mdfwidth*2]);
                    }
//    rotate([0,0,120])
//        translate([-kantenlaenge/2-mdfwidth,plaettchendurchmesser1/2+mdfwidth,0])
//            rotate([90,0,0])
//               linear_extrude(mdfwidth)  
//                    union(){
////                        translate([0,0,mdfwidth])   
//                            translate([mdfwidth,pseudohexheight])               
//                            difference(){
//                                square([kantenlaenge*.97,totalheight-pseudohexheight]);
//                                //aussparungen
////                                translate([1.5,0])
////                                    square([mdfwidth,pseudohexheight/2+mdfwidth/2]);
////                                translate([kantenlaenge+1.5,pseudohexheight/2+mdfwidth/2])
////                                    square([mdfwidth,pseudohexheight/2+mdfwidth/2]);
//                                //oberseite
////                                translate([-1,pseudohexheight+mdfwidth])
////                                    square([kantenlaenge+3*mdfwidth,hexpileheight]);   
////                                translate([kantenlaenge+1,pseudohexheight+pseudohexheight+mdfwidth])
////                                    square([mdfwidth*1.2,80]);
//                            }
//                        translate([kantenlaenge/2-4,pseudohexheight-2*mdfwidth]) //#FIXME
//                            square([15,mdfwidth*2]);
//                        translate([kantenlaenge/2-4,totalheight]) //#FIXME
//                            square([15,mdfwidth*2]);
//                        }
//    rotate([0,0,-120])
//        translate([-kantenlaenge/2-mdfwidth,plaettchendurchmesser1/2+mdfwidth,0])
//            rotate([90,0,0])
//               linear_extrude(mdfwidth)  
//                    union(){
//                        translate([0,0,mdfwidth])  
//                            translate([mdfwidth,pseudohexheight])                
//                            difference(){
//                                square([kantenlaenge*.97,totalheight-pseudohexheight]);
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
//                            }
//                        translate([kantenlaenge/2-4,pseudohexheight-2*mdfwidth]) //#FIXME
//                            square([15,mdfwidth*2]);
//                        translate([kantenlaenge/2-4,totalheight]) //#FIXME
//                            square([15,mdfwidth*2]);
//                        }
}

module hextileseparator(){
//    cube([trapezelowerwidth,mdfwidth,(1+pseudohexforplaettchen)*mdfwidth]); 
    rotate([90,0,0])
   // linear_extrude(mdfwidth)
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
//    translate([-mdfwidth/2,-15.5,-mdfwidth])
//    rotate([90,0])
//    rotate([0,90])
//    linear_extrude(mdfwidth)
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
//    translate([-54/2,-24,-pseudohexheight+hexpileheight+cardheight/2-mdfwidth])
//    rotate([90,0,0])
//       linear_extrude(mdfwidth)
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
        square([trapezeheight,trapezelowerwidth],center=true);
        translate([12,17,0])
            rotate([0,0,60])        
                square([trapezeheight,trapezelowerwidth],center=true);
        translate([12,-17,0])
            rotate([0,0,-60])        
                square([trapezeheight,trapezelowerwidth],center=true);
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
     circle(h=mdfwidth,$fn=6,d=plaettchendurchmesser2);     
}

module hextilepile(){
    colors = ["pink","gray","beige"];
    for (i=[0:numberofhextiles-1]){
        index = i%3;
        translate([0,0,mdfwidth*i])
            color(colors[index],.99)
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
           // linear_extrude(mdfwidth)
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
//        translate([0,0,totalheight-1])
//        linear_extrude(mdfwidth+2)
//            rotate([180,0])
            translate([-60,0])
            square([120,120]);
        }
}
    

module topseparator2(height=0){
//    color("#884422",.94)
        union(){
    difference(){
//        translate([0,0,height])
//            linear_extrude(mdfwidth)
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
//        translate([0,0,totalheight-mdfwidth-1])
//        linear_extrude(mdfwidth+2)
            rotate([180,0])
            translate([-60,0])
            square([120,120]);
        }
//        translate([0,0,height-.1])
//        linear_extrude(mdfwidth*1.1) 
         translate([0,-27,0])
        union(){
            circle(d=20,$fn=6,center=true);
                translate([-10,0])
                    square([20,40]);
        } 
}
}
    




module bottomseparator(height=0,slots=6){
//    color("#664422",.4)
//        translate([0,0,height])
//           linear_extrude(mdfwidth)
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
                    for(i=[1:slots]){
                    rotate([0,0,i*60])
                        color("blue")
                            translate([xoffset,yoffset-20]) 
                                    square([15,schlitztwidth]);
                    } 
            }
                    
}

module bottomseparatorhalfmacho(width){
//    rotate([0,0,180])
        union(){
    difference(){
        bottomseparator(width);
            
//        translate([0,0,width-1])
//        linear_extrude(mdfwidth+2)
            translate([-60,0])
            square([120,120]);
        }
        }
//        translate([0,0,width-.1])
//        linear_extrude(mdfwidth*1.1)
        translate([0,27,0])
        union(){
            circle(d=20,$fn=6,center=true);
                translate([-10,-40])
                    square([20,40]);
        }
}

module bottomseparatorhalfhembra(width){
    color("red",.4)
    difference(){
        bottomseparator(width=0);
//        translate([0,0,width-.1])
//        linear_extrude(mdfwidth*1.1)
        circle(d=20,$fn=6,center=true);
//        translate([0,0,width-1])
//        linear_extrude(mdfwidth+2)
            translate([-60,0])
            square([120,120]);
        translate([0,-27,0])
        union(){
            circle(d=20,$fn=6,center=true);
                translate([-10,0])
                    square([20,40]);
        } 
    }
}




//rotate([0,90,0])
//translate([0,0,-100])
//{
////    hextileseparatorstar();
////    trapezepseudotilepile();             
////    separator(pseudohexheight);
////    color("pink",.3)
////    bottomseparator(pseudohexheight-3*mdfwidth);
////    rotate([0,0,180])
//    bottomseparatorhalfhembra(pseudohexheight-2*mdfwidth);
////    rotate([0,0,180])
//    bottomseparatorhalfmacho(pseudohexheight-2*mdfwidth);
//    translate([0,0,pseudohexheight])
//        hextilepile(); 
////    degenerateseparator(pseudohexheight+separatorwidth+hexpileheight);
//    translate([0,0,pseudohexheight+hexpileheight]){
//        translate([0,-kantenlaenge/2+cardwidth/2,0])
//        deck();
//        translate([cardnumber/2*cardthickness+mdfwidth/2+1,0,-mdfwidth])
//            color("red")
//                cardholder();  
//        translate([-(cardnumber/2*cardthickness+mdfwidth/2+1),0,-mdfwidth])
//            color("red")
//                cardholder();  
//    //    translate([0,-22.5,0])
//    //        rotate([0,0,-90])
//    //        trapezepile();
//    //    translate([-22.5,0,0])
//    //        rotate([0,0,180])
//    //        trapezepile();
//    //    translate([22.5,0,0])
//    //        rotate([0,0,0])
//    //        trapezepile(); 
//    }
//
//    //color("blue")
//    topseparator2(pseudohexheight+hexpileheight+cardheight-mdfwidth);
//    //color("red") 
//    bottomseparator(pseudohexheight+hexpileheight+cardheight);
////    // 
//   translate([0,0,-0*mdfwidth])
//    ////color("#664422",.9)
//       wanne();
//   translate([0,0,-mdfwidth])
//    //color("#664422",.7)
//        antiwanne();

    //cardlid();
//}

//translate([37,-44]){
//    {
//rotate([0,0,120])
//    bottomseparatorhalfhembra(pseudohexheight-2*mdfwidth);
//translate([304,0,0])
//rotate([0,0,120])
//    topseparator2(pseudohexheight+hexpileheight+cardheight-mdfwidth);
//    
//color("green")    
//translate([76,44,0])
//    bottomseparatorhalfhembra(pseudohexheight-2*mdfwidth);
//color("blue")    
//translate([228,44,0])
//    bottomseparatorhalfhembra(pseudohexheight-2*mdfwidth);
//
//color("black")    
//translate([152,0,0])
//    rotate([0,0,180])
//    bottomseparator(pseudohexheight-2*mdfwidth,slots=3);
//    
//color("orange")    
//translate([76,-44,0])
//    rotate([0,0,180])
//    bottomseparator(pseudohexheight-2*mdfwidth,slots=3);
//    }
//
//
//    translate([304,-88])
//rotate([0,0,180])    
//    {
//rotate([0,0,60])
//    bottomseparatorhalfhembra(pseudohexheight-2*mdfwidth);
//color("pink")
//translate([304,0,0])
//rotate([0,0,-120])
//    bottomseparatorhalfhembra(pseudohexheight+hexpileheight+cardheight-mdfwidth);
//    
//color("green")    
//translate([76,44,0])
//    bottomseparatorhalfhembra(pseudohexheight-2*mdfwidth);
//color("blue")    
//translate([228,44,0])
//    bottomseparatorhalfhembra(pseudohexheight-2*mdfwidth);
//
//color("black")    
//translate([152,0,0])
//    rotate([0,0,180])
//    bottomseparator(pseudohexheight-2*mdfwidth,slots=3);
//    
//color("orange")    
//translate([76,-44,0])
//    rotate([0,0,180])
//    bottomseparator(pseudohexheight-2*mdfwidth,slots=3);
//    }
//   
 
//translate([-36,-133])
//    rotate([0,0,-90])    
//        cardholder();   
//translate([-15,-262])
//    rotate([0,0,-90])    
//        antiwanne();  
//translate([-15,-218])
//    rotate([0,0,-90])    
//        antiwanne();    
//translate([-15,-174])
//    rotate([0,0,-90])    
//        antiwanne();    
//translate([-15,-130])
//    rotate([0,0,-90])    
//        antiwanne();
//translate([-15,-86])
//    rotate([0,0,-90])    
//        antiwanne();    
//translate([-15,-42])
//    rotate([0,0,-90])    
//        antiwanne();
//translate([-15,2])
//    rotate([0,0,-90])    
//        antiwanne();    
//        
        
//translate([144,-262])
//    rotate([0,0,-90])    
//        antiwanne();  
//translate([144,-218])
//    rotate([0,0,-90])    
//        antiwanne();  
//translate([144,-174])
//    rotate([0,0,-90])    
//        antiwanne();    
//translate([144,-130])
//    rotate([0,0,-90])    
//        antiwanne();
//translate([144,-86])
//    rotate([0,0,-90])    
//        antiwanne();    
//translate([144,-42])
//    rotate([0,0,-90])    
//        antiwanne();
//translate([144,2])
//    rotate([0,0,-90])    
//        antiwanne();   
//        
//        
//translate([315,-172])
//    rotate([0,0,0])    
//        antiwanne();   
//translate([360,-172])
//    rotate([0,0,0])    
//        antiwanne();            
//translate([315,-330])
//    rotate([0,0,0])    
//        antiwanne();   
//translate([360,-330])
//    rotate([0,0,0])    
//        antiwanne();    
       
       
//translate([-15,-130])
//    rotate([0,0,-90])    
//        wanne();
//    
    
//translate([-36,-190])
//    rotate([0,0,-90])    
//        cardholder();   
//translate([-15,-130])
//    rotate([0,0,-90])    
//        wanne();  
//translate([145,-174])
//    rotate([0,0,-90])    
//        wanne();
//}
//
//translate([0,-2,0]){
//translate([375,-20])
//trapeze();
//translate([375,-81])
//trapeze();
//translate([375,-142])
//trapeze();
//translate([375,-203])
//trapeze();
//translate([375,-264])
//trapeze();
//
//translate([390,-50.5])
//trapeze();
//translate([390,-111.5])
//trapeze();
//translate([390,-172.5])
//trapeze();
//translate([390,-233.5])
//trapeze();
//
//
//translate([405,-20])
//trapeze(); 
//translate([405,-81])
//trapeze();
//translate([405,-142])
//trapeze();
//translate([405,-203])
//trapeze();
//translate([405,-264])
//trapeze();
//translate([405,-81])
//trapeze();
//
//
//
//translate([420,-50.5])
//trapeze();
//translate([420,-111.5])
//trapeze();
//translate([420,-172.5])
//trapeze();
//translate([420,-233.5])
//trapeze();
////translate([420,-294.5])
////trapeze();
//
//
// 
//translate([360,-172.5])
//trapeze();
//translate([360,-233.5])
//trapeze();
////translate([360,-294.5])
////trapeze();
//}

//translate([20,-307,0])
//rotate([0,0,90])
//    trapeze();
//translate([82,-307,0])
//rotate([0,0,90])
//    trapeze();
//translate([144,-307,0])
//rotate([0,0,90])
//    trapeze();
//translate([211,-298,0])
//rotate([0,0,90])
//    trapeze();
//translate([268,-29,0])
//rotate([0,0,90])
//    trapeze();
//translate([330,-29,0])
//rotate([0,0,90])
//    trapeze();
//
//translate([51,-291,0])
//rotate([0,0,-90])
//    trapeze();
//translate([113,-291,0])
//rotate([0,0,-90])
//    trapeze();
//translate([175,-291,0])
//rotate([0,0,-90])
//    trapeze();
//translate([242,-282,0])
//rotate([0,0,-90])
//    trapeze();
//translate([304,-282,0])
//    rotate([0,0,-90])
//        trapeze();
//
// 
//translate([211,-281,0])
//rotate([0,0,90])
//    trapeze(); 
//translate([272,-281,0])
//rotate([0,0,90])
//    trapeze(); 
//translate([333,-281,0])
//rotate([0,0,90])
//    trapeze(); 
// 
// 
// translate([242,-265,0])
//rotate([0,0,-90])
//    trapeze(); 
//translate([303,-265,0])
//rotate([0,0,-90])
//    trapeze(); 
// 
// 
// 
//translate([52,-71,0])
//rotate([0,0,-150])
//    trapeze(); 
//translate([52,-105.5,0])
//rotate([0,0,150])
//    trapeze(); 
//    
//translate([24.5,-88,0])
//rotate([0,0,90])
//    trapeze(); 
//translate([24.5,-88.5,0])
//rotate([0,0,-90])
//    trapeze(); 
//    
//    
//translate([21,-18,0])
//rotate([0,0,-150])
//    trapeze(); 
//translate([21,-158,0])
//rotate([0,0,150])
//    trapeze(); 
//    
//translate([326,-18])
//    rotate([0,0,30])
//        trapeze(); 
//        
//translate([356.5,-70])
//    rotate([0,0,30])
//        trapeze(); 
//            
//translate([326,-159])
//    rotate([0,0,-30])
//        trapeze(); 
//        
//translate([356.5,-106])
//    rotate([0,0,-30])
//        trapeze(); 

//translate([435,-320]) square([.1,300]);
//translate([420,-320]) square([.1,300]);
//translate([376,-320]) square([.1,300]);
//translate([361,-320]) square([.1,300]);

 hextile();
 


        
 
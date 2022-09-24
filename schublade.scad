mdfwidth=3;
totalwidth=380;
totalheight=80;
depth=595;
langzapfenlaenge=40;
kurzzapfenlaenge=20;

module grundplatte(){
//    linear_extrude(mdfwidth)
//        translate([mdfwidth,0,0])
        difference(){
            union(){
                square([totalwidth-2*mdfwidth,depth]);
//                
                translate([0.-mdfwidth,120])         
                square([mdfwidth,langzapfenlaenge]);
                translate([0.-mdfwidth,240])
                square([mdfwidth,langzapfenlaenge]);
                translate([0.-mdfwidth,360])
                square([mdfwidth,langzapfenlaenge]);
                translate([0.-mdfwidth,480])
                square([mdfwidth,langzapfenlaenge]);
//                 
                translate([totalwidth-2*mdfwidth,120])         
                    square([mdfwidth,langzapfenlaenge]); 
                translate([totalwidth-2*mdfwidth,240])         
                    square([mdfwidth,langzapfenlaenge]); 
                translate([totalwidth-2*mdfwidth,360])         
                    square([mdfwidth,langzapfenlaenge]); 
                translate([totalwidth-2*mdfwidth,480])         
                    square([mdfwidth,langzapfenlaenge]); 
//                
//                          
                }
//                
            translate([20,mdfwidth])
            square([langzapfenlaenge,mdfwidth]);
            translate([totalwidth-20-langzapfenlaenge,mdfwidth])
            square([langzapfenlaenge,mdfwidth]); 
            translate([totalwidth/2-langzapfenlaenge/2,mdfwidth])
            square([langzapfenlaenge,mdfwidth]);
//                
            translate([20,depth-2*mdfwidth])
            square([langzapfenlaenge,mdfwidth]);
            translate([totalwidth-20-langzapfenlaenge,depth-2*mdfwidth])
            square([langzapfenlaenge,mdfwidth]); 
            translate([totalwidth/2-langzapfenlaenge/2,depth-2*mdfwidth])
            square([langzapfenlaenge,mdfwidth]);
            }
}

module seite(){
//    translate([mdfwidth,0,0])
//    rotate([0,-90,0])
//    linear_extrude(mdfwidth)
        difference(){
            square([totalheight,depth]);
//            
            translate([mdfwidth,120,0])
            square([mdfwidth,langzapfenlaenge]);
            translate([mdfwidth,240,0])
            square([mdfwidth,langzapfenlaenge]);
            translate([mdfwidth,360,0])
            square([mdfwidth,langzapfenlaenge]);
            translate([mdfwidth,480,0])
            square([mdfwidth,langzapfenlaenge]);
//            
            translate([10,mdfwidth])
                square([kurzzapfenlaenge,mdfwidth]);
            translate([totalheight-10-kurzzapfenlaenge,mdfwidth])
                square([kurzzapfenlaenge,mdfwidth]);
//            
            translate([10,depth-2*mdfwidth])
                square([kurzzapfenlaenge,mdfwidth]);
            translate([totalheight-10-kurzzapfenlaenge,depth-2*mdfwidth])
                square([kurzzapfenlaenge,mdfwidth]);
                        
//            
            translate([10,depth*.33]){
                square([kurzzapfenlaenge,mdfwidth]);
                translate([10,-3])
                square([10,10]);                
            }
            translate([totalheight-10-kurzzapfenlaenge,depth*.33]){
                square([kurzzapfenlaenge,mdfwidth]);
                translate([10,-3])
                square([10,10]); 
            }
//            
            translate([10,depth*.66]){
                square([kurzzapfenlaenge,mdfwidth]);
                translate([10,-3])
                square([10,10]); 
            }
            translate([totalheight-10-kurzzapfenlaenge,depth*.66]){
                square([kurzzapfenlaenge,mdfwidth]);
                translate([10,-3])
                square([10,10]); 
            }
        }
}


module rueckseite(){
//    translate([mdfwidth,0,mdfwidth])
//    rotate([90,0,0])
//    linear_extrude(mdfwidth)
       union(){
            square([totalwidth-2*mdfwidth,totalheight-2*mdfwidth]);  
//            
            translate([-mdfwidth,10,0])
            square([mdfwidth,kurzzapfenlaenge]);
//            
            translate([-mdfwidth,totalheight-kurzzapfenlaenge-10,0])
            square([mdfwidth,kurzzapfenlaenge]);
//            
            translate([totalwidth-2*mdfwidth,10-2*mdfwidth,0])
                square([mdfwidth,kurzzapfenlaenge]);
//            
            translate([totalwidth-2*mdfwidth,totalheight-kurzzapfenlaenge-10-2*mdfwidth,0])
                square([mdfwidth,kurzzapfenlaenge]);
//           
//           
            translate([20,-mdfwidth])
            square([langzapfenlaenge,mdfwidth]);
//                        
            translate([totalwidth-20-langzapfenlaenge,-mdfwidth])
            square([langzapfenlaenge,mdfwidth]);
//                        
            translate([totalwidth/2-langzapfenlaenge/2,-mdfwidth])
            square([langzapfenlaenge,mdfwidth]);
        }
}

module vorderseite(){ 
//    translate([mdfwidth,mdfwidth,mdfwidth])
//    rotate([90,0,0])
//    linear_extrude(mdfwidth)
        difference(){
            union(){
                square([totalwidth-2*mdfwidth,totalheight-2*mdfwidth]);  
    //            
                translate([-mdfwidth,10-2*mdfwidth,0])
                square([mdfwidth,kurzzapfenlaenge]);
    //            
                translate([-mdfwidth,totalheight-kurzzapfenlaenge-10-2*mdfwidth])
                square([mdfwidth,kurzzapfenlaenge]);
    //            
                translate([totalwidth-2*mdfwidth,10-2*mdfwidth,0])
                square([mdfwidth,kurzzapfenlaenge]);
    //            
                translate([totalwidth-2*mdfwidth,totalheight-kurzzapfenlaenge-10-2*mdfwidth,0])
                square([mdfwidth,kurzzapfenlaenge]);
    //            
    //                        
                translate([20,-mdfwidth])
                square([langzapfenlaenge,mdfwidth]);
    //                        
                translate([totalwidth-20-langzapfenlaenge,-mdfwidth])
                square([langzapfenlaenge,mdfwidth]);
    //                        
                translate([totalwidth/2-langzapfenlaenge/2,-mdfwidth])
                square([langzapfenlaenge,mdfwidth]);
            }
            translate([totalwidth/2-(30/2+100+30/2)/2,50])
//            griff();
            translate([-25,-35])
            scale([.2,.2])
                import("sawfish.svg");
    }
            
}
    
module griff(){
    hull(){
        translate([0,0])
            circle(d=30);
        translate([100,0])
            circle(d=30);
    }
}
    
    


//translate([0,0,mdfwidth])
    grundplatte();
//
//color("red",0.5)
//    seite();
//
//translate([totalwidth-mdfwidth,0,0])
//color("red",0.5)
//    seite();
//
//color("blue",0.5)
//    translate([0,depth-mdfwidth,mdfwidth])
//    rueckseite();
//
//
//color("green",0.5) 
//    translate([0,mdfwidth,mdfwidth])
//    vorderseite();
//     
     

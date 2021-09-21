mdfwidth=3;
innerwidth=400;
innerheight=125;
innerdepth=220;
inlayheight=50;
outerwidth=innerwidth+2*mdfwidth;
outerheight=innerheight+2*mdfwidth;
outerdepth=innerdepth+2*mdfwidth;
saegezahnstep=14;
dockingstation_innerwidth=290;
dockingstation_innerdepth=160;
dockingstation_depth_offset=10;
dockingstation_width_offset=30;
schalter_depth_offset=80;
schalter_width_offset=62;
schalter_width_top=50;
schalter_depth_top=50;
fuesschen_depth_offset=17;
fuesschen_right_offset=15;
fuesschen_vr_von_rechts=17;
fuesschen_vr_von_vorne=17;
fuesschen_vl_von_links=17;
fuesschen_vl_von_vorne=16;
fuesschen_hr_von_rechts=19;
fuesschen_hr_von_hinten=48;
fuesschen_hl_von_links=32;
fuesschen_hl_von_hinten=31;
fuss_durchmesser=20;
dvd_hoehe=40;
hdmi_offset=194;
power_offset=350;
power_z_offset=00;
power_breite=20;
power_hoehe=40;
hdmi_breite=30;
hdmi_hoehe=20;
hdmi_z_offset=0;
saegezahnspiel=1.03;

ethernet_offset=210;
ethernet_width=20;

module mycube(x){
    cube(x); 
}

module saegezahn(){
    for (i=[0:20]){
    translate([-0.005,-0.005,i*2*saegezahnstep])
        mycube([mdfwidth*saegezahnspiel,mdfwidth*saegezahnspiel,saegezahnstep]); 
    }
}

module saegezahn2(){
    for (i=[0:20]){
    translate([i*2*saegezahnstep-0.01,-0.01,0])
        square([saegezahnstep,mdfwidth*saegezahnspiel]); 
    }
}


module saegezahn_z(){
    saegezahn();
}

module saegezahn_z2(){
    saegezahn2();
}


module saegezahn_x(){
    rotate([270,0,0])
        saegezahn();
}

module saegezahn_y(){ 
    rotate([0,90,0])
        saegezahn();
}
module saegezahn_y2(){ 
    rotate([0,0,90])
        saegezahn2();
}



//bases
difference(){  
    mycube([outerdepth,outerwidth,mdfwidth]);
    translate([saegezahnstep,0,mdfwidth])
        saegezahn_y();
    translate([saegezahnstep,innerwidth+mdfwidth,mdfwidth])
        saegezahn_y();
    translate([0,0,mdfwidth])
        saegezahn_x();
}

//////pseudobase (2x)
//difference(){
//    square([outerdepth,outerwidth]);
//    translate([saegezahnstep,0])
//        saegezahn_z2();
//    translate([saegezahnstep,innerwidth+mdfwidth])
//        saegezahn_z2();
//    translate([mdfwidth,0])
//        saegezahn_y2();
//}

 

////inlay
translate([0,0,inlayheight])
    difference(){
        mycube([outerdepth,outerwidth,mdfwidth]);
        translate([saegezahnstep,0,mdfwidth])
            saegezahn_y();
        translate([saegezahnstep,innerwidth+mdfwidth,mdfwidth])
            saegezahn_y();
        translate([0,0,mdfwidth])
            saegezahn_x();
    }

//sides  
color("blue")
    difference(){
    mycube([outerdepth,mdfwidth,outerheight]);
    saegezahn_z();
    translate([0,0,mdfwidth])
        saegezahn_y();
    translate([0,0,inlayheight+mdfwidth])
        saegezahn_y();
    translate([0,0,innerheight+mdfwidth])
        saegezahn_y();
    translate([0,0,innerheight+mdfwidth*2])
        saegezahn_y();
    }

    
color("blue")
    translate([0,innerwidth+mdfwidth,0])
        difference(){
            mycube([outerdepth,mdfwidth,outerheight]);
            saegezahn_z();
            translate([0,0,mdfwidth])
                saegezahn_y();
            translate([0,0,inlayheight+mdfwidth])
                saegezahn_y();
            translate([0,0,innerheight+mdfwidth])
                saegezahn_y();
            translate([0,0,innerheight+mdfwidth*2])
                saegezahn_y();
        }

//pseudoside (2x)
//    translate([0,-1,innerheight+mdfwidth*2])
//rotate([90,180,180])
//color("brown")
//    difference(){ 
//    square([outerdepth,outerheight]);         
//    translate([mdfwidth,-mdfwidth-1])
//        saegezahn_y2();
//    translate([0,0])
//        saegezahn_z2();
//    translate([0,mdfwidth])
//        saegezahn_z2();
//    translate([0,inlayheight])
//        saegezahn_z2();
//    translate([0,innerheight+mdfwidth])
//        saegezahn_z2(); 
//    }

//back 
color("green")
    difference(){
        mycube([mdfwidth,outerwidth,outerheight]);
        translate([-0.01,-0.01,saegezahnstep])
            saegezahn();
        translate([-0.01,-0.01+innerwidth+mdfwidth,saegezahnstep])
            saegezahn();
        translate([0,saegezahnstep,mdfwidth])
            saegezahn_x();
        translate([0,saegezahnstep,mdfwidth+inlayheight])
            saegezahn_x();
        translate([0,saegezahnstep,innerheight+mdfwidth])
            saegezahn_x();
        translate([0,saegezahnstep,innerheight+mdfwidth*2])
            saegezahn_x();
//       hdmiloch
        translate([-1,hdmi_offset,hdmi_z_offset+mdfwidth])
            mycube([15,hdmi_breite,hdmi_hoehe]);  
//        steckerloch
        translate([-1,power_offset,power_z_offset+mdfwidth])
            mycube([15,power_breite,power_hoehe]);       
    }
//    
//pseudoback
//    rotate([90,0,90])
//color("green")
//    difference(){
//        square([outerwidth,outerheight]);
//        translate([mdfwidth,saegezahnstep])
//            saegezahn_y2();
//        translate([innerwidth+mdfwidth*2,saegezahnstep])
//            saegezahn_y2();
//        translate([saegezahnstep,0])
//            saegezahn_z2();
//        translate([saegezahnstep,inlayheight])
//            saegezahn_z2();
//        translate([saegezahnstep,innerheight])
//            saegezahn_z2();
//        translate([saegezahnstep,innerheight+mdfwidth])
//            saegezahn_z2();
////       hdmiloch
//        translate([hdmi_offset,hdmi_z_offset+mdfwidth])
//            square([hdmi_breite,hdmi_hoehe]);  
////        steckerloch
//        translate([power_offset,power_z_offset+mdfwidth])
//            square([power_breite,power_hoehe]);       
//    }
//
//  
//    
//color("red")  
    translate([0,0,innerheight])
        difference(){
            mycube([outerdepth,outerwidth,mdfwidth]);
            translate([saegezahnstep,0,mdfwidth])
                saegezahn_y();
            translate([saegezahnstep,innerwidth+mdfwidth,mdfwidth])
                saegezahn_y();
            translate([0,0,mdfwidth])
                saegezahn_x(); 
//            translate([0+dockingstation_depth_offset+fuesschen_hr_von_hinten,innerwidth-dockingstation_width_offset-fuesschen_hr_von_rechts])
//                cylinder(d=fuss_durchmesser,h=15,center=true);
//            translate([0+dockingstation_depth_offset+dockingstation_innerdepth-fuesschen_vr_von_vorne,innerwidth-dockingstation_width_offset-fuesschen_vr_von_rechts])
//                cylinder(d=fuss_durchmesser,h=15,center=true);
//            translate([0+dockingstation_depth_offset+fuesschen_hl_von_hinten,innerwidth-dockingstation_innerwidth-dockingstation_width_offset+fuesschen_hl_von_links])
//                cylinder(d=fuss_durchmesser,h=15,center=true);
//            translate([0+dockingstation_depth_offset+dockingstation_innerdepth-+fuesschen_vl_von_vorne,innerwidth-dockingstation_innerwidth-dockingstation_width_offset+fuesschen_vl_von_links])
//                cylinder(d=fuss_durchmesser,h=15,center=true);
        }
  
//pseudorot  
//color("red")  
//    translate([0,0,innerheight])
//        difference(){
//            square([outerdepth,outerwidth]);
//            translate([saegezahnstep,0])
//                saegezahn_z2();
//            translate([saegezahnstep,innerwidth+mdfwidth])
//                saegezahn_z2();
//            translate([mdfwidth,0])
//                saegezahn_y2(); 
////            translate([0+dockingstation_depth_offset+fuesschen_hr_von_hinten,innerwidth-dockingstation_width_offset-fuesschen_hr_von_rechts])
////                circle(d=fuss_durchmesser,h=15,center=true);
////            translate([0+dockingstation_depth_offset+dockingstation_innerdepth-fuesschen_vr_von_vorne,innerwidth-dockingstation_width_offset-fuesschen_vr_von_rechts])
////                circle(d=fuss_durchmesser,h=15,center=true);
//////            translate([0+dockingstation_depth_offset+fuesschen_hl_von_hinten,innerwidth-dockingstation_innerwidth-dockingstation_width_offset+fuesschen_hl_von_links])
//////                circle(d=fuss_durchmesser,h=15,center=true);
////            translate([0+dockingstation_depth_offset+dockingstation_innerdepth-+fuesschen_vl_von_vorne,innerwidth-dockingstation_innerwidth-dockingstation_width_offset+fuesschen_vl_von_links])
////                circle(d=fuss_durchmesser,h=15,center=true);
//        }
//        
//        
color("pink")    
    translate([0,0,innerheight+mdfwidth-0.1])
        difference(){
        mycube([outerdepth,outerwidth,mdfwidth]);
        translate([saegezahnstep,0,mdfwidth])
            saegezahn_y();
        translate([saegezahnstep,innerwidth+mdfwidth,mdfwidth])
            saegezahn_y();
        translate([0,0,mdfwidth])
            saegezahn_x();
        translate([dockingstation_depth_offset,innerwidth-dockingstation_innerwidth-dockingstation_width_offset,-5])
            union(){
                mycube([dockingstation_innerdepth,dockingstation_innerwidth,14]);
                translate([0,-schalter_width_offset,0])
                mycube([schalter_depth_offset,schalter_width_offset+.01,14]);
                //ethernet
                translate([-dockingstation_depth_offset,ethernet_offset-schalter_width_offset,mdfwidth])                
                mycube([dockingstation_width_offset*1.2,ethernet_width,mdfwidth*2]);
            } 
            
        }

//pseudopink   
//color("pink")    
//    translate([0,0,innerheight+mdfwidth-0.1])
//        difference(){
//        square([outerdepth,outerwidth]);
//        translate([saegezahnstep,0])
//            saegezahn_z2();
//        translate([saegezahnstep,innerwidth+mdfwidth])
//            saegezahn_z2();
//        translate([mdfwidth,0])
//            saegezahn_y2();
//        translate([dockingstation_depth_offset,innerwidth-dockingstation_innerwidth-dockingstation_width_offset])
//            union(){
//                square([dockingstation_innerdepth,dockingstation_innerwidth]);
//                translate([0,-schalter_width_offset,0])
//                square([schalter_depth_offset,schalter_width_offset+.01]);
//                //ethernet
//                translate([-dockingstation_depth_offset,ethernet_offset-schalter_width_offset])                
//                    square([dockingstation_width_offset*1.2,ethernet_width]);
//            }
//        }
//      
//      
//      
        

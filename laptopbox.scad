mdfwidth=3;
innerwidth=380;
innerheight=200;
innerdepth=200;
inlayheight=100;
outerwidth=innerwidth+2*mdfwidth;
outerheight=innerheight+2*mdfwidth;
outerdepth=innerdepth+2*mdfwidth;
saegezahnstep=14;
dockingstation_innerwidth=290;
dockingstation_innerdepth=160;
dockingstation_depth_offset=10;
dockingstation_width_offset=10;
schalter_depth_offset=90;
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
hdmi_breite=30;
hdmi_offset=150;
power_offset=300;
power_breite=30;

module mycube(x){
    cube(x); 
}

module saegezahn(){
    for (i=[0:20]){
    translate([-0.005,-0.005,i*2*saegezahnstep])
        mycube([mdfwidth*1.01,mdfwidth*1.01,saegezahnstep]); 
    }
}

module saegezahn2(){
    for (i=[0:20]){
    translate([i*2*saegezahnstep-0.01,-0.01,0])
        square([saegezahnstep,mdfwidth*1.01]); 
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


//
//base
//difference(){
//    mycube([outerdepth,outerwidth,mdfwidth]);
//    translate([saegezahnstep,0,mdfwidth])
//        saegezahn_y();
//    translate([saegezahnstep,innerwidth+mdfwidth,mdfwidth])
//        saegezahn_y();
//    translate([0,0,mdfwidth])
//        saegezahn_x();
//}
////inlay
//translate([0,0,inlayheight])
//    difference(){
//        mycube([outerdepth,outerwidth,mdfwidth]);
//        translate([saegezahnstep,0,mdfwidth])
//            saegezahn_y();
//        translate([saegezahnstep,innerwidth+mdfwidth,mdfwidth])
//            saegezahn_y();
//        translate([0,0,mdfwidth])
//            saegezahn_x();
//    }
//
//sides  
//color("blue")
//    difference(){
//    mycube([outerdepth,mdfwidth,outerheight]);
//    saegezahn_z();
//    translate([0,0,mdfwidth])
//        saegezahn_y();
//    translate([0,0,inlayheight+mdfwidth])
//        saegezahn_y();
//    translate([0,0,innerheight+mdfwidth])
//        saegezahn_y();
//    translate([0,0,innerheight+mdfwidth*2])
//        saegezahn_y();
//    }
//
//    
//color("blue")
//    translate([0,innerwidth+mdfwidth,0])
//        difference(){
//            mycube([outerdepth,mdfwidth,outerheight]);
//            saegezahn_z();
//            translate([0,0,mdfwidth])
//                saegezahn_y();
//            translate([0,0,inlayheight+mdfwidth])
//                saegezahn_y();
//            translate([0,0,innerheight+mdfwidth])
//                saegezahn_y();
//            translate([0,0,innerheight+mdfwidth*2])
//                saegezahn_y();
//        }

//pseudoside
//color("blue")
//    difference(){ 
//    square([outerdepth,outerheight]);         
//    translate([mdfwidth,0])
//        saegezahn_y2();
//    translate([0,0])
//        saegezahn_z2();
//    translate([0,mdfwidth])
//        saegezahn_z2();
//    translate([0,inlayheight+mdfwidth])
//        saegezahn_z2();
//    translate([0,innerheight+mdfwidth])
//        saegezahn_z2(); 
//    }

//back
//color("green")
//    difference(){
//        mycube([mdfwidth,outerwidth,outerheight]);
//        translate([-0.01,-0.01,saegezahnstep])
//            saegezahn();
//        translate([-0.01,-0.01+innerwidth+mdfwidth,saegezahnstep])
//            saegezahn();
//        translate([0,saegezahnstep,mdfwidth])
//            saegezahn_x();
//        translate([0,saegezahnstep,mdfwidth+inlayheight])
//            saegezahn_x();
//        translate([0,saegezahnstep,innerheight+mdfwidth])
//            saegezahn_x();
//        translate([0,saegezahnstep,innerheight+mdfwidth*2])
//            saegezahn_x();
////       hdmiloch
//        translate([-1,hdmi_offset,0])
//            mycube([15,hdmi_breite,dvd_hoehe]);  
////        steckerloch
//        translate([-1,power_offset,0])
//            mycube([15,power_breite,dvd_hoehe]);       
//    }
//    
//
//    
////    
//color("red")  
//    translate([0,0,innerheight])
//        difference(){
//            mycube([outerdepth,outerwidth,mdfwidth]);
//            translate([saegezahnstep,0,mdfwidth])
//                saegezahn_y();
//            translate([saegezahnstep,innerwidth+mdfwidth,mdfwidth])
//                saegezahn_y();
//            translate([0,0,mdfwidth])
//                saegezahn_x(); 
//            translate([0+dockingstation_depth_offset+fuesschen_hr_von_hinten,innerwidth-dockingstation_width_offset-fuesschen_hr_von_rechts])
//                cylinder(d=fuss_durchmesser,h=15,center=true);
//            translate([0+dockingstation_depth_offset+dockingstation_innerdepth-fuesschen_vr_von_vorne,innerwidth-dockingstation_width_offset-fuesschen_vr_von_rechts])
//                cylinder(d=fuss_durchmesser,h=15,center=true);
//            translate([0+dockingstation_depth_offset+fuesschen_hl_von_hinten,innerwidth-dockingstation_innerwidth-dockingstation_width_offset+fuesschen_hl_von_links])
//                cylinder(d=fuss_durchmesser,h=15,center=true);
//            translate([0+dockingstation_depth_offset+dockingstation_innerdepth-+fuesschen_vl_von_vorne,innerwidth-dockingstation_innerwidth-dockingstation_width_offset+fuesschen_vl_von_links])
//                cylinder(d=fuss_durchmesser,h=15,center=true);
//        }
//        
//color("pink")    
//    translate([0,0,innerheight+mdfwidth-0.1])
//        difference(){
//        mycube([outerdepth,outerwidth,mdfwidth]);
//        translate([saegezahnstep,0,mdfwidth])
//            saegezahn_y();
//        translate([saegezahnstep,innerwidth+mdfwidth,mdfwidth])
//            saegezahn_y();
//        translate([0,0,mdfwidth])
//            saegezahn_x();
//        translate([dockingstation_depth_offset,innerwidth-dockingstation_innerwidth-dockingstation_width_offset,-5])
//            union(){
//                mycube([dockingstation_innerdepth,dockingstation_innerwidth,14]);
//                translate([0,-schalter_width_offset,0])
//                mycube([schalter_depth_offset,schalter_width_offset+.01,14]);
//            }
//        }
//        

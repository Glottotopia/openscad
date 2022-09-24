spooldiameter = 20;
spoolheight = 55; 
spiel = 2; 
quiverheight = spoolheight*.66;
quiverwallwidth = 1;
quiverbottomwidth = spooldiameter+spiel; 
quivertopwidth = spooldiameter+spiel+spiel; 
quiverstep = 2;

framewidth = 72;
frameheight = 1200;
stepheight = 15; 
quivertilt = 40;

steps = 50;

hstep = framewidth/steps;
vstep = frameheight/steps;
//bend = .3; 
xHain = "niaHx";
 
module band(){
    difference(){ 
        for (i=[1:steps]){ 
            percentage =  (i/steps*2);
            offset = cos(percentage*360)*framewidth/2; 
            translate([-offset,vstep*i,0])             
                rotate([0,0,i*10])
               blob();            
        }   
        for (i=[1:steps]){ 
            percentage =  (i/steps*2);
            offset = cos(percentage*360)*framewidth/2;         
            if (i%quiverstep==0){
                translate([-offset,vstep*i,0]) 
                    quiverfull(tilt=quivertilt);     
            }    
            else{
                translate([-offset,vstep*i,0]) 
                    quiverfull(tilt=-60);     
            } 
        }
    }  
    for (i=[1:steps]){ 
        percentage =  (i/steps*2);
        offset = cos(percentage*360)*framewidth/2;         
        if (i%quiverstep==0){
            translate([-offset,vstep*i,0]) 
                quiver(tilt=quivertilt,letter=xHain[(i-1)/2%5]);
        }
        else{
            translate([-offset,vstep*i,0]) 
                quiver(tilt=-60,letter=xHain[i/2%5]);
        }
    }
}
 


module blob(){
    fn=floor(rands(0,30,1)[0])+4;
    rotates=rands(0,180,3);
    translates=rands(0,2,3);
    scalewidth=.2;
    scales=rands(1-scalewidth,1+scalewidth,3);    
    rotate(rotates)
        translate(translates)
            scale(scales)
                sphere(25,$fn=fn);
}

module quiver(tilt=0, letter=""){
    translate([tilt/5,0,spooldiameter/2])        
        rotate([-50,tilt,0])
            union(){
            difference(){
                cylinder(h=quiverheight+quiverwallwidth,d1=quiverbottomwidth+quiverwallwidth*2,d2=quivertopwidth+quiverwallwidth*2);
                translate([0,0,quiverwallwidth])
                    cylinder(h=quiverheight*2,d1=quiverbottomwidth,d2=quivertopwidth);                
            }
            translate([-5,-12,quiverheight-12])
                rotate([90,0,0])
                    linear_extrude(1)
                        text(letter); 
            
            thisrand1 =rands(-3,3,1)[0];
            thisrand2 =rands(-10,10,1)[0]; 
            rotate([0,0,60+thisrand1])
                translate([0,-11.5,quiverheight-12])
                    rotate([6,0+thisrand2,0])
                        leaf(); 
            thisrand1 =rands(-3,3,1)[0];
            thisrand2 =rands(-10,10,1)[0]; 
            rotate([0,0,-60-thisrand1])
                translate([0,-11.5,quiverheight-12]) 
                    rotate([6,0+thisrand2,0])
                        leaf(); 
            
            thisrand =rands(-10,10,1)[0];                      
            rotate([0,0,0])
                translate([0,-12,quiverheight-27])
                    rotate([6,0+thisrand,0])
                        leaf(); 
        }        
}
        
module quiverfull(tilt=0){
    translate([tilt/5,0,spooldiameter/2])
        rotate([-50,tilt,0]) 
                cylinder(h=quiverheight*1.5,d1=quiverbottomwidth+quiverwallwidth*2,d2=quivertopwidth);
        }
        
module leaf(){ 
    hull(){
        difference(){
                union(){
                    rotate([90,0,0])
                        scale([2,3])
                            cylinder(d=6,$fn=20,h=1);         
                    thisrand =rands(-.5,.5,1)[0]; 
                    translate([0,0,12])
                        rotate([90,30,0])
                         cylinder(d=3+thisrand,$fn=3,h=1);              
                }
            } 
          thisrand =rands(-3,3,1)[0]; 
          cylinder(d=3,h=10+thisrand);
    } 
}
        
difference(){ 
    band();  
    translate([0,0,-50])
    cube([4000,4000,100],center=true);
}
//quiver(letter="a");
        
     
        

mdfwidth = 3;
separatorwidth = mdfwidth; 
//contentlength = 3000;
mdfpercardheight = 29;
plaettchenperhex = 8; 
pseudohexforplaettchen = 6;
totalplaettchen = 108;
plaettchendurchmesser1 = 75;
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
    translate([-kantenlaenge/2-mdfwidth,plaettchendurchmesser1/2+mdfwidth,-2*mdfwidth])
        rotate([90,0,0])
            linear_extrude(mdfwidth)
                square([kantenlaenge+2*mdfwidth,totalheight+2*mdfwidth]);
    rotate([0,0,60])
    translate([-kantenlaenge/2-mdfwidth,plaettchendurchmesser1/2+mdfwidth,-2*mdfwidth])
        rotate([90,0,0])
            linear_extrude(mdfwidth)
                square([kantenlaenge+2*mdfwidth,totalheight+2*mdfwidth]); 
    rotate([0,0,-60])
    translate([-kantenlaenge/2-mdfwidth,plaettchendurchmesser1/2+mdfwidth,-2*mdfwidth])
        rotate([90,0,0])
            linear_extrude(mdfwidth)
                square([kantenlaenge+2*mdfwidth,totalheight+2*mdfwidth]); 
}

module antiwanne(){
    rotate([0,0,180])
        translate([-kantenlaenge/2-mdfwidth,plaettchendurchmesser1/2+mdfwidth,-mdfwidth])
            rotate([90,0,0])
                linear_extrude(mdfwidth)
                    difference(){
                        square([kantenlaenge+2*mdfwidth,totalheight+2*mdfwidth]);
                            translate([0,pseudohexheight+mdfwidth])
                                square([kantenlaenge+2*mdfwidth,hexpileheight]);  
                            translate([0,pseudohexheight+mdfwidth+hexpileheight])
                                square([kantenlaenge+2*mdfwidth,cardheight+mdfwidth*2]);                        
                    }
    rotate([0,0,120])
        translate([-kantenlaenge/2-mdfwidth,plaettchendurchmesser1/2+mdfwidth,-mdfwidth])
            rotate([90,0,0])
                linear_extrude(mdfwidth)                    
                    difference(){
                        square([kantenlaenge+2*mdfwidth,totalheight+2*mdfwidth]);
                        translate([0,pseudohexheight+mdfwidth])
                            square([kantenlaenge+2*mdfwidth,hexpileheight]);                        
                    }
    rotate([0,0,-120])
        translate([-kantenlaenge/2-mdfwidth,plaettchendurchmesser1/2+mdfwidth,-mdfwidth])
            rotate([90,0,0])
                linear_extrude(mdfwidth)                    
                    difference(){
                        square([kantenlaenge+2*mdfwidth,totalheight+2*mdfwidth]);
                        translate([0,pseudohexheight+mdfwidth])
                            square([kantenlaenge+2*mdfwidth,hexpileheight]);                        
                    }
}

module hextileseparator(){
    cube([trapezelowerwidth,mdfwidth,(1+pseudohexforplaettchen)*mdfwidth]); 
    }
    
module hextileseparatorstar(){ 
xoffset = -8;
yoffset = -20.5;    
//                hextileseparator(); 
    rotate([0,0,0])
        color("blue")
        translate([xoffset,yoffset,0]) 
                hextileseparator();
    rotate([0,0,60])
        translate([xoffset,yoffset,0]) 
                hextileseparator();
    rotate([0,0,120])
        translate([xoffset,yoffset,0]) 
                hextileseparator();
    rotate([0,0,180])
        translate([xoffset,yoffset,0]) 
                hextileseparator();
    rotate([0,0,240])
        translate([xoffset,yoffset,0]) 
                hextileseparator();
    rotate([0,0,300])
        translate([xoffset,yoffset,0]) 
                hextileseparator();  
} 
    
module cardholder(){
    translate([0,0,(cardheight-10)/2])
    cube([mdfwidth,plaettchendurchmesser1,cardheight+mdfwidth], center=true);
}

module cardcover(){
    color("grey", .6)
    translate([-cardpilethickness/2,-cardwidth/2,-pseudohexheight+hexpileheight+cardheight/2-mdfwidth])
    rotate([90,0,0])
        linear_extrude(mdfwidth)
            union(){
                square([cardpilethickness,cardheight]);
                translate([5,cardheight+.1])
                square([cardpilethickness-10,mdfwidth+1]);
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



separator(-mdfwidth);
hextileseparatorstar();
//trapezepseudotilepile();
//color("yellow",.2)
//    cylinder(h=pseudohexheight,$fn=6,d=plaettchendurchmesser3);              
//separator(pseudohexheight);
//translate([0,0,pseudohexheight]){
//    hextilepile(); 
//}
//degenerateseparator(pseudohexheight+separatorwidth+hexpileheight);
translate([0,0,pseudohexheight+hexpileheight]){
//    deck();
    translate([cardnumber/2*cardthickness+mdfwidth/2+1,0,2*mdfwidth])
        color("#664422")
            cardholder();  
    translate([-(cardnumber/2*cardthickness+mdfwidth/2+1),0,2*mdfwidth])
        color("#664422")
            cardholder();  
//    translate([22,0,0])
//        trapezepile();
//    translate([-22,0,0])
//        rotate([0,0,180])
//        trapezepile();
//    color("green",.2)
//        cylinder(h=cardheight,$fn=6,d=plaettchendurchmesser3);
}
separator(pseudohexheight+hexpileheight+cardheight);
 
translate([0,0,mdfwidth])
color("#664422",.4)
    wanne();
color("#664422",.4)
    antiwanne();

cardcover();
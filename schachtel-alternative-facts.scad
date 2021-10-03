mdfwidth = 3;
separatorwidth = mdfwidth; 
//contentlength = 3000;
mdfpercardheight = 29;
plaettchenperhex = 8; 
pseudohexforplaettchen = 6;
totalplaettchen = 108;
plaettchendurchmesser1 = 75;
plaettchendurchmesser2 = 86;
spiel=1;
plaettchendurchmesser3 = plaettchendurchmesser2+spiel+mdfwidth*2;
hexpileheight = 58;
pseudohexheight = 21;
cardheight = 91;
cardwidth = 60;
cardthickness = .32;
cardnumber = 110;
numberofhextiles = 18;
trapezeupperwidth=22;
trapezelowerwidth=39;
trapezeheight=15;

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
 

trapezecolors = ["yellow","orange","brown","red"];

module trapezepile(){

    for (i=[0:mdfpercardheight]){
        index = i%4;
        translate([0,0,mdfwidth*i])
            color(trapezecolors[index],.8)
                trapeze();
    }
}

module trapezepseudotile(){
    rotate([0,0,0])
        translate([20,10,0])
            color(trapezecolors[0],.8)
                trapeze();
    rotate([0,0,60])
        translate([20,10,0])
            color(trapezecolors[1],.8)
                trapeze();
    rotate([0,0,120])
        translate([20,10,0])
            color(trapezecolors[2],.8)
                trapeze();
    rotate([0,0,180])
        translate([20,10,0])
            color(trapezecolors[3],.8)
                trapeze();
    rotate([0,0,240])
        translate([20,10,0])
            color(trapezecolors[0],.8)
                trapeze();
    rotate([0,0,300])
        translate([20,10,0])
            color(trapezecolors[1],.8)
                trapeze(); 
    translate([2,0,0])//keep order of translate rotate here
        rotate([0,0,0])
            color(trapezecolors[2],.8)
                trapeze();
    translate([-2,0,0])//keep order of translate rotate here
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
    colors = ["white","gray","beige"];
    for (i=[0:numberofhextiles]){
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
//    color("blue",.4)
//        translate([0,0,height])
//            cylinder(h=mdfwidth,$fn=6,d=plaettchendurchmesser3);
}

separator(-mdfwidth);
trapezepseudotilepile();
color("yellow",.2)
    cylinder(h=pseudohexheight,$fn=6,d=plaettchendurchmesser3);              
separator(pseudohexheight);
translate([0,0,pseudohexheight+separatorwidth]){
    hextilepile();
    color("red",.2)
        cylinder(h=hexpileheight,$fn=6,d=plaettchendurchmesser3); 
}
separator(pseudohexheight+separatorwidth+hexpileheight);
translate([0,0,pseudohexheight+separatorwidth+hexpileheight+separatorwidth]){
    deck();
    translate([20,0,0])
        trapezepile();
    translate([-20,0,0])
        rotate([0,0,180])
        trapezepile();
    color("green",.2)
        cylinder(h=cardheight,$fn=6,d=plaettchendurchmesser3);
}
separator(pseudohexheight+separatorwidth+hexpileheight+separatorwidth+cardheight);

//color("black")
//    translate([0,0,-mdfwidth])
//        cylinder(h=mdfwidth,$fn=6,d=plaettchendurchmesser2);
//color("black")
//    translate([0,0,pseudohexheight+hexpileheight+cardheight]) 
//            cylinder(h=mdfwidth,$fn=6,d=plaettchendurchmesser2); 
  
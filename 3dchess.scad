fieldwidth=40;
inner_fieldwidth=fieldwidth-.5;
innerst_fieldwidth=fieldwidth-2;
acrylwidth=6;
height=40;

module blackfield(){  
    difference(){
        square([inner_fieldwidth,inner_fieldwidth],center=true);
        square([innerst_fieldwidth,innerst_fieldwidth],center=true);
    }
}
module whitefield() {
    color("pink",.2)
    difference(){
        circle(d=inner_fieldwidth);
        circle(d=innerst_fieldwidth);
    }
}

module field (match=0){
    for(i=[0:4]){   
        for(j=[0:4]){ 
            translate([i*fieldwidth,j*fieldwidth])
                if ((i+j)%2==match){
                    color("blue",.2)
                    linear_extrude(6)
                    blackfield();
                }
                else{
                    color("pink",.2)
                    linear_extrude(6)
                    whitefield();
                }
        }
    }
    color("green",.1)
    linear_extrude(2){
        hull(){
        translate([-.5*fieldwidth,-.5*fieldwidth])
            circle(10);
        translate([-.5*fieldwidth,4.5*fieldwidth])
            circle(10);
        translate([4.5*fieldwidth,-.5*fieldwidth])
            circle(10);
        translate([4.5*fieldwidth,4.5*fieldwidth])
            circle(10);
        }
    }
    color("green",.1)
    linear_extrude(2){ 
        translate([-.5*fieldwidth,-.5*fieldwidth])
            difference(){
                circle(30);
                translate([-12,-12])
                    circle(6);
            }
        translate([-.5*fieldwidth,4.5*fieldwidth])
            difference(){
                circle(30);
                translate([-12,12])
                    circle(6);
            }
        translate([4.5*fieldwidth,-.5*fieldwidth])
            difference(){
                circle(30);
                translate([12,-12])
                    circle(6);
            }
        translate([4.5*fieldwidth,4.5*fieldwidth])
            difference(){
                circle(30);
                translate([12,12])
                    circle(6);
            }
    }
}

for(i=[0:4]){
    translate([0,0,(acrylwidth+height)*i])    
            field(match=i%2);
}


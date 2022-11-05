resolution = 100;
module edge(){  
    for (x=[0:39]){
        y = x^2.6/367;
        hull(){
        translate([x,y])
            sphere(d=1,$fn=resolution);
        x2 = x+1;
        y2 = (x+1)^2.6/367;
        translate([x2,y2])
            sphere(d=1,$fn=resolution); 
        }
    }
}

module leaf(){
    difference(){
        union(){    
            edge();
            mirror([-1,1]) 
                edge(); 
        }
        translate([0,0,-50])
            cube(100,center=true);
    }
}


scale([5,5,5])
difference()
{
    leaf();
    for (i=[0,10,20,30,40]){
        j = i^2.6/367;
        translate([i,j,0])
            cylinder(h=.5,center=true,$fn=resolution,d=.3);
    }
}



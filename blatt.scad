resolution = 10;
module edge(){  
    for (x=[0:39]){
        y = x^2.6/367;
        hull(){
        translate([x,y])
//            circle
            sphere(d=1,$fn=resolution);
        x2 = x+1;
        y2 = (x+1)^2.6/367;
        translate([x2,y2])
//            circle
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

module pegset(){
        for (i=[0,10,20,30,40]){
        j = i^2.6/367;
        pegresolution = .3;
        holeresolution = .6;
        translate([i,j,0])
            cylinder(h=.6,center=true,$fn=resolution,d=pegresolution);
    }
}
//scale([5,5,5])
//leaf();

//mirror([1,1,0])
scale([5,5,5])
union()
{
    leaf();
    pegset();
    mirror([-1,1])
        pegset();  
translate([36.6,-20.7,0])
mirror([1,1,0])
rotate([0,0,90])
rotate_extrude(convexity = 10,angle=30)
translate([42, 0, 0])
circle(d = 1, $fn=resolution);
}




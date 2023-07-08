schraubenhoehe=17;
schraubenkopfdicke=2;
d1=6;
d2=7;
bandbreite=10;
epsilon=0.1;
riefendicke=1;

use <spline.scad>;
//rotate_extrude(angle=270)
//    translate([4,0,0])
//        square([2,13]);
        
resolution = 200;

path = [
        [1,17],
        [5,16],
        [6,15],
        [5,13],
        [5,6],
        [6,0],
//        [5,-1],
        [5,-3]
        ];

color("red")        
difference(){        
    spline_lathe(path,subdivisions=4,resolution=resolution);
    translate([0,0,-epsilon-3])
    cylinder(h=schraubenhoehe,d=7,$fn=resolution);
}
    
color("black")
translate([0,0,schraubenhoehe-schraubenkopfdicke])
rotate_extrude()
translate([(d1+riefendicke)/2,0,0])
circle(d=riefendicke,$fn=resolution)    ;
    